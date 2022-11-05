#include "materials.hpp"

#include "enoki.hpp" // defines vdouble, load(), store()
#include "matrix.hpp"

static constexpr auto I = Identity<3>();

void foo(double * a, double * b, double * c) {
  for (int i = 0; i < 16; i += SIMD_SIZE){
    vdouble ai = enoki::load_unaligned<vdouble>(a + i);
    vdouble bi = enoki::load_unaligned<vdouble>(b + i);
    enoki::store_unaligned(c + i, ai + bi);
  }
}

void neohookean_model_scalar(NeohookeanMaterialData & data) {

  using mat3 = matrix<double, 3, 3>;

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

    mat3 sigma = ((lambda * log(J) - mu) * I + mu * B) / J;

    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 3; c++) {
        data.stress[r][c][i] = sigma(r, c);
      }
    }
  }

}

void neohookean_model_simd(NeohookeanMaterialData & data) {

  using mat3 = matrix<vdouble, 3, 3>;

  for (int i = 0; i < BLOCK_SIZE; i += SIMD_SIZE) {
    mat3 F = enoki::load(data.deformation_gradient, i);
    vdouble J = det(F);

    // note: there's an issue with doing matrix / vdouble,
    // so a temporary workaround is to do matrix * (1.0 / vdouble)
    // see: https://github.com/mitsuba-renderer/enoki/issues/128
    vdouble one_over_J = 1.0 / J; 

    vdouble lambda = enoki::load_unaligned<vdouble>(data.lambda + i);
    vdouble mu = enoki::load_unaligned<vdouble>(data.mu + i);
    
    mat3 B = dot(F, transpose(F));
    mat3 sigma = ((lambda * log(J) - mu) * I + mu * B) * one_over_J;

    enoki::store(data.stress, i, sigma);
  }

}
