#pragma once

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
constexpr auto& operator+=(matrix<S, m, n>& A, const matrix<T, m, n>& B) {
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      A(i,j) += B(i,j);
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

template <typename S, typename T, int m, int n, int p>
constexpr auto dot(const matrix<S, m, n>& A, const matrix<T, n, p>& B) {
  matrix<decltype(S{} * T{}), m, p> AB{};
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < p; j++) {
      for (int k = 0; k < n; k++) {
        AB(i,j) = AB(i,j) + A(i,k) * B(k,j);
      }
    }
  }
  return AB;
}