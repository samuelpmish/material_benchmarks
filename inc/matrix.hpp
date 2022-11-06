#pragma once

#include <cmath>

template < typename T, int m, int n >
struct matrix {
  constexpr T & operator()(int i, int j) { return values[i][j]; }
  constexpr const T & operator()(int i, int j) const { return values[i][j]; }

  auto operator/(T scale) const {
    matrix<T, m, n> C{};
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        C(i,j) = values[i][j] / scale;
      }
    }
    return C;
  }

  T values[m][n];

};

template <int dim>
constexpr matrix<double, dim, dim> Identity() {
  matrix<double, dim, dim> I{};
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      I(i,j) = (i == j);
    }
  }
  return I;
}

template <typename T, int m, int n>
constexpr auto transpose(const matrix<T, m, n>& A) {
  matrix<T, n, m> AT{};
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      AT(i,j) = A(j,i);
    }
  }
  return AT;
}

template <typename S, typename T, int m, int n>
constexpr auto operator+(const matrix<S, m, n >& A, const matrix<T, m, n >& B) {
  matrix<decltype(S{} + T{}), m, n> C{};
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      C(i,j) = A(i,j) + B(i,j);
    }
  }
  return C;
}

template <typename S, typename T, int m, int n>
constexpr auto operator-(const matrix<S, m, n >& A, const matrix<T, m, n >& B) {
  matrix<decltype(S{} - T{}), m, n> C{};
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      C(i,j) = A(i,j) - B(i,j);
    }
  }
  return C;
}

// scalar multiplication, not dot product!
template <typename S, typename T, int m, int n >
constexpr auto operator*(S scale, const matrix<T, m, n >& A) {
  matrix<decltype(T{} * S{}), m, n> C{};
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      C(i,j) = scale * A(i,j);
    }
  }
  return C;
}

template <typename S, typename T, int m, int n >
constexpr auto operator*(const matrix<T, m, n >& A, S scale) {
  matrix<decltype(T{} * S{}), m, n> C{};
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      C(i,j) = A(i,j) * scale;
    }
  }
  return C;
}

template <typename S, typename T, int m, int n>
constexpr auto& operator-=(matrix<S, m, n>& A, const matrix<T, m, n>& B) {
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      A(i,j) -= B(i,j);
    }
  }
  return A;
}
 
template <typename S, typename T, int m, int n>
constexpr auto& operator+=(matrix<S, m, n>& A, const matrix<T, m, n>& B) {
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      A(i,j) += B(i,j);
    }
  }
  return A;
}

// ?
template <typename S, typename T, int m, int n>
constexpr auto& operator/=(matrix<S, m, n>& A, const T & B) {
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      A(i,j) /= B;
    }
  }
  return A;
}

template <typename T>
constexpr auto det(const matrix<T, 2, 2>& A) {
  return A(0,0) * A(1,1) - A(0,1) * A(1,0);
}

template <typename T>
constexpr auto det(const matrix<T, 3, 3>& A) {
  return A(0,0) * A(1,1) * A(2,2) + A(0,1) * A(1,2) * A(2,0) +
         A(0,2) * A(1,0) * A(2,1) - A(0,0) * A(1,2) * A(2,1) -
         A(0,1) * A(1,0) * A(2,2) - A(0,2) * A(1,1) * A(2,0);
}

template <typename T>
constexpr matrix<T, 2, 2> inv(const matrix<T, 2, 2>& A) {
  T inv_detA(1.0 / det(A));

  matrix<T, 2, 2> invA{};

  invA(0,0) =  A(1,1) * inv_detA;
  invA(0,1) = -A(0,1) * inv_detA;
  invA(1,0) = -A(1,0) * inv_detA;
  invA(1,1) =  A(0,0) * inv_detA;

  return invA;
}

template < typename T >
constexpr matrix<T, 3, 3> inv(const matrix<T, 3, 3>& A) {
  auto inv_detA = 1.0 / det(A);

  matrix<T, 3, 3> invA{};

  invA(0,0) = (A(1,1) * A(2,2) - A(1,2) * A(2,1)) * inv_detA;
  invA(0,1) = (A(0,2) * A(2,1) - A(0,1) * A(2,2)) * inv_detA;
  invA(0,2) = (A(0,1) * A(1,2) - A(0,2) * A(1,1)) * inv_detA;
  invA(1,0) = (A(1,2) * A(2,0) - A(1,0) * A(2,2)) * inv_detA;
  invA(1,1) = (A(0,0) * A(2,2) - A(0,2) * A(2,0)) * inv_detA;
  invA(1,2) = (A(0,2) * A(1,0) - A(0,0) * A(1,2)) * inv_detA;
  invA(2,0) = (A(1,0) * A(2,1) - A(1,1) * A(2,0)) * inv_detA;
  invA(2,1) = (A(0,1) * A(2,0) - A(0,0) * A(2,1)) * inv_detA;
  invA(2,2) = (A(0,0) * A(1,1) - A(0,1) * A(1,0)) * inv_detA;

  return invA;
}

template <typename T, int n>
constexpr T tr(const matrix<T, n, n>& A) {
  T trA{};
  for (int i = 0; i < n; i++) {
    trA = trA + A(i,i);
  }
  return trA;
}
 
template <typename T, int n>
constexpr auto dev(const matrix<T, n, n>& A) {
  auto devA = A;
  auto trA = tr(A);
  for (int i = 0; i < n; i++) {
    devA(i,i) -= trA / n;
  }
  return devA;
}

template <typename T, int m, int n>
constexpr auto norm(const matrix<T, m, n>& A) {
  T fnorm_sq = 0;
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      fnorm_sq += A(i,j) * A(i,j);
    }
  }
  return sqrt(fnorm_sq);
}

inline double fmadd(double a, double x, double b) { return a * x + b; }

template <typename S, typename T, int m, int n, int p>
constexpr auto dot(const matrix<S, m, n>& A, const matrix<T, n, p>& B) {
  matrix<decltype(S{} * T{}), m, p> AB{};
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < p; j++) {
      AB(i,j) = 0.0;
      for (int k = 0; k < n; k++) {
        //AB(i,j) = AB(i,j) + A(i,k) * B(k,j);
        //AB(i,j) += A(i,k), B(k,j);
        AB(i,j) = fmadd(A(i,k), B(k,j), AB(i,j));
      }
    }
  }
  return AB;
}

template < int m, int n, int k >
matrix< double, m, n > load(const double (&arrays)[m][n][k], int i) {
  matrix< double, m, n> F;
  for (int r = 0; r < m; r++) {
    for (int c = 0; c < n; c++) {
      F(r,c) = arrays[r][c][i];
    }
  }
  return F;
}

template < int m, int n, int k >
void store(double (&arrays)[m][n][k], int i, const matrix< double, m, n > & data) {
  for (int r = 0; r < m; r++) {
    for (int c = 0; c < n; c++) {
      arrays[r][c][i] = data(r, c);
    }
  }
}