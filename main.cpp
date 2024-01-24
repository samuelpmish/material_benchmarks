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

//template void J2_plasticity_model_portable<vdouble>(PortableJ2MaterialData<vdouble> & data);

int main() {

  int n = 100'000;
  int num_runs = 10;

  neohookean_test(n, num_runs);
  J2_plasticity_test(n, num_runs);

}
