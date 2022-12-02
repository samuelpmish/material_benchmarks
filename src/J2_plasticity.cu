#include "materials.hpp"

#include "enoki.hpp" // defines vdouble, load(), store()
#include "matrix.hpp"

__device__ void J2_plasticity_model_cuda(J2MaterialDataScalar & data) {

  using mat3 = matrix<double, 3, 3>;

  static constexpr auto I = Identity<3>();

  // compute elastic predictor
  mat3 fbar_new = dot(data.F_new, inv(data.F_old));
  fbar_new /= cbrt(det(fbar_new));
  mat3 be_bar_new = dot(fbar_new, dot(data.be_bar_old, transpose(fbar_new)));
  double Ie_bar_new = tr(be_bar_new) / 3.0;
  mat3 s_new = data.mu * dev(be_bar_new);

  // check for plastic loading
  double y_new = norm(s_new) - sqrt(2.0 / 3.0) * (data.K * data.alpha + data.sigma_y);

  // return mapping algorithm
  if (y_new > 0) {
    double mu_bar = data.mu / Ie_bar_new;

    double delta_gamma = (3 * y_new) / (2 * data.K + 6 * mu_bar);

    mat3 n = s_new / norm(s_new);
    s_new -= 2 * mu_bar * delta_gamma * n;

    data.alpha += sqrt(2.0 / 3.0) * delta_gamma;
  }
  
  double J_new = det(data.F_new);
  double p_new = (0.5 * data.K) * (J_new - (1.0 / J_new));

  data.tau = (J_new * p_new) * I + s_new;
  data.be_bar_old = (s_new / data.mu) + Ie_bar_new * I;

}
