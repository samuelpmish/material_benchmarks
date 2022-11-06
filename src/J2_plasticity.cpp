#include "materials.hpp"

#include "enoki.hpp" // defines vdouble, load(), store()
#include "matrix.hpp"

static constexpr auto I = Identity<3>();

// Implementation of J2 material model with isotropic hardening
// from Box 9.1 of "Computational Inelasticity" by Simo and Hughes
//
// note: Simo and Hughes use the symbol "f" for both the yield condition function, 
//       as well as the relative deformation gradient. 
//       To avoid confusion in the source code below, this implementation uses 
//       "y" for the yield condition function and 
//       "f" for the relative deformation gradient.
// 
// note: where Simo and Hughes use subscripts of "n" and "n+1", 
//       this implementation uses a suffix of "_old" and "_new", respectively
void J2_plasticity_model_scalar(J2MaterialData & data) {

  using mat3 = matrix<double, 3, 3>;

  for (int i = 0; i < BLOCK_SIZE; i++) {

    // load material parameters and internal variables
    double K = data.K[i];
    double mu = data.mu[i];
    double alpha = data.alpha[i];
    double sigma_y = data.sigma_y[i];
    mat3 F_old = load(data.F_old, i);
    mat3 F_new = load(data.F_new, i);
    mat3 be_bar_old = load(data.be_bar, i);

    // compute elastic predictor
    mat3 fbar_new = dot(F_new, inv(F_old));
    fbar_new /= cbrt(det(fbar_new));
    mat3 be_bar_new = dot(fbar_new, dot(be_bar_old, transpose(fbar_new)));
    double Ie_bar_new = tr(be_bar_new) / 3.0;
    mat3 s_new = mu * dev(be_bar_new);

    // check for plastic loading
    double y_new = norm(s_new) - sqrt(2.0 / 3.0) * (K * alpha + sigma_y);

    // return mapping algorithm
    if (y_new > 0) {
      double mu_bar = mu / Ie_bar_new;

      double delta_gamma = (3 * y_new) / (2 * K + 6 * mu_bar);

      mat3 n = s_new / norm(s_new);
      s_new -= 2 * mu_bar * delta_gamma * n;

      alpha += sqrt(2.0 / 3.0) * delta_gamma;
    }
    
    double J_new = det(F_new);
    double p_new = (0.5 * K) * (J_new - (1.0 / J_new));

    store(data.F_old, i, F_new);
    store(data.tau, i, (J_new * p_new) * I + s_new);
    store(data.be_bar, i, (s_new / mu) + Ie_bar_new * I);
    data.alpha[i] = alpha;

  }

}

void J2_plasticity_model_simd(J2MaterialData & data) {

  using mat3 = matrix<vdouble, 3, 3>;

  for (int i = 0; i < BLOCK_SIZE; i += SIMD_SIZE) {

    // load material parameters and internal variables
    vdouble K = enoki::load_unaligned<vdouble>(data.K + i);
    vdouble mu = enoki::load_unaligned<vdouble>(data.mu + i);
    vdouble alpha = enoki::load_unaligned<vdouble>(data.alpha + i);
    vdouble sigma_y = enoki::load_unaligned<vdouble>(data.sigma_y + i);
    mat3 F_old = enoki::load(data.F_old, i);
    mat3 F_new = enoki::load(data.F_new, i);
    mat3 be_bar_old = enoki::load(data.be_bar, i);

    // compute elastic predictor
    mat3 fbar_new = dot(F_new, inv(F_old));
    fbar_new /= cbrt(det(fbar_new));
    mat3 be_bar_new = dot(fbar_new, dot(be_bar_old, transpose(fbar_new)));
    vdouble Ie_bar_new = tr(be_bar_new) / 3.0;
    mat3 s_new = mu * dev(be_bar_new);

    // check for plastic loading
    vdouble y_new = norm(s_new) - sqrt(2.0 / 3.0) * (K * alpha + sigma_y);

    // return mapping algorithm
    auto yielding = y_new > 0;

    {
      vdouble mu_bar = mu / Ie_bar_new;

      vdouble delta_gamma = (3 * y_new) / (2 * K + 6 * mu_bar);

      mat3 n = s_new * (1.0 / norm(s_new));

      s_new = enoki::select(yielding, s_new - 2 * mu_bar * delta_gamma * n, s_new);

      alpha = enoki::select(yielding, alpha + sqrt(2.0 / 3.0) * delta_gamma, alpha);
    }
    
    vdouble J_new = det(F_new);
    vdouble p_new = (0.5 * K) * (J_new - (1.0 / J_new));

    enoki::store(data.F_old, i, F_new);
    enoki::store(data.tau, i, (J_new * p_new) * I + s_new);
    enoki::store(data.be_bar, i, (s_new * (1.0 / mu)) + Ie_bar_new * I);
    enoki::store_unaligned<vdouble>(data.alpha + i, alpha);
  }

}