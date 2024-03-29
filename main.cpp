#include "materials.hpp"

#include "timer.hpp"
#include "enoki.hpp"

#include <omp.h>
#include <random>
#include <iostream>

namespace compiler {
static void please_dont_optimize_away([[maybe_unused]] void* p) { asm volatile("" : : "g"(p) : "memory"); }
}

double random_real() { 
  static std::default_random_engine generator;
  static std::uniform_real_distribution<double> distribution(-1.0, 1.0);
  return distribution(generator);
}

void neohookean_test(int n, int num_runs) {

  timer stopwatch;

  std::vector < NeohookeanMaterialData > data(n);

  std::cout << "NeoHookean model comparison test" << std::endl;
  std::cout << "  generating input data ... " << std::endl;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < BLOCK_SIZE; j++) {
      data[i].lambda[j] = 100.0 + 20.0 * random_real();
      data[i].mu[j]     = 100.0 + 20.0 * random_real();
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          data[i].deformation_gradient[row][col][j] = (row == col) + 0.1 * random_real();
        }
      }
    } 
  }

  std::cout << "       naive implementation: ";
  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    for (int i = 0; i < n; i++) {
      neohookean_model_scalar(data[i]);
    }
    compiler::please_dont_optimize_away(&data);
  }
  stopwatch.stop();
  std::cout << stopwatch.elapsed() / num_runs << "s per run" << std::endl;

  std::vector < double > answers(n * 9 * BLOCK_SIZE);
  int count = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < BLOCK_SIZE; j++) {
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          answers[count++] = data[i].stress[row][col][j];
        }
      }
    }
  }

  std::cout << "       omp simd implementation: ";
  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    #pragma omp for simd
    for (int i = 0; i < n; i++) {
      neohookean_model_scalar(data[i]);
    }
    compiler::please_dont_optimize_away(&data);
  }
  stopwatch.stop();
  std::cout << stopwatch.elapsed() / num_runs << "s per run" << std::endl;

  double norm = 0.0;
  double error = 0.0;
  count = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < BLOCK_SIZE; j++) {
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          double value = data[i].stress[row][col][j];
          double diff = answers[count++] - value;
          norm += value * value;
          error += diff * diff;
        }
      }
    }
  }
  std::cout << "relative frobenius error (stress): " << sqrt(error / norm) << std::endl;
  std::cout << std::endl;
  std::cout << std::endl;

  std::cout << "  vectorized implementation: ";
  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    for (int i = 0; i < n; i++) {
      neohookean_model_simd(data[i]);
    }
    compiler::please_dont_optimize_away(&data);
  }
  stopwatch.stop();
  std::cout << stopwatch.elapsed() / num_runs << "s per run" << std::endl;

  norm = 0.0;
  error = 0.0;
  count = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < BLOCK_SIZE; j++) {
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          double value = data[i].stress[row][col][j];
          double diff = answers[count++] - value;
          norm += value * value;
          error += diff * diff;
        }
      }
    }
  }
  std::cout << "relative frobenius error (stress): " << sqrt(error / norm) << std::endl;
  std::cout << std::endl;
  std::cout << std::endl;

}

void J2_plasticity_test(int n, int num_runs) {

  timer stopwatch;

  std::vector < J2MaterialData > data(n);

  std::cout << "J2 plasticity model comparison test" << std::endl;
  std::cout << "  generating input data ... " << std::endl;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < BLOCK_SIZE; j++) {
      data[i].K[j]  = 100.0 + 20.0 * random_real();
      data[i].mu[j] = 100.0 + 20.0 * random_real();
      data[i].sigma_y[j] = 0.1;
      data[i].alpha[j] = 1.0 + random_real();
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          data[i].F_old[row][col][j] = (row == col) + 0.1 * random_real();
          data[i].F_new[row][col][j] = (row == col) + 0.1 * random_real();
          
          double value = 0.1 * random_real();
          data[i].be_bar[row][col][j] = value;
          data[i].be_bar[col][row][j] = value;
        }
      }
    } 
  }

  std::vector < J2MaterialData > data_copy = data;

  std::cout << "       naive J2 implementation: ";
  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    #pragma omp simd
    for (int i = 0; i < n; i++) {
      J2_plasticity_model_scalar(data[i]);
    }
    compiler::please_dont_optimize_away(&data);
  }
  stopwatch.stop();
  std::cout << stopwatch.elapsed() / num_runs << "s per run" << std::endl;

  std::vector < double > F_old(n * 9 * BLOCK_SIZE);
  std::vector < double > be_bar(n * 9 * BLOCK_SIZE);
  std::vector < double > alpha(n * BLOCK_SIZE);
  std::vector < double > tau(n * 9 * BLOCK_SIZE);
  int count = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < BLOCK_SIZE; j++) {
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          F_old[count] = data[i].F_old[row][col][j];
          be_bar[count] = data[i].be_bar[row][col][j];
          tau[count] = data[i].tau[row][col][j];
          count++;
        }
      }
      alpha[i * BLOCK_SIZE + j] = data[i].alpha[j];
    }
  }

  data = data_copy;

  std::cout << "  vectorized J2 implementation: "; 
  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    for (int i = 0; i < n; i++) {
      J2_plasticity_model_simd(data[i]);
    }
    compiler::please_dont_optimize_away(&data);
  }
  stopwatch.stop();
  std::cout << stopwatch.elapsed() / num_runs << "s per run" << std::endl;

  double norm[4] = {};
  double error[4] = {};
  count = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < BLOCK_SIZE; j++) {
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          {
            double value = data[i].F_old[row][col][j];
            double diff = F_old[count] - value;
            norm[0] += value * value;
            error[0] += diff * diff;
          }

          {
            double value = data[i].be_bar[row][col][j];
            double diff = be_bar[count] - value;
            norm[1] += value * value;
            error[1] += diff * diff;
          }

          {
            double value = data[i].tau[row][col][j];
            double diff = tau[count] - value;
            norm[2] += value * value;
            error[2] += diff * diff;
          }

          count++;
        }
      }

      double value = data[i].alpha[j];
      double diff = alpha[i * BLOCK_SIZE + j] - value;
      norm[3] += value * value;
      error[3] += diff * diff;
    }
  }
  std::cout << "relative frobenius error (F):      " << sqrt(error[0] / norm[0]) << std::endl;
  std::cout << "relative frobenius error (be_bar): " << sqrt(error[1] / norm[1]) << std::endl;
  std::cout << "relative frobenius error (tau):    " << sqrt(error[2] / norm[2]) << std::endl;
  std::cout << "relative frobenius error (alpha):  " << sqrt(error[3] / norm[3]) << std::endl;
  std::cout << std::endl;
  std::cout << std::endl;

}

void axpy(std::vector< double > & z, double a, const std::vector< double > & x, 
    std::vector< double > & y) {
  for (int i = 0; i < x.size(); i++) {
    z[i] = a * x[i] + y[i];
  }
}

void axpy_SIMD(std::vector< double > & z, double a, const std::vector< double > & x, 
    std::vector< double > & y) {
  for (int i = 0; i < x.size(); i += SIMD_SIZE) {
    vdouble vx = enoki::load_unaligned<vdouble>(x.data() + i);
    vdouble vy = enoki::load_unaligned<vdouble>(y.data() + i);
    enoki::store_unaligned(z.data() + i, a * vx + vy);
  }
}

void axpy_test() {

  timer stopwatch;

  int n = 1 << 22;
  int num_runs = 16;

  std::vector < double > x(n);
  std::vector < double > y(n);
  std::vector < double > z(n);
  std::vector < double > expected(n);

  std::cout << "axpy comparison test" << std::endl;
  std::cout << "  generating input data ... " << std::endl;
  for (int i = 0; i < n; i++) {
    x[i] = random_real();
    y[i] = random_real();
    expected[i] = 2.0 * x[i] + y[i];
  }

  std::cout << "       original axpy implementation: ";
  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    axpy(z, 2.0, x, y);
    compiler::please_dont_optimize_away(&z);
  }
  stopwatch.stop();
  std::cout << stopwatch.elapsed() / num_runs << "s per run" << std::endl;


  std::cout << "       SIMD axpy implementation: ";
  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    axpy_SIMD(z, 2.0, x, y);
    compiler::please_dont_optimize_away(&z);
  }
  stopwatch.stop();
  std::cout << stopwatch.elapsed() / num_runs << "s per run" << std::endl;

}

int main() {

  int n = 100'000;
  int num_runs = 10;

  neohookean_test(n, num_runs);
  J2_plasticity_test(n, num_runs);
  axpy_test();

}
