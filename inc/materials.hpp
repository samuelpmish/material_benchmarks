static constexpr int BLOCK_SIZE = 16;

struct MaterialData {
  double lambda[BLOCK_SIZE];
  double mu[BLOCK_SIZE];
  double deformation_gradient[3][3][BLOCK_SIZE];
  double stress[3][3][BLOCK_SIZE];
};

void linear_isotropic_model(MaterialData & data);
void neohookean_model(MaterialData & data);
void j2_plasticity_model(MaterialData & data);
