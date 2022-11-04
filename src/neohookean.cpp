#include "materials.hpp"

#include "matrix.hpp"

#include <enoki/array.h>

static constexpr int SIMD_SIZE = 8;

using vdouble = enoki::Array<double, SIMD_SIZE>;

void foo(double * a, double * b, double * c) {
  for (int i = 0; i < 16; i += SIMD_SIZE){
    vdouble ai = enoki::load_unaligned<vdouble>(a + i);
    vdouble bi = enoki::load_unaligned<vdouble>(b + i);
    enoki::store_unaligned(c + i, ai + bi);
  }
}

//def neohookean_hyperelastic_model(_lambda, _mu):
//  I = np.identity(dudx.shape[0], f64)
//  J = np.linalg.det(I + dudx)
//  B_minus_I = dudx + np.transpose(dudx) + dudx @ np.transpose(dudx)
//  return (_lambda * np.log(J) * I + _mu * B_minus_I) / J

template < int m, int n, int k >
matrix< vdouble, m, n > load(const double (&arrays)[m][n][k], int i) {
  matrix< vdouble, 3, 3> F;
  for (int r = 0; r < 3; r++) {
    for (int c = 0; c < 3; c++) {
      F(r,c) = enoki::load_unaligned<vdouble>(arrays[r][c] + i);
    }
  }
  return F;
}

template < int m, int n, int k >
void store(double (&arrays)[m][n][k], int i, const matrix< vdouble, m, n > & data) {
  for (int r = 0; r < m; r++) {
    for (int c = 0; c < n; c++) {
      enoki::store_unaligned(arrays[r][c] + i, data(r, c));
    }
  }
}

void neohookean_model_simd(MaterialData & data) {
  using mat3 = matrix<vdouble, 3, 3>;

  static constexpr auto I = Identity<3>();

  for (int i = 0; i < BLOCK_SIZE; i++) {
    mat3 F = load(data.deformation_gradient, i);
    vdouble J = det(F);

    vdouble lambda = enoki::load_unaligned<vdouble>(data.lambda + i);
    vdouble mu = enoki::load_unaligned<vdouble>(data.mu + i);
    
    mat3 B = dot(F, transpose(F));
    mat3 sigma = (lambda * log(J) - mu) * I + mu * B;

    store(data.stress, i, sigma);
  }

}

void neohookean_model_scalar(MaterialData & data) {
  using mat3 = matrix<double, 3, 3>;

  static constexpr mat3 I = Identity<3>();

  for (int i = 0; i < BLOCK_SIZE; i++) {
    mat3 F;
    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 3; c++) {
        F(r,c) = data.deformation_gradient[r][c][i];
      }
    }
    
    double J = det(F);

    mat3 B = dot(F, transpose(F));

    double lambda = data.lambda[i];
    double mu = data.mu[i];

    mat3 sigma = (lambda * log(J) * I + mu * B) / J;

    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 3; c++) {
        data.stress[r][c][i] = sigma(r, c);
      }
    }
  }

}

void neohookean_model(MaterialData & data) {
  neohookean_model_scalar(data);
}