_Z24J2_plasticity_model_simdR14J2MaterialData: # @_Z24J2_plasticity_model_simdR14J2MaterialData
	.cfi_startproc
# %bb.0:
	subq	$1608, %rsp                     # imm = 0x648
	.cfi_def_cfa_offset 1616
	movq	$-8, %rax
	vbroadcastsd	.LCPI1_0(%rip), %zmm0   # zmm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vmovups	%zmm0, 960(%rsp)                # 64-byte Spill
	vxorpd	%xmm25, %xmm25, %xmm25
	vbroadcastsd	.LCPI1_1(%rip), %zmm0   # zmm0 = [NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN]
	vmovups	%zmm0, 896(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_2(%rip), %zmm0   # zmm0 = [3.3333333333333331E-1,3.3333333333333331E-1,3.3333333333333331E-1,3.3333333333333331E-1,3.3333333333333331E-1,3.3333333333333331E-1,3.3333333333333331E-1,3.3333333333333331E-1]
	vmovups	%zmm0, 832(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_3(%rip), %zmm0   # zmm0 = [-3.0E+0,-3.0E+0,-3.0E+0,-3.0E+0,-3.0E+0,-3.0E+0,-3.0E+0,-3.0E+0]
	vmovups	%zmm0, 768(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_4(%rip), %zmm0   # zmm0 = [5.4664601366395527E-1,5.4664601366395527E-1,5.4664601366395527E-1,5.4664601366395527E-1,5.4664601366395527E-1,5.4664601366395527E-1,5.4664601366395527E-1,5.4664601366395527E-1]
	vmovups	%zmm0, 704(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_5(%rip), %zmm0   # zmm0 = [-9.543822477150945E-1,-9.543822477150945E-1,-9.543822477150945E-1,-9.543822477150945E-1,-9.543822477150945E-1,-9.543822477150945E-1,-9.543822477150945E-1,-9.543822477150945E-1]
	vmovups	%zmm0, 640(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_6(%rip), %zmm0   # zmm0 = [1.1399983354717294E+0,1.1399983354717294E+0,1.1399983354717294E+0,1.1399983354717294E+0,1.1399983354717294E+0,1.1399983354717294E+0,1.1399983354717294E+0,1.1399983354717294E+0]
	vmovups	%zmm0, 576(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_7(%rip), %zmm0   # zmm0 = [4.0238979564544752E-1,4.0238979564544752E-1,4.0238979564544752E-1,4.0238979564544752E-1,4.0238979564544752E-1,4.0238979564544752E-1,4.0238979564544752E-1,4.0238979564544752E-1]
	vmovups	%zmm0, 512(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_8(%rip), %zmm0   # zmm0 = [-1.3466110473359522E-1,-1.3466110473359522E-1,-1.3466110473359522E-1,-1.3466110473359522E-1,-1.3466110473359522E-1,-1.3466110473359522E-1,-1.3466110473359522E-1,-1.3466110473359522E-1]
	vmovups	%zmm0, 448(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_9(%rip), %zmm0   # zmm0 = [7.9370052598409968E-1,7.9370052598409968E-1,7.9370052598409968E-1,7.9370052598409968E-1,7.9370052598409968E-1,7.9370052598409968E-1,7.9370052598409968E-1,7.9370052598409968E-1]
	vmovups	%zmm0, 384(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_11(%rip), %zmm0  # zmm0 = [6.2996052494743648E-1,6.2996052494743648E-1,6.2996052494743648E-1,6.2996052494743648E-1,6.2996052494743648E-1,6.2996052494743648E-1,6.2996052494743648E-1,6.2996052494743648E-1]
	vmovups	%zmm0, 320(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_13(%rip), %zmm0  # zmm0 = [9223372036854775808,9223372036854775808,9223372036854775808,9223372036854775808,9223372036854775808,9223372036854775808,9223372036854775808,9223372036854775808]
	vmovups	%zmm0, 256(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_14(%rip), %zmm0  # zmm0 = [+Inf,+Inf,+Inf,+Inf,+Inf,+Inf,+Inf,+Inf]
	vmovups	%zmm0, 192(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_15(%rip), %zmm0  # zmm0 = [8.1649658092772603E-1,8.1649658092772603E-1,8.1649658092772603E-1,8.1649658092772603E-1,8.1649658092772603E-1,8.1649658092772603E-1,8.1649658092772603E-1,8.1649658092772603E-1]
	vmovups	%zmm0, 128(%rsp)                # 64-byte Spill
	vbroadcastsd	.LCPI1_16(%rip), %zmm0  # zmm0 = [3.0E+0,3.0E+0,3.0E+0,3.0E+0,3.0E+0,3.0E+0,3.0E+0,3.0E+0]
	vmovups	%zmm0, 64(%rsp)                 # 64-byte Spill
	vbroadcastsd	.LCPI1_17(%rip), %zmm0  # zmm0 = [6.0E+0,6.0E+0,6.0E+0,6.0E+0,6.0E+0,6.0E+0,6.0E+0,6.0E+0]
	vmovups	%zmm0, (%rsp)                   # 64-byte Spill
	vbroadcastsd	.LCPI1_18(%rip), %zmm0  # zmm0 = [5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1]
	vmovupd	%zmm0, -64(%rsp)                # 64-byte Spill
	vmovupd	960(%rsp), %zmm28               # 64-byte Reload
	.p2align	4, 0x90
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	vmovups	64(%rdi,%rax,8), %zmm0
	vmovups	%zmm0, 1536(%rsp)               # 64-byte Spill
	vmovupd	320(%rdi,%rax,8), %zmm26
	vmovups	5440(%rdi,%rax,8), %zmm0
	vmovups	%zmm0, 1472(%rsp)               # 64-byte Spill
	vmovupd	832(%rdi,%rax,8), %zmm0
	vmovupd	1088(%rdi,%rax,8), %zmm2
	vmovupd	1344(%rdi,%rax,8), %zmm1
	vmovupd	1600(%rdi,%rax,8), %zmm3
	vmovupd	1856(%rdi,%rax,8), %zmm8
	vmovupd	2112(%rdi,%rax,8), %zmm4
	vmovupd	2368(%rdi,%rax,8), %zmm9
	vmovupd	2624(%rdi,%rax,8), %zmm10
	vmovupd	2880(%rdi,%rax,8), %zmm5
	vmovupd	5696(%rdi,%rax,8), %zmm22
	vmovupd	5952(%rdi,%rax,8), %zmm23
	vmovupd	6208(%rdi,%rax,8), %zmm19
	vmovupd	6464(%rdi,%rax,8), %zmm24
	vmovupd	6720(%rdi,%rax,8), %zmm21
	vmovupd	6976(%rdi,%rax,8), %zmm27
	vmovupd	7232(%rdi,%rax,8), %zmm29
	vmovups	7488(%rdi,%rax,8), %zmm6
	vmovups	%zmm6, -128(%rsp)               # 64-byte Spill
	vmovups	7744(%rdi,%rax,8), %zmm6
	vmovups	%zmm6, 1024(%rsp)               # 64-byte Spill
	vmovupd	3136(%rdi,%rax,8), %zmm30
	vmulpd	%zmm8, %zmm0, %zmm11
	vmulpd	%zmm5, %zmm11, %zmm6
	vmulpd	%zmm4, %zmm2, %zmm7
	vmulpd	%zmm9, %zmm7, %zmm12
	vaddpd	%zmm6, %zmm12, %zmm6
	vmulpd	%zmm3, %zmm1, %zmm12
	vmulpd	%zmm10, %zmm12, %zmm13
	vaddpd	%zmm6, %zmm13, %zmm6
	vmulpd	%zmm4, %zmm0, %zmm13
	vmulpd	%zmm10, %zmm13, %zmm14
	vsubpd	%zmm14, %zmm6, %zmm6
	vmulpd	%zmm3, %zmm2, %zmm15
	vmulpd	%zmm5, %zmm15, %zmm14
	vsubpd	%zmm14, %zmm6, %zmm6
	vmulpd	%zmm8, %zmm1, %zmm14
	vmulpd	%zmm9, %zmm14, %zmm16
	vsubpd	%zmm16, %zmm6, %zmm16
	vmulpd	%zmm5, %zmm8, %zmm6
	vmulpd	%zmm10, %zmm4, %zmm17
	vsubpd	%zmm17, %zmm6, %zmm17
	vmulpd	%zmm10, %zmm1, %zmm6
	vmulpd	%zmm5, %zmm2, %zmm18
	vsubpd	%zmm18, %zmm6, %zmm18
	vmovupd	3392(%rdi,%rax,8), %zmm6
	vsubpd	%zmm14, %zmm7, %zmm14
	vmulpd	%zmm9, %zmm4, %zmm4
	vmulpd	%zmm5, %zmm3, %zmm7
	vsubpd	%zmm7, %zmm4, %zmm20
	vmovupd	3648(%rdi,%rax,8), %zmm7
	vmulpd	%zmm5, %zmm0, %zmm4
	vmulpd	%zmm9, %zmm1, %zmm1
	vsubpd	%zmm1, %zmm4, %zmm1
	vmovupd	3904(%rdi,%rax,8), %zmm31
	vsubpd	%zmm13, %zmm12, %zmm12
	vmovupd	4160(%rdi,%rax,8), %zmm4
	vdivpd	%zmm16, %zmm28, %zmm16
	vmulpd	%zmm16, %zmm17, %zmm5
	vmulpd	%zmm16, %zmm18, %zmm13
	vmulpd	%zmm16, %zmm14, %zmm14
	vmulpd	%zmm16, %zmm20, %zmm18
	vmulpd	%zmm16, %zmm1, %zmm1
	vmulpd	%zmm16, %zmm12, %zmm12
	vmulpd	%zmm10, %zmm3, %zmm3
	vmulpd	%zmm9, %zmm8, %zmm8
	vsubpd	%zmm8, %zmm3, %zmm3
	vmulpd	%zmm16, %zmm3, %zmm3
	vmulpd	%zmm9, %zmm2, %zmm2
	vmulpd	%zmm10, %zmm0, %zmm0
	vsubpd	%zmm0, %zmm2, %zmm0
	vmulpd	%zmm16, %zmm0, %zmm0
	vsubpd	%zmm15, %zmm11, %zmm2
	vmulpd	%zmm16, %zmm2, %zmm8
	vmovapd	%zmm5, %zmm11
	vmovupd	%zmm22, 1344(%rsp)              # 64-byte Spill
	vfmadd213pd	%zmm25, %zmm22, %zmm11  # zmm11 = (zmm22 * zmm11) + zmm25
	vmovupd	%zmm23, 1280(%rsp)              # 64-byte Spill
	vfmadd231pd	%zmm18, %zmm23, %zmm11  # zmm11 = (zmm23 * zmm18) + zmm11
	vmovupd	%zmm19, 1408(%rsp)              # 64-byte Spill
	vfmadd231pd	%zmm3, %zmm19, %zmm11   # zmm11 = (zmm19 * zmm3) + zmm11
	vmovapd	%zmm13, %zmm2
	vfmadd213pd	%zmm25, %zmm22, %zmm2   # zmm2 = (zmm22 * zmm2) + zmm25
	vfmadd231pd	%zmm1, %zmm23, %zmm2    # zmm2 = (zmm23 * zmm1) + zmm2
	vfmadd231pd	%zmm0, %zmm19, %zmm2    # zmm2 = (zmm19 * zmm0) + zmm2
	vmovapd	%zmm14, %zmm16
	vfmadd213pd	%zmm25, %zmm22, %zmm16  # zmm16 = (zmm22 * zmm16) + zmm25
	vfmadd231pd	%zmm12, %zmm23, %zmm16  # zmm16 = (zmm23 * zmm12) + zmm16
	vfmadd231pd	%zmm8, %zmm19, %zmm16   # zmm16 = (zmm19 * zmm8) + zmm16
	vmovapd	%zmm5, %zmm17
	vmovupd	%zmm24, 1216(%rsp)              # 64-byte Spill
	vfmadd213pd	%zmm25, %zmm24, %zmm17  # zmm17 = (zmm24 * zmm17) + zmm25
	vmovupd	%zmm21, 1152(%rsp)              # 64-byte Spill
	vfmadd231pd	%zmm18, %zmm21, %zmm17  # zmm17 = (zmm21 * zmm18) + zmm17
	vmovupd	%zmm27, 1088(%rsp)              # 64-byte Spill
	vfmadd231pd	%zmm3, %zmm27, %zmm17   # zmm17 = (zmm27 * zmm3) + zmm17
	vmovapd	%zmm13, %zmm10
	vfmadd213pd	%zmm25, %zmm24, %zmm10  # zmm10 = (zmm24 * zmm10) + zmm25
	vfmadd231pd	%zmm1, %zmm21, %zmm10   # zmm10 = (zmm21 * zmm1) + zmm10
	vfmadd231pd	%zmm0, %zmm27, %zmm10   # zmm10 = (zmm27 * zmm0) + zmm10
	vmovapd	%zmm14, %zmm9
	vfmadd213pd	%zmm25, %zmm24, %zmm9   # zmm9 = (zmm24 * zmm9) + zmm25
	vfmadd231pd	%zmm12, %zmm21, %zmm9   # zmm9 = (zmm21 * zmm12) + zmm9
	vfmadd231pd	%zmm8, %zmm27, %zmm9    # zmm9 = (zmm27 * zmm8) + zmm9
	vfmadd213pd	%zmm25, %zmm29, %zmm5   # zmm5 = (zmm29 * zmm5) + zmm25
	vmovupd	-128(%rsp), %zmm15              # 64-byte Reload
	vfmadd231pd	%zmm18, %zmm15, %zmm5   # zmm5 = (zmm15 * zmm18) + zmm5
	vmovupd	1024(%rsp), %zmm21              # 64-byte Reload
	vfmadd231pd	%zmm3, %zmm21, %zmm5    # zmm5 = (zmm21 * zmm3) + zmm5
	vfmadd213pd	%zmm25, %zmm29, %zmm13  # zmm13 = (zmm29 * zmm13) + zmm25
	vfmadd231pd	%zmm1, %zmm15, %zmm13   # zmm13 = (zmm15 * zmm1) + zmm13
	vfmadd231pd	%zmm0, %zmm21, %zmm13   # zmm13 = (zmm21 * zmm0) + zmm13
	vfmadd213pd	%zmm25, %zmm29, %zmm14  # zmm14 = (zmm29 * zmm14) + zmm25
	vmovapd	%zmm29, %zmm27
	vfmadd231pd	%zmm12, %zmm15, %zmm14  # zmm14 = (zmm15 * zmm12) + zmm14
	vfmadd231pd	%zmm8, %zmm21, %zmm14   # zmm14 = (zmm21 * zmm8) + zmm14
	vmovapd	%zmm21, %zmm29
	vmulpd	%zmm10, %zmm11, %zmm0
	vmulpd	%zmm0, %zmm14, %zmm0
	vmulpd	%zmm9, %zmm2, %zmm1
	vmulpd	%zmm1, %zmm5, %zmm1
	vaddpd	%zmm1, %zmm0, %zmm0
	vmulpd	%zmm17, %zmm16, %zmm1
	vmulpd	%zmm1, %zmm13, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vmulpd	%zmm9, %zmm11, %zmm1
	vmulpd	%zmm1, %zmm13, %zmm1
	vsubpd	%zmm1, %zmm0, %zmm0
	vmulpd	%zmm17, %zmm2, %zmm1
	vmulpd	%zmm1, %zmm14, %zmm1
	vsubpd	%zmm1, %zmm0, %zmm0
	vmulpd	%zmm16, %zmm10, %zmm1
	vmulpd	%zmm1, %zmm5, %zmm1
	vsubpd	%zmm1, %zmm0, %zmm21
	vmovupd	896(%rsp), %zmm20               # 64-byte Reload
	vandpd	%zmm20, %zmm21, %zmm12
	vgetmantpd	$2, %zmm12, %zmm0
	vmulpd	%zmm0, %zmm0, %zmm1
	vmulpd	%zmm1, %zmm1, %zmm3
	vmovupd	704(%rsp), %zmm8                # 64-byte Reload
	vfmadd213pd	640(%rsp), %zmm0, %zmm8 # 64-byte Folded Reload
                                        # zmm8 = (zmm0 * zmm8) + mem
	vmovupd	512(%rsp), %zmm15               # 64-byte Reload
	vfmadd132pd	576(%rsp), %zmm15, %zmm0 # 64-byte Folded Reload
                                        # zmm0 = (zmm0 * mem) + zmm15
	vmulpd	448(%rsp), %zmm3, %zmm3         # 64-byte Folded Reload
	vaddpd	%zmm3, %zmm0, %zmm15
	vgetexppd	%zmm12, %zmm0
	vaddpd	%zmm28, %zmm0, %zmm18
	vfmadd231pd	%zmm8, %zmm1, %zmm15    # zmm15 = (zmm1 * zmm8) + zmm15
	vandpd	%zmm20, %zmm18, %zmm20
	vmovupd	832(%rsp), %zmm19               # 64-byte Reload
	vmulpd	%zmm19, %zmm20, %zmm0
	vrndscalepd	$1, %zmm0, %zmm22
	vfmadd231pd	768(%rsp), %zmm22, %zmm20 # 64-byte Folded Reload
                                        # zmm20 = (zmm22 * mem) + zmm20
	vcmplepd	%zmm18, %zmm25, %k1
	vcmpeqpd	%zmm28, %zmm20, %k2
	vmovupd	4416(%rdi,%rax,8), %zmm1
	vmovupd	4672(%rdi,%rax,8), %zmm8
	vmovupd	4928(%rdi,%rax,8), %zmm0
	vmovupd	5184(%rdi,%rax,8), %zmm3
	vmovupd	384(%rsp), %zmm23               # 64-byte Reload
	vblendmpd	.LCPI1_10(%rip){1to8}, %zmm23, %zmm23 {%k1}
	vmovupd	320(%rsp), %zmm24               # 64-byte Reload
	vblendmpd	.LCPI1_12(%rip){1to8}, %zmm24, %zmm24 {%k1}
	vmovapd	%zmm23, %zmm24 {%k2}
	vcmpneqpd	%zmm25, %zmm20, %k1
	vmulpd	%zmm24, %zmm15, %zmm15 {%k1}
	vmovdqu64	256(%rsp), %zmm20       # 64-byte Reload
	vpternlogq	$120, %zmm20, %zmm18, %zmm22
	vscalefpd	%zmm22, %zmm15, %zmm15
	vpternlogq	$120, %zmm20, %zmm21, %zmm15
	vmulpd	%zmm15, %zmm15, %zmm18
	vdivpd	%zmm18, %zmm21, %zmm18
	vsubpd	%zmm18, %zmm15, %zmm18
	vmulpd	%zmm19, %zmm18, %zmm18
	vsubpd	%zmm18, %zmm15, %zmm15
	vcmpltpd	192(%rsp), %zmm12, %k1          # 64-byte Folded Reload
	vmulpd	%zmm15, %zmm15, %zmm12
	vdivpd	%zmm12, %zmm21, %zmm12
	vsubpd	%zmm12, %zmm15, %zmm12
	vmulpd	%zmm19, %zmm12, %zmm12
	vsubpd	%zmm12, %zmm15, %zmm21 {%k1}
	vdivpd	%zmm21, %zmm11, %zmm15
	vdivpd	%zmm21, %zmm2, %zmm18
	vdivpd	%zmm21, %zmm16, %zmm20
	vdivpd	%zmm21, %zmm17, %zmm16
	vdivpd	%zmm21, %zmm10, %zmm12
	vdivpd	%zmm21, %zmm9, %zmm2
	vdivpd	%zmm21, %zmm5, %zmm17
	vdivpd	%zmm21, %zmm13, %zmm10
	vdivpd	%zmm21, %zmm14, %zmm5
	vmovapd	%zmm15, %zmm11
	vfmadd213pd	%zmm25, %zmm30, %zmm11  # zmm11 = (zmm30 * zmm11) + zmm25
	vfmadd231pd	%zmm18, %zmm6, %zmm11   # zmm11 = (zmm6 * zmm18) + zmm11
	vfmadd231pd	%zmm20, %zmm7, %zmm11   # zmm11 = (zmm7 * zmm20) + zmm11
	vmovapd	%zmm16, %zmm13
	vfmadd213pd	%zmm25, %zmm30, %zmm13  # zmm13 = (zmm30 * zmm13) + zmm25
	vfmadd231pd	%zmm12, %zmm6, %zmm13   # zmm13 = (zmm6 * zmm12) + zmm13
	vfmadd231pd	%zmm2, %zmm7, %zmm13    # zmm13 = (zmm7 * zmm2) + zmm13
	vfmadd213pd	%zmm25, %zmm17, %zmm30  # zmm30 = (zmm17 * zmm30) + zmm25
	vfmadd231pd	%zmm6, %zmm10, %zmm30   # zmm30 = (zmm10 * zmm6) + zmm30
	vfmadd231pd	%zmm7, %zmm5, %zmm30    # zmm30 = (zmm5 * zmm7) + zmm30
	vmovapd	%zmm15, %zmm6
	vfmadd213pd	%zmm25, %zmm31, %zmm6   # zmm6 = (zmm31 * zmm6) + zmm25
	vfmadd231pd	%zmm18, %zmm4, %zmm6    # zmm6 = (zmm4 * zmm18) + zmm6
	vfmadd231pd	%zmm20, %zmm1, %zmm6    # zmm6 = (zmm1 * zmm20) + zmm6
	vmovapd	%zmm16, %zmm7
	vfmadd213pd	%zmm25, %zmm31, %zmm7   # zmm7 = (zmm31 * zmm7) + zmm25
	vfmadd231pd	%zmm12, %zmm4, %zmm7    # zmm7 = (zmm4 * zmm12) + zmm7
	vfmadd231pd	%zmm2, %zmm1, %zmm7     # zmm7 = (zmm1 * zmm2) + zmm7
	vfmadd213pd	%zmm25, %zmm17, %zmm31  # zmm31 = (zmm17 * zmm31) + zmm25
	vfmadd231pd	%zmm4, %zmm10, %zmm31   # zmm31 = (zmm10 * zmm4) + zmm31
	vfmadd231pd	%zmm1, %zmm5, %zmm31    # zmm31 = (zmm5 * zmm1) + zmm31
	vmovapd	%zmm15, %zmm1
	vfmadd213pd	%zmm25, %zmm8, %zmm1    # zmm1 = (zmm8 * zmm1) + zmm25
	vfmadd231pd	%zmm18, %zmm0, %zmm1    # zmm1 = (zmm0 * zmm18) + zmm1
	vfmadd231pd	%zmm20, %zmm3, %zmm1    # zmm1 = (zmm3 * zmm20) + zmm1
	vmovapd	%zmm16, %zmm4
	vfmadd213pd	%zmm25, %zmm8, %zmm4    # zmm4 = (zmm8 * zmm4) + zmm25
	vfmadd231pd	%zmm12, %zmm0, %zmm4    # zmm4 = (zmm0 * zmm12) + zmm4
	vfmadd231pd	%zmm2, %zmm3, %zmm4     # zmm4 = (zmm3 * zmm2) + zmm4
	vfmadd213pd	%zmm25, %zmm17, %zmm8   # zmm8 = (zmm17 * zmm8) + zmm25
	vfmadd231pd	%zmm0, %zmm10, %zmm8    # zmm8 = (zmm10 * zmm0) + zmm8
	vfmadd231pd	%zmm3, %zmm5, %zmm8     # zmm8 = (zmm5 * zmm3) + zmm8
	vmovapd	%zmm11, %zmm0
	vfmadd213pd	%zmm25, %zmm15, %zmm0   # zmm0 = (zmm15 * zmm0) + zmm25
	vfmadd231pd	%zmm6, %zmm18, %zmm0    # zmm0 = (zmm18 * zmm6) + zmm0
	vfmadd231pd	%zmm1, %zmm20, %zmm0    # zmm0 = (zmm20 * zmm1) + zmm0
	vmovapd	%zmm13, %zmm3
	vfmadd213pd	%zmm25, %zmm15, %zmm3   # zmm3 = (zmm15 * zmm3) + zmm25
	vfmadd231pd	%zmm7, %zmm18, %zmm3    # zmm3 = (zmm18 * zmm7) + zmm3
	vfmadd231pd	%zmm4, %zmm20, %zmm3    # zmm3 = (zmm20 * zmm4) + zmm3
	vfmadd213pd	%zmm25, %zmm30, %zmm15  # zmm15 = (zmm30 * zmm15) + zmm25
	vfmadd231pd	%zmm18, %zmm31, %zmm15  # zmm15 = (zmm31 * zmm18) + zmm15
	vfmadd231pd	%zmm20, %zmm8, %zmm15   # zmm15 = (zmm8 * zmm20) + zmm15
	vmovapd	%zmm11, %zmm9
	vfmadd213pd	%zmm25, %zmm16, %zmm9   # zmm9 = (zmm16 * zmm9) + zmm25
	vfmadd231pd	%zmm6, %zmm12, %zmm9    # zmm9 = (zmm12 * zmm6) + zmm9
	vfmadd231pd	%zmm1, %zmm2, %zmm9     # zmm9 = (zmm2 * zmm1) + zmm9
	vmovapd	%zmm13, %zmm14
	vfmadd213pd	%zmm25, %zmm16, %zmm14  # zmm14 = (zmm16 * zmm14) + zmm25
	vfmadd231pd	%zmm7, %zmm12, %zmm14   # zmm14 = (zmm12 * zmm7) + zmm14
	vfmadd231pd	%zmm4, %zmm2, %zmm14    # zmm14 = (zmm2 * zmm4) + zmm14
	vfmadd213pd	%zmm25, %zmm30, %zmm16  # zmm16 = (zmm30 * zmm16) + zmm25
	vfmadd231pd	%zmm12, %zmm31, %zmm16  # zmm16 = (zmm31 * zmm12) + zmm16
	vfmadd231pd	%zmm2, %zmm8, %zmm16    # zmm16 = (zmm8 * zmm2) + zmm16
	vfmadd213pd	%zmm25, %zmm17, %zmm11  # zmm11 = (zmm17 * zmm11) + zmm25
	vfmadd231pd	%zmm6, %zmm10, %zmm11   # zmm11 = (zmm10 * zmm6) + zmm11
	vfmadd231pd	%zmm1, %zmm5, %zmm11    # zmm11 = (zmm5 * zmm1) + zmm11
	vfmadd213pd	%zmm25, %zmm17, %zmm13  # zmm13 = (zmm17 * zmm13) + zmm25
	vfmadd231pd	%zmm7, %zmm10, %zmm13   # zmm13 = (zmm10 * zmm7) + zmm13
	vfmadd231pd	%zmm4, %zmm5, %zmm13    # zmm13 = (zmm5 * zmm4) + zmm13
	vfmadd213pd	%zmm25, %zmm17, %zmm30  # zmm30 = (zmm17 * zmm30) + zmm25
	vfmadd231pd	%zmm31, %zmm10, %zmm30  # zmm30 = (zmm10 * zmm31) + zmm30
	vfmadd231pd	%zmm8, %zmm5, %zmm30    # zmm30 = (zmm5 * zmm8) + zmm30
	vaddpd	%zmm25, %zmm0, %zmm1
	vaddpd	%zmm1, %zmm14, %zmm1
	vaddpd	%zmm1, %zmm30, %zmm1
	vmulpd	%zmm19, %zmm1, %zmm4
	vsubpd	%zmm4, %zmm0, %zmm0
	vsubpd	%zmm4, %zmm14, %zmm1
	vsubpd	%zmm4, %zmm30, %zmm2
	vmulpd	%zmm0, %zmm26, %zmm5
	vmulpd	%zmm3, %zmm26, %zmm6
	vmulpd	%zmm15, %zmm26, %zmm7
	vmulpd	%zmm9, %zmm26, %zmm8
	vmulpd	%zmm1, %zmm26, %zmm9
	vmulpd	%zmm16, %zmm26, %zmm10
	vmulpd	%zmm11, %zmm26, %zmm30
	vmulpd	%zmm13, %zmm26, %zmm31
	vmulpd	%zmm2, %zmm26, %zmm11
	vmulpd	%zmm5, %zmm5, %zmm0
	vaddpd	%zmm25, %zmm0, %zmm0
	vmulpd	%zmm6, %zmm6, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vmulpd	%zmm7, %zmm7, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vmulpd	%zmm8, %zmm8, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vmulpd	%zmm9, %zmm9, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vmulpd	%zmm10, %zmm10, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vmulpd	%zmm30, %zmm30, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vmulpd	%zmm31, %zmm31, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vmulpd	%zmm11, %zmm11, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vsqrtpd	%zmm0, %zmm0
	vmovupd	1472(%rsp), %zmm20              # 64-byte Reload
	vmovupd	1536(%rsp), %zmm21              # 64-byte Reload
	vmulpd	%zmm20, %zmm21, %zmm1
	vaddpd	576(%rdi,%rax,8), %zmm1, %zmm1
	vmovupd	128(%rsp), %zmm19               # 64-byte Reload
	vmulpd	%zmm19, %zmm1, %zmm1
	vsubpd	%zmm1, %zmm0, %zmm1
	vdivpd	%zmm4, %zmm26, %zmm3
	vmulpd	64(%rsp), %zmm1, %zmm2          # 64-byte Folded Reload
	vaddpd	%zmm21, %zmm21, %zmm12
	vmulpd	(%rsp), %zmm3, %zmm13           # 64-byte Folded Reload
	vaddpd	%zmm13, %zmm12, %zmm12
	vdivpd	%zmm12, %zmm2, %zmm2
	vcmpltpd	%zmm1, %zmm25, %k1
	vdivpd	%zmm0, %zmm28, %zmm0
	vmulpd	%zmm0, %zmm5, %zmm1
	vmulpd	%zmm0, %zmm6, %zmm12
	vmulpd	%zmm0, %zmm7, %zmm13
	vmulpd	%zmm0, %zmm8, %zmm14
	vmulpd	%zmm0, %zmm9, %zmm15
	vmulpd	%zmm0, %zmm10, %zmm16
	vmulpd	%zmm0, %zmm30, %zmm17
	vmulpd	%zmm0, %zmm31, %zmm18
	vmulpd	%zmm0, %zmm11, %zmm0
	vaddpd	%zmm3, %zmm3, %zmm3
	vmulpd	%zmm2, %zmm3, %zmm3
	vmulpd	%zmm3, %zmm1, %zmm1
	vmulpd	%zmm3, %zmm12, %zmm12
	vmulpd	%zmm3, %zmm13, %zmm13
	vmulpd	%zmm3, %zmm14, %zmm14
	vmulpd	%zmm3, %zmm15, %zmm15
	vmulpd	%zmm3, %zmm16, %zmm16
	vmulpd	%zmm3, %zmm17, %zmm17
	vmulpd	%zmm3, %zmm18, %zmm18
	vmulpd	%zmm3, %zmm0, %zmm0
	vsubpd	%zmm1, %zmm5, %zmm5 {%k1}
	vsubpd	%zmm12, %zmm6, %zmm6 {%k1}
	vsubpd	%zmm13, %zmm7, %zmm7 {%k1}
	vsubpd	%zmm14, %zmm8, %zmm8 {%k1}
	vsubpd	%zmm15, %zmm9, %zmm9 {%k1}
	vsubpd	%zmm16, %zmm10, %zmm10 {%k1}
	vsubpd	%zmm17, %zmm30, %zmm30 {%k1}
	vsubpd	%zmm18, %zmm31, %zmm31 {%k1}
	vsubpd	%zmm0, %zmm11, %zmm11 {%k1}
	vmovupd	1344(%rsp), %zmm12              # 64-byte Reload
	vmovupd	1152(%rsp), %zmm16              # 64-byte Reload
	vmulpd	%zmm16, %zmm12, %zmm0
	vmulpd	%zmm29, %zmm0, %zmm0
	vmovupd	1280(%rsp), %zmm13              # 64-byte Reload
	vmovupd	1088(%rsp), %zmm17              # 64-byte Reload
	vmulpd	%zmm17, %zmm13, %zmm1
	vmulpd	%zmm27, %zmm1, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vmovupd	1408(%rsp), %zmm14              # 64-byte Reload
	vmovupd	1216(%rsp), %zmm15              # 64-byte Reload
	vmulpd	%zmm15, %zmm14, %zmm1
	vmovupd	-128(%rsp), %zmm3               # 64-byte Reload
	vmulpd	%zmm3, %zmm1, %zmm1
	vaddpd	%zmm0, %zmm1, %zmm0
	vmulpd	%zmm17, %zmm12, %zmm1
	vmulpd	%zmm3, %zmm1, %zmm1
	vsubpd	%zmm1, %zmm0, %zmm0
	vmulpd	%zmm15, %zmm13, %zmm1
	vmulpd	%zmm29, %zmm1, %zmm1
	vsubpd	%zmm1, %zmm0, %zmm0
	vmovupd	%zmm12, 832(%rdi,%rax,8)
	vmovupd	%zmm13, 1088(%rdi,%rax,8)
	vmovapd	%zmm14, %zmm1
	vmovupd	%zmm14, 1344(%rdi,%rax,8)
	vmovupd	%zmm15, 1600(%rdi,%rax,8)
	vmovapd	%zmm16, %zmm12
	vmulpd	%zmm16, %zmm14, %zmm1
	vmovupd	%zmm16, 1856(%rdi,%rax,8)
	vmulpd	%zmm27, %zmm1, %zmm1
	vsubpd	%zmm1, %zmm0, %zmm0
	vmovupd	%zmm17, 2112(%rdi,%rax,8)
	vmovupd	%zmm27, 2368(%rdi,%rax,8)
	vmulpd	-64(%rsp), %zmm21, %zmm1        # 64-byte Folded Reload
	vmovupd	%zmm3, 2624(%rdi,%rax,8)
	vdivpd	%zmm0, %zmm28, %zmm3
	vsubpd	%zmm3, %zmm0, %zmm3
	vmulpd	%zmm3, %zmm1, %zmm1
	vmovupd	%zmm29, 2880(%rdi,%rax,8)
	vmulpd	%zmm1, %zmm0, %zmm0
	vmulpd	%zmm25, %zmm0, %zmm1
	vaddpd	%zmm5, %zmm0, %zmm3
	vmovupd	%zmm3, 8000(%rdi,%rax,8)
	vaddpd	%zmm6, %zmm1, %zmm3
	vmovupd	%zmm3, 8256(%rdi,%rax,8)
	vaddpd	%zmm7, %zmm1, %zmm3
	vmovupd	%zmm3, 8512(%rdi,%rax,8)
	vaddpd	%zmm8, %zmm1, %zmm3
	vmovupd	%zmm3, 8768(%rdi,%rax,8)
	vaddpd	%zmm9, %zmm0, %zmm3
	vmovupd	%zmm3, 9024(%rdi,%rax,8)
	vaddpd	%zmm10, %zmm1, %zmm3
	vmovupd	%zmm3, 9280(%rdi,%rax,8)
	vaddpd	%zmm30, %zmm1, %zmm3
	vmovupd	%zmm3, 9536(%rdi,%rax,8)
	vaddpd	%zmm31, %zmm1, %zmm1
	vmovupd	%zmm1, 9792(%rdi,%rax,8)
	vaddpd	%zmm11, %zmm0, %zmm0
	vmovupd	%zmm0, 10048(%rdi,%rax,8)
	vmulpd	%zmm19, %zmm2, %zmm0
	vdivpd	%zmm26, %zmm28, %zmm1
	vmovapd	%zmm20, %zmm12
	vaddpd	%zmm0, %zmm20, %zmm12 {%k1}
	vmulpd	%zmm5, %zmm1, %zmm0
	vmulpd	%zmm6, %zmm1, %zmm2
	vmulpd	%zmm7, %zmm1, %zmm3
	vmulpd	%zmm8, %zmm1, %zmm5
	vmulpd	%zmm9, %zmm1, %zmm6
	vmulpd	%zmm10, %zmm1, %zmm7
	vmulpd	%zmm30, %zmm1, %zmm8
	vmulpd	%zmm31, %zmm1, %zmm9
	vmulpd	%zmm11, %zmm1, %zmm1
	vmulpd	%zmm25, %zmm4, %zmm10
	vaddpd	%zmm2, %zmm10, %zmm2
	vaddpd	%zmm3, %zmm10, %zmm3
	vaddpd	%zmm5, %zmm10, %zmm5
	vaddpd	%zmm7, %zmm10, %zmm7
	vaddpd	%zmm8, %zmm10, %zmm8
	vaddpd	%zmm9, %zmm10, %zmm9
	vaddpd	%zmm0, %zmm4, %zmm0
	vaddpd	%zmm6, %zmm4, %zmm6
	vaddpd	%zmm1, %zmm4, %zmm1
	vmovupd	%zmm0, 3136(%rdi,%rax,8)
	vmovupd	%zmm2, 3392(%rdi,%rax,8)
	vmovupd	%zmm3, 3648(%rdi,%rax,8)
	vmovupd	%zmm5, 3904(%rdi,%rax,8)
	vmovupd	%zmm6, 4160(%rdi,%rax,8)
	vmovupd	%zmm7, 4416(%rdi,%rax,8)
	vmovupd	%zmm8, 4672(%rdi,%rax,8)
	vmovupd	%zmm9, 4928(%rdi,%rax,8)
	vmovupd	%zmm1, 5184(%rdi,%rax,8)
	vmovupd	%zmm12, 5440(%rdi,%rax,8)
	addq	$8, %rax
	cmpq	$24, %rax
	jb	.LBB1_1
# %bb.2:
	addq	$1608, %rsp                     # imm = 0x648
	.cfi_def_cfa_offset 8
	vzeroupper
	retq