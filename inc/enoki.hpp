#pragma once

#include "matrix.hpp"
#include <enoki/array.h>

static constexpr int SIMD_SIZE = 4;

using vdouble = enoki::Array<double, SIMD_SIZE>;

template < int m, int n, int k >
matrix< vdouble, m, n > load(const double (&arrays)[m][n][k], int i) {
  matrix< vdouble, m, n> F;
  for (int r = 0; r < m; r++) {
    for (int c = 0; c < n; c++) {
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