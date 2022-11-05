#include "materials.hpp"

#include "timer.hpp"

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

  std::cout << "generating input data ... ";
  stopwatch.start();
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
  stopwatch.stop();
  std::cout << "done after " << stopwatch.elapsed() << "s" << std::endl;

  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    for (int i = 0; i < n; i++) {
      neohookean_model_scalar(data[i]);
    }
    compiler::please_dont_optimize_away(&data);
  }
  stopwatch.stop();
  std::cout << "naive implementation: " << stopwatch.elapsed() << "s" << std::endl;

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

  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    for (int i = 0; i < n; i++) {
      neohookean_model_simd(data[i]);
    }
    compiler::please_dont_optimize_away(&data);
  }
  stopwatch.stop();
  std::cout << "vectorized implementation: " << stopwatch.elapsed() << "s" << std::endl;

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
  std::cout << "relative frobenius error: " << sqrt(error / norm) << std::endl;

}

void J2_plasticity_test(int n, int num_runs) {

  timer stopwatch;

  std::vector < J2MaterialData > data(n);

  std::cout << "generating input data for J2 plasticity test ... ";
  stopwatch.start();
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < BLOCK_SIZE; j++) {
      data[i].K[j]  = 100.0 + 20.0 * random_real();
      data[i].mu[j] = 100.0 + 20.0 * random_real();
      data[i].sigma_y[j] = 1000.0;
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
  stopwatch.stop();
  std::cout << "done after " << stopwatch.elapsed() << "s" << std::endl;

  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    for (int i = 0; i < n; i++) {
      J2_plasticity_model_scalar(data[i]);
    }
    compiler::please_dont_optimize_away(&data);
  }
  stopwatch.stop();
  std::cout << "naive J2 implementation: " << stopwatch.elapsed() << "s" << std::endl;

  std::vector < double > answers(n * 9 * BLOCK_SIZE);
  int count = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < BLOCK_SIZE; j++) {
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          answers[count++] = data[i].tau[row][col][j];
        }
      }
    }
  }

  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    for (int i = 0; i < n; i++) {
      J2_plasticity_model_scalar(data[i]);
    }
    compiler::please_dont_optimize_away(&data);
  }
  stopwatch.stop();
  std::cout << "vectorized J2 implementation: " << stopwatch.elapsed() << "s" << std::endl;

  double norm = 0.0;
  double error = 0.0;
  count = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < BLOCK_SIZE; j++) {
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          double value = data[i].tau[row][col][j];
          double diff = answers[count++] - value;
          norm += value * value;
          error += diff * diff;
        }
      }
    }
  }
  std::cout << "relative frobenius error: " << sqrt(error / norm) << std::endl;

}

int main() {

  int n = 100'000;
  int num_runs = 5;

  neohookean_test(n, num_runs);
  J2_plasticity_test(n, num_runs);

}
