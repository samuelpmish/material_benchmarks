#pragma once

static constexpr int BLOCK_SIZE = 32;

struct NeohookeanMaterialData {

  // material properties
  double lambda[BLOCK_SIZE];
  double mu[BLOCK_SIZE];

  // input
  double deformation_gradient[3][3][BLOCK_SIZE];

  // output
  double stress[3][3][BLOCK_SIZE];

};

void neohookean_model_simd(NeohookeanMaterialData & data);
void neohookean_model_scalar(NeohookeanMaterialData & data);

struct J2MaterialData {

  // material properties
  double K[BLOCK_SIZE];
  double mu[BLOCK_SIZE];
  double sigma_y[BLOCK_SIZE];

  // internal variables
  double F_old[3][3][BLOCK_SIZE];
  double be_bar[3][3][BLOCK_SIZE];
  double alpha[BLOCK_SIZE];

  // input
  double F_new[3][3][BLOCK_SIZE];

  // output
  double tau[3][3][BLOCK_SIZE];

};

// Implementation of J2 material model with isotropic hardening
// from Box 9.1 of "Computational Inelasticity" by Simo and Hughes
void J2_plasticity_model_scalar(J2MaterialData & data);
void J2_plasticity_model_simd(J2MaterialData & data);