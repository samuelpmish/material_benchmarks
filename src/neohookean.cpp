#include "materials.hpp"

#include <iostream>
#include <enoki/array.h>

/* Don't forget to include the 'enoki' namespace */
using namespace enoki;

using vdouble = enoki::Array<float, SIMD_SIZE>;

void neohookean_model(MaterialData & data) {

  for (int i = 0; i < BLOCK_SIZE; i += SIMD_SIZE) {
    vdouble F[3][3];
    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 3; c++) {
        F[r][c] = load_unaligned<vdouble>(data.deformation_gradient_old[r][c]);
      }
    }

    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 3; c++) {
        vdouble sum{};
        for (int s = 0; s < 3; s++) {
          sum += F[r][s] * F[c][s] + 2;
        }
        store_unaligned(data.deformation_gradient_new[r][c], sum);
      }
    }

  }

}
