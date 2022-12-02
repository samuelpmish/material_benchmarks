#include "materials.hpp"

#include "timer.hpp"

#include <random>
#include <thread>
#include <iostream>

namespace compiler {
static void please_dont_optimize_away([[maybe_unused]] void* p) { asm volatile("" : : "g"(p) : "memory"); }
}

double random_real() { 
  static std::default_random_engine generator;
  static std::uniform_real_distribution<double> distribution(-1.0, 1.0);
  return distribution(generator);
}

void check_answers(const std::vector < J2MaterialData > & A, 
                   const std::vector < J2MaterialData > & B) {

  int n = A.size();

  double norm[4] = {};
  double error[4] = {};
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < BLOCK_SIZE; j++) {
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          {
            double value = A[i].F_old[row][col][j];
            double diff = B[i].F_old[row][col][j] - value;
            norm[0] += value * value;
            error[0] += diff * diff;
            if (diff * diff > 1.0e-10) {
              printf("%d, %d, %d, %d, %d, %f\n", 0, i, j, row, col, diff);
            }
          }

          {
            double value = A[i].be_bar[row][col][j];
            double diff = B[i].be_bar[row][col][j] - value;
            norm[1] += value * value;
            error[1] += diff * diff;
            if (diff * diff > 1.0e-10) {
              printf("%d, %d, %d, %d, %d, %f\n", 1, i, j, row, col, diff);
            }
          }

          {
            double value = A[i].tau[row][col][j];
            double diff = B[i].tau[row][col][j] - value;
            norm[2] += value * value;
            error[2] += diff * diff;
            if (diff * diff > 1.0e-10) {
              printf("%d, %d, %d, %d, %d, %f\n", 2, i, j, row, col, diff);
            }
          }
        }
      }

      double value = A[i].alpha[j];
      double diff = B[i].alpha[j] - value;
      norm[3] += value * value;
      error[3] += diff * diff;
      if (diff * diff > 1.0e-10) {
        printf("%d, %d, %d, %f\n", 2, i, j, diff);
      }
    }
  }
  if (sqrt(error[0] / norm[0]) > 1.0e-14) {
    std::cout << "relative frobenius error (F):      " << sqrt(error[0] / norm[0]) << std::endl;
  }
  if (sqrt(error[1] / norm[1]) > 1.0e-14) {
    std::cout << "relative frobenius error (be_bar): " << sqrt(error[1] / norm[1]) << std::endl;
  }
  if (sqrt(error[2] / norm[2]) > 1.0e-14) {
    std::cout << "relative frobenius error (tau):    " << sqrt(error[2] / norm[2]) << std::endl;
  }
  if (sqrt(error[3] / norm[3]) > 1.0e-14) {
    std::cout << "relative frobenius error (alpha):  " << sqrt(error[3] / norm[3]) << std::endl;
  }
}

__global__ void J2_kernel(J2MaterialData * data, int n) {

  int i = threadIdx.y + blockIdx.x * blockDim.y;
  if (i < n) {
    J2MaterialDataScalar tdata;

    tdata.K = data[i].K[threadIdx.x];
    tdata.mu = data[i].mu[threadIdx.x];
    tdata.sigma_y = data[i].sigma_y[threadIdx.x];
    tdata.alpha = data[i].alpha[threadIdx.x];
    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 3; c++) {
        tdata.F_old(r,c) = data[i].F_old[r][c][threadIdx.x];
        tdata.F_new(r,c) = data[i].F_new[r][c][threadIdx.x];
        tdata.be_bar_old(r,c) = data[i].be_bar[r][c][threadIdx.x];
      }
    }

    J2_plasticity_model_cuda(tdata); 

    data[i].alpha[threadIdx.x] = tdata.alpha;
    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 3; c++) {
        data[i].F_old[r][c][threadIdx.x] = tdata.F_new(r,c);
        data[i].tau[r][c][threadIdx.x] = tdata.tau(r,c);
        data[i].be_bar[r][c][threadIdx.x] = tdata.be_bar_old(r,c);
      }
    }

  }
  
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

  std::cout << "                    naive J2 implementation: ";
  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    for (int i = 0; i < n; i++) {
      J2_plasticity_model_scalar(data[i]);
    }
    compiler::please_dont_optimize_away(&data);
  }
  stopwatch.stop();
  std::cout << stopwatch.elapsed() / num_runs << "s per run" << std::endl;

  auto answers = data;

  data = data_copy;

  std::cout << "               vectorized J2 implementation: "; 
  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    for (int i = 0; i < n; i++) {
      J2_plasticity_model_simd(data[i]);
    }
    compiler::please_dont_optimize_away(&data);
  }
  stopwatch.stop();
  std::cout << stopwatch.elapsed() / num_runs << "s per run" << std::endl;

  check_answers(answers, data);

  data = data_copy;

  int num_threads = std::thread::hardware_concurrency();
  std::cout << "  " << num_threads << " threads + vectorized J2 implementation: "; 
  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    std::vector< std::thread > threads;
    for (int i = 0; i < num_threads; i++) {
      threads.push_back(std::thread([=, &data](){
        for (int k = i; k < n; k+=num_threads) {
          J2_plasticity_model_simd(data[k]);
        }
      }));
    }
    for (int i = 0; i < num_threads; i++) {
      threads[i].join();
    }
    compiler::please_dont_optimize_away(&data);
  }
  stopwatch.stop();
  std::cout << stopwatch.elapsed() / num_runs << "s per run" << std::endl;

  check_answers(answers, data);

  std::cout << "                     cuda J2 implementation: "; 
  J2MaterialData * data_d;
  cudaMalloc(&data_d, sizeof(J2MaterialData) * n);
  cudaMemcpy(data_d, &data_copy[0], sizeof(J2MaterialData) * n, cudaMemcpyHostToDevice);

  stopwatch.start();
  for (int k = 0; k < num_runs; k++) {
    dim3 block {BLOCK_SIZE, 4, 1};
    dim3 grid {uint32_t(n) / 4, 1, 1};
    J2_kernel<<<grid, block>>>(data_d, n);
    compiler::please_dont_optimize_away(&data_d);
  }
  cudaDeviceSynchronize();
  stopwatch.stop();
  std::cout << stopwatch.elapsed() / num_runs << "s per run" << std::endl;

  cudaMemcpy(&data[0], data_d, sizeof(J2MaterialData) * n, cudaMemcpyDeviceToHost);
  cudaDeviceSynchronize();
  cudaFree(data_d);

  check_answers(answers, data);

}

int main(int argc, char *argv[]) {

  int n = 1000000;
  int num_runs = 5;

  if (argc >= 2) {
    n = atoi(argv[1]);
  }

  //int n = 1 << 8;

  //neohookean_test(n, num_runs);
  J2_plasticity_test(n, num_runs);

}
