#pragma once

static constexpr int BLOCK_SIZE = 16;

struct MaterialData {
  double lambda[BLOCK_SIZE];
  double mu[BLOCK_SIZE];
  double deformation_gradient[3][3][BLOCK_SIZE];
  double stress[3][3][BLOCK_SIZE];
};

void neohookean_model_simd(MaterialData & data);
void neohookean_model_scalar(MaterialData & data);
