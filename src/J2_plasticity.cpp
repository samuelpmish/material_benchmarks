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
    mat3 s_new = mu * dev(be_bar_new);

    // check for plastic loading
    double y_new = norm(s_new) - sqrt(2.0 / 3.0) * (K * alpha + sigma_y);

    // return mapping algorithm
    if (y_new > 0) {
      double Ie_bar_new = tr(be_bar_new) / 3.0;
      double mu_bar = mu / Ie_bar_new;

      double delta_gamma = (3 * y_new) / (2 * K + 6 * mu);

      mat3 n = s_new / norm(s_new);
      s_new -= 2 * mu_bar * delta_gamma * n;

      data.alpha[i] = alpha + sqrt(2.0 / 3.0) * delta_gamma;

      store(data.be_bar, i, (s_new / mu) + Ie_bar_new * I);
    }
    
    double J_new = det(F_new);
    double p_new = (0.5 * K) * (J_new - (1.0 / J_new));

    store(data.tau, i, (J_new * p_new) * I + s_new);

  }

}