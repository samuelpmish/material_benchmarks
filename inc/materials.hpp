static constexpr int BLOCK_SIZE = 16;
static constexpr int SIMD_SIZE = 4;

struct MaterialData {
  double deformation_gradient_new[3][3][BLOCK_SIZE];
  double deformation_gradient_old[3][3][BLOCK_SIZE];
  double stress[6][BLOCK_SIZE];
};

void linear_isotropic_model(MaterialData & data);
void neohookean_model(MaterialData & data);
void j2_plasticity_model(MaterialData & data);

