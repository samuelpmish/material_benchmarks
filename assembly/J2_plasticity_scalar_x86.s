_Z26J2_plasticity_model_scalarR14J2MaterialData: # @_Z26J2_plasticity_model_scalarR14J2MaterialData
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$360, %rsp                      # imm = 0x168
	.cfi_def_cfa_offset 384
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	xorl	%ebx, %ebx
	vxorpd	%xmm19, %xmm19, %xmm19
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_7:                                # %call.sqrt619
                                        #   in Loop: Header=BB0_1 Depth=1
	vmovapd	%xmm3, %xmm0
	vmovsd	%xmm17, 8(%rsp)                 # 8-byte Spill
	vmovapd	%xmm18, 64(%rsp)                # 16-byte Spill
	vmovupd	%ymm20, 288(%rsp)               # 32-byte Spill
	vmovupd	%ymm21, 256(%rsp)               # 32-byte Spill
	vmovsd	%xmm4, 48(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, 24(%rsp)                 # 8-byte Spill
	vmovsd	%xmm5, 16(%rsp)                 # 8-byte Spill
	vzeroupper
	callq	sqrt@PLT
	vmovsd	16(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	vmovsd	24(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmovsd	48(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	vmovupd	256(%rsp), %ymm21               # 32-byte Reload
	vmovupd	288(%rsp), %ymm20               # 32-byte Reload
	vmovapd	64(%rsp), %xmm18                # 16-byte Reload
	vmovsd	8(%rsp), %xmm17                 # 8-byte Reload
                                        # xmm17 = mem[0],zero
	vmovsd	32(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovupd	320(%rsp), %ymm16               # 32-byte Reload
	vmovsd	40(%rsp), %xmm15                # 8-byte Reload
                                        # xmm15 = mem[0],zero
	vxorpd	%xmm19, %xmm19, %xmm19
.LBB0_8:                                # %.split618
                                        #   in Loop: Header=BB0_1 Depth=1
	vdivsd	%xmm5, %xmm1, %xmm1
	vbroadcastsd	%xmm0, %ymm0
	vdivpd	%ymm0, %ymm20, %ymm6
	vdivpd	%ymm0, %ymm21, %ymm3
	vaddsd	%xmm4, %xmm4, %xmm4
	vunpcklpd	%xmm18, %xmm4, %xmm4    # xmm4 = xmm4[0],xmm18[0]
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmulpd	%xmm0, %xmm4, %xmm5
	vdivpd	%xmm0, %xmm4, %xmm0
	vbroadcastsd	%xmm5, %ymm4
	vmulpd	%ymm3, %ymm4, %ymm3
	vmulpd	%ymm6, %ymm4, %ymm4
	vpermilpd	$1, %xmm0, %xmm0        # xmm0 = xmm0[1,0]
	vmulsd	%xmm0, %xmm5, %xmm0
	vsubpd	%ymm4, %ymm20, %ymm20
	vsubpd	%ymm3, %ymm21, %ymm21
	vsubsd	%xmm0, %xmm18, %xmm18
	vfmadd231sd	.LCPI0_6(%rip), %xmm1, %xmm15 # xmm15 = (xmm1 * mem) + xmm15
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	vmovsd	248(%rsp), %xmm3                # 8-byte Reload
                                        # xmm3 = mem[0],zero
	vmovsd	216(%rsp), %xmm10               # 8-byte Reload
                                        # xmm10 = mem[0],zero
	vmulsd	%xmm3, %xmm10, %xmm0
	vmovsd	240(%rsp), %xmm4                # 8-byte Reload
                                        # xmm4 = mem[0],zero
	vmovsd	208(%rsp), %xmm8                # 8-byte Reload
                                        # xmm8 = mem[0],zero
	vmulsd	%xmm4, %xmm8, %xmm1
	vmovsd	200(%rsp), %xmm9                # 8-byte Reload
                                        # xmm9 = mem[0],zero
	vmulsd	%xmm1, %xmm9, %xmm1
	vmovsd	184(%rsp), %xmm11               # 8-byte Reload
                                        # xmm11 = mem[0],zero
	vfmadd231sd	%xmm0, %xmm11, %xmm1    # xmm1 = (xmm11 * xmm0) + xmm1
	vmovsd	232(%rsp), %xmm5                # 8-byte Reload
                                        # xmm5 = mem[0],zero
	vmovsd	224(%rsp), %xmm7                # 8-byte Reload
                                        # xmm7 = mem[0],zero
	vmulsd	%xmm7, %xmm5, %xmm0
	vmovsd	192(%rsp), %xmm6                # 8-byte Reload
                                        # xmm6 = mem[0],zero
	vfmadd213sd	%xmm1, %xmm6, %xmm0     # xmm0 = (xmm6 * xmm0) + xmm1
	vmulsd	%xmm3, %xmm8, %xmm1
	vfnmadd213sd	%xmm0, %xmm6, %xmm1     # xmm1 = -(xmm6 * xmm1) + xmm0
	vmulsd	%xmm4, %xmm7, %xmm0
	vfnmadd213sd	%xmm1, %xmm11, %xmm0    # xmm0 = -(xmm11 * xmm0) + xmm1
	vmulsd	%xmm5, %xmm10, %xmm1
	vfnmadd213sd	%xmm0, %xmm9, %xmm1     # xmm1 = -(xmm9 * xmm1) + xmm0
	vmulsd	.LCPI0_7(%rip), %xmm2, %xmm0
	vmovsd	.LCPI0_8(%rip), %xmm2           # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm2
	vmovsd	%xmm3, 768(%r14,%rbx,8)
	vmovsd	%xmm4, 1024(%r14,%rbx,8)
	vmovsd	%xmm5, 1280(%r14,%rbx,8)
	vmovsd	%xmm7, 1536(%r14,%rbx,8)
	vmovsd	%xmm10, 1792(%r14,%rbx,8)
	vmovsd	%xmm8, 2048(%r14,%rbx,8)
	vmovsd	%xmm9, 2304(%r14,%rbx,8)
	vmovsd	%xmm6, 2560(%r14,%rbx,8)
	vmovsd	%xmm11, 2816(%r14,%rbx,8)
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm19, %xmm0, %xmm1
	vaddsd	%xmm21, %xmm0, %xmm8
	vpermilpd	$1, %xmm21, %xmm3       # xmm3 = xmm21[1,0]
	vaddsd	%xmm3, %xmm1, %xmm9
	vextractf32x4	$1, %ymm21, %xmm5
	vaddsd	%xmm5, %xmm1, %xmm10
	vpermilpd	$1, %xmm5, %xmm7        # xmm7 = xmm5[1,0]
	vaddsd	%xmm7, %xmm1, %xmm11
	vaddsd	%xmm20, %xmm0, %xmm12
	vpermilpd	$1, %xmm20, %xmm6       # xmm6 = xmm20[1,0]
	vaddsd	%xmm6, %xmm1, %xmm13
	vextractf32x4	$1, %ymm20, %xmm4
	vaddsd	%xmm4, %xmm1, %xmm14
	vpermilpd	$1, %xmm4, %xmm2        # xmm2 = xmm4[1,0]
	vaddsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm18, %xmm0, %xmm0
	vmovsd	%xmm8, 7936(%r14,%rbx,8)
	vmovsd	%xmm9, 8192(%r14,%rbx,8)
	vmovsd	%xmm10, 8448(%r14,%rbx,8)
	vmovsd	%xmm11, 8704(%r14,%rbx,8)
	vmovsd	%xmm12, 8960(%r14,%rbx,8)
	vmovsd	%xmm13, 9216(%r14,%rbx,8)
	vmovsd	%xmm14, 9472(%r14,%rbx,8)
	vmovsd	%xmm1, 9728(%r14,%rbx,8)
	vmovsd	%xmm0, 9984(%r14,%rbx,8)
	vdivsd	%xmm16, %xmm21, %xmm9
	vdivsd	%xmm16, %xmm3, %xmm10
	vdivsd	%xmm16, %xmm5, %xmm3
	vdivsd	%xmm16, %xmm7, %xmm5
	vdivsd	%xmm16, %xmm20, %xmm7
	vdivsd	%xmm16, %xmm6, %xmm6
	vdivsd	%xmm16, %xmm4, %xmm4
	vdivsd	%xmm16, %xmm2, %xmm11
	vdivsd	%xmm16, %xmm18, %xmm8
	vmulsd	%xmm19, %xmm17, %xmm0
	vaddsd	%xmm9, %xmm17, %xmm1
	vaddsd	%xmm0, %xmm10, %xmm2
	vaddsd	%xmm3, %xmm0, %xmm3
	vaddsd	%xmm5, %xmm0, %xmm5
	vaddsd	%xmm7, %xmm17, %xmm7
	vaddsd	%xmm6, %xmm0, %xmm6
	vaddsd	%xmm4, %xmm0, %xmm4
	vaddsd	%xmm0, %xmm11, %xmm0
	vaddsd	%xmm8, %xmm17, %xmm8
	vmovsd	%xmm1, 3072(%r14,%rbx,8)
	vmovsd	%xmm2, 3328(%r14,%rbx,8)
	vmovsd	%xmm3, 3584(%r14,%rbx,8)
	vmovsd	%xmm5, 3840(%r14,%rbx,8)
	vmovsd	%xmm7, 4096(%r14,%rbx,8)
	vmovsd	%xmm6, 4352(%r14,%rbx,8)
	vmovsd	%xmm4, 4608(%r14,%rbx,8)
	vmovsd	%xmm0, 4864(%r14,%rbx,8)
	vmovsd	%xmm8, 5120(%r14,%rbx,8)
	vmovsd	%xmm15, 5376(%r14,%rbx,8)
	incq	%rbx
	cmpq	$32, %rbx
	je	.LBB0_10
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	vmovsd	(%r14,%rbx,8), %xmm0            # xmm0 = mem[0],zero
	vmovsd	%xmm0, 32(%rsp)                 # 8-byte Spill
	vmovsd	512(%r14,%rbx,8), %xmm0         # xmm0 = mem[0],zero
	vmovsd	%xmm0, 88(%rsp)                 # 8-byte Spill
	vbroadcastsd	256(%r14,%rbx,8), %ymm0
	vmovups	%ymm0, 320(%rsp)                # 32-byte Spill
	vmovsd	5376(%r14,%rbx,8), %xmm0        # xmm0 = mem[0],zero
	vmovsd	%xmm0, 40(%rsp)                 # 8-byte Spill
	vmovsd	768(%r14,%rbx,8), %xmm8         # xmm8 = mem[0],zero
	vmovsd	1024(%r14,%rbx,8), %xmm9        # xmm9 = mem[0],zero
	vmovsd	1280(%r14,%rbx,8), %xmm17       # xmm17 = mem[0],zero
	vmovsd	1536(%r14,%rbx,8), %xmm10       # xmm10 = mem[0],zero
	vmovsd	1792(%r14,%rbx,8), %xmm18       # xmm18 = mem[0],zero
	vmovsd	2048(%r14,%rbx,8), %xmm13       # xmm13 = mem[0],zero
	vmovsd	2304(%r14,%rbx,8), %xmm2        # xmm2 = mem[0],zero
	vmovsd	2560(%r14,%rbx,8), %xmm16       # xmm16 = mem[0],zero
	vmovsd	2816(%r14,%rbx,8), %xmm15       # xmm15 = mem[0],zero
	vmovsd	5632(%r14,%rbx,8), %xmm20       # xmm20 = mem[0],zero
	vmovsd	5888(%r14,%rbx,8), %xmm21       # xmm21 = mem[0],zero
	vmovsd	6144(%r14,%rbx,8), %xmm22       # xmm22 = mem[0],zero
	vmovsd	6400(%r14,%rbx,8), %xmm23       # xmm23 = mem[0],zero
	vmovsd	6656(%r14,%rbx,8), %xmm24       # xmm24 = mem[0],zero
	vmovsd	6912(%r14,%rbx,8), %xmm25       # xmm25 = mem[0],zero
	vmovsd	7168(%r14,%rbx,8), %xmm26       # xmm26 = mem[0],zero
	vmovsd	7424(%r14,%rbx,8), %xmm27       # xmm27 = mem[0],zero
	vmovsd	7680(%r14,%rbx,8), %xmm28       # xmm28 = mem[0],zero
	vmovsd	3072(%r14,%rbx,8), %xmm0        # xmm0 = mem[0],zero
	vmovsd	%xmm0, 256(%rsp)                # 8-byte Spill
	vmovsd	3328(%r14,%rbx,8), %xmm0        # xmm0 = mem[0],zero
	vmovsd	%xmm0, 288(%rsp)                # 8-byte Spill
	vmovsd	3584(%r14,%rbx,8), %xmm0        # xmm0 = mem[0],zero
	vmovsd	%xmm0, 64(%rsp)                 # 8-byte Spill
	vmovsd	3840(%r14,%rbx,8), %xmm0        # xmm0 = mem[0],zero
	vmovsd	%xmm0, 8(%rsp)                  # 8-byte Spill
	vmulsd	%xmm18, %xmm8, %xmm3
	vmulsd	%xmm13, %xmm9, %xmm4
	vmulsd	%xmm2, %xmm4, %xmm4
	vfmadd231sd	%xmm3, %xmm15, %xmm4    # xmm4 = (xmm15 * xmm3) + xmm4
	vmulsd	%xmm10, %xmm17, %xmm3
	vfmadd213sd	%xmm4, %xmm16, %xmm3    # xmm3 = (xmm16 * xmm3) + xmm4
	vmovapd	.LCPI0_0(%rip), %xmm0           # xmm0 = [-0.0E+0,-0.0E+0]
	vxorpd	%xmm0, %xmm8, %xmm4
	vmulsd	%xmm4, %xmm13, %xmm11
	vfmadd231sd	%xmm16, %xmm11, %xmm3   # xmm3 = (xmm11 * xmm16) + xmm3
	vxorpd	%xmm0, %xmm9, %xmm4
	vmulsd	%xmm4, %xmm10, %xmm12
	vfmadd231sd	%xmm15, %xmm12, %xmm3   # xmm3 = (xmm12 * xmm15) + xmm3
	vxorpd	%xmm0, %xmm17, %xmm4
	vmulsd	%xmm4, %xmm18, %xmm4
	vfmadd231sd	%xmm2, %xmm4, %xmm3     # xmm3 = (xmm4 * xmm2) + xmm3
	vmulsd	%xmm9, %xmm15, %xmm14
	vfmsub231sd	%xmm16, %xmm17, %xmm14  # xmm14 = (xmm17 * xmm16) - xmm14
	vfmadd231sd	%xmm13, %xmm9, %xmm4    # xmm4 = (xmm9 * xmm13) + xmm4
	vmulsd	%xmm17, %xmm2, %xmm5
	vfmadd213sd	%xmm11, %xmm10, %xmm17  # xmm17 = (xmm10 * xmm17) + xmm11
	vmulsd	%xmm8, %xmm16, %xmm6
	vfmsub231sd	%xmm2, %xmm9, %xmm6     # xmm6 = (xmm9 * xmm2) - xmm6
	vmulsd	%xmm10, %xmm15, %xmm7
	vfmsub231sd	%xmm13, %xmm2, %xmm7    # xmm7 = (xmm2 * xmm13) - xmm7
	vmulsd	%xmm18, %xmm2, %xmm2
	vfmsub231sd	%xmm10, %xmm16, %xmm2   # xmm2 = (xmm16 * xmm10) - xmm2
	vmovsd	4096(%r14,%rbx,8), %xmm0        # xmm0 = mem[0],zero
	vmovsd	%xmm0, 176(%rsp)                # 8-byte Spill
	vmulsd	%xmm13, %xmm16, %xmm0
	vmovsd	4352(%r14,%rbx,8), %xmm1        # xmm1 = mem[0],zero
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vfmsub231sd	%xmm15, %xmm18, %xmm0   # xmm0 = (xmm18 * xmm15) - xmm0
	vfmsub231sd	%xmm15, %xmm8, %xmm5    # xmm5 = (xmm8 * xmm15) - xmm5
	vmovsd	4608(%r14,%rbx,8), %xmm1        # xmm1 = mem[0],zero
	vmovsd	%xmm1, 48(%rsp)                 # 8-byte Spill
	vfmadd213sd	%xmm12, %xmm8, %xmm18   # xmm18 = (xmm8 * xmm18) + xmm12
	vmovsd	4864(%r14,%rbx,8), %xmm1        # xmm1 = mem[0],zero
	vmovsd	%xmm1, 24(%rsp)                 # 8-byte Spill
	vmovsd	.LCPI0_1(%rip), %xmm1           # xmm1 = mem[0],zero
	vdivsd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm3, %xmm0, %xmm1
	vmulsd	%xmm3, %xmm14, %xmm9
	vmulsd	%xmm3, %xmm4, %xmm8
	vmulsd	%xmm3, %xmm7, %xmm0
	vmulsd	%xmm3, %xmm5, %xmm4
	vmulsd	%xmm3, %xmm17, %xmm10
	vmulsd	%xmm3, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm6, %xmm6
	vmulsd	%xmm3, %xmm18, %xmm11
	vmovapd	%xmm1, %xmm5
	vmovapd	%xmm1, %xmm7
	vfmadd213sd	%xmm19, %xmm20, %xmm7   # xmm7 = (xmm20 * xmm7) + xmm19
	vfmadd231sd	%xmm0, %xmm21, %xmm7    # xmm7 = (xmm21 * xmm0) + xmm7
	vfmadd231sd	%xmm2, %xmm22, %xmm7    # xmm7 = (xmm22 * xmm2) + xmm7
	vfmadd213sd	%xmm19, %xmm23, %xmm1   # xmm1 = (xmm23 * xmm1) + xmm19
	vfmadd231sd	%xmm0, %xmm24, %xmm1    # xmm1 = (xmm24 * xmm0) + xmm1
	vmovapd	%xmm1, %xmm3
	vfmadd213sd	%xmm19, %xmm26, %xmm5   # xmm5 = (xmm26 * xmm5) + xmm19
	vfmadd231sd	%xmm0, %xmm27, %xmm5    # xmm5 = (xmm27 * xmm0) + xmm5
	vmovapd	%xmm9, %xmm0
	vfmadd213sd	%xmm19, %xmm20, %xmm0   # xmm0 = (xmm20 * xmm0) + xmm19
	vfmadd231sd	%xmm4, %xmm21, %xmm0    # xmm0 = (xmm21 * xmm4) + xmm0
	vfmadd231sd	%xmm6, %xmm22, %xmm0    # xmm0 = (xmm22 * xmm6) + xmm0
	vmovapd	%xmm0, %xmm12
	vfmadd231sd	%xmm2, %xmm25, %xmm3    # xmm3 = (xmm25 * xmm2) + xmm3
	vfmadd231sd	%xmm2, %xmm28, %xmm5    # xmm5 = (xmm28 * xmm2) + xmm5
	vmovapd	%xmm9, %xmm1
	vfmadd213sd	%xmm19, %xmm23, %xmm1   # xmm1 = (xmm23 * xmm1) + xmm19
	vfmadd231sd	%xmm4, %xmm24, %xmm1    # xmm1 = (xmm24 * xmm4) + xmm1
	vfmadd213sd	%xmm19, %xmm26, %xmm9   # xmm9 = (xmm26 * xmm9) + xmm19
	vfmadd231sd	%xmm4, %xmm27, %xmm9    # xmm9 = (xmm27 * xmm4) + xmm9
	vmovapd	%xmm8, %xmm0
	vmovsd	%xmm20, 248(%rsp)               # 8-byte Spill
	vfmadd213sd	%xmm19, %xmm20, %xmm0   # xmm0 = (xmm20 * xmm0) + xmm19
	vmovsd	%xmm21, 240(%rsp)               # 8-byte Spill
	vfmadd231sd	%xmm10, %xmm21, %xmm0   # xmm0 = (xmm21 * xmm10) + xmm0
	vmovsd	%xmm22, 232(%rsp)               # 8-byte Spill
	vfmadd231sd	%xmm11, %xmm22, %xmm0   # xmm0 = (xmm22 * xmm11) + xmm0
	vmovapd	%xmm0, %xmm4
	vfmadd231sd	%xmm6, %xmm25, %xmm1    # xmm1 = (xmm25 * xmm6) + xmm1
	vfmadd231sd	%xmm6, %xmm28, %xmm9    # xmm9 = (xmm28 * xmm6) + xmm9
	vmovapd	%xmm8, %xmm2
	vmovsd	%xmm23, 224(%rsp)               # 8-byte Spill
	vfmadd213sd	%xmm19, %xmm23, %xmm2   # xmm2 = (xmm23 * xmm2) + xmm19
	vmovsd	%xmm24, 216(%rsp)               # 8-byte Spill
	vfmadd231sd	%xmm10, %xmm24, %xmm2   # xmm2 = (xmm24 * xmm10) + xmm2
	vmovsd	%xmm25, 208(%rsp)               # 8-byte Spill
	vfmadd231sd	%xmm11, %xmm25, %xmm2   # xmm2 = (xmm25 * xmm11) + xmm2
	vmovsd	%xmm2, 160(%rsp)                # 8-byte Spill
	vmovsd	%xmm26, 200(%rsp)               # 8-byte Spill
	vfmadd213sd	%xmm19, %xmm26, %xmm8   # xmm8 = (xmm26 * xmm8) + xmm19
	vmovsd	%xmm27, 192(%rsp)               # 8-byte Spill
	vfmadd231sd	%xmm10, %xmm27, %xmm8   # xmm8 = (xmm27 * xmm10) + xmm8
	vmovsd	%xmm28, 184(%rsp)               # 8-byte Spill
	vfmadd231sd	%xmm11, %xmm28, %xmm8   # xmm8 = (xmm28 * xmm11) + xmm8
	vmovsd	%xmm7, 136(%rsp)                # 8-byte Spill
	vmulsd	%xmm1, %xmm7, %xmm0
	vmovapd	%xmm1, %xmm6
	vmovsd	%xmm1, 104(%rsp)                # 8-byte Spill
	vmovsd	%xmm12, 112(%rsp)               # 8-byte Spill
	vmulsd	%xmm2, %xmm12, %xmm1
	vmovsd	%xmm5, 120(%rsp)                # 8-byte Spill
	vmulsd	%xmm1, %xmm5, %xmm1
	vfmadd231sd	%xmm0, %xmm8, %xmm1     # xmm1 = (xmm8 * xmm0) + xmm1
	vmovsd	%xmm8, 144(%rsp)                # 8-byte Spill
	vmovsd	%xmm3, 128(%rsp)                # 8-byte Spill
	vmovsd	%xmm4, 96(%rsp)                 # 8-byte Spill
	vmulsd	%xmm3, %xmm4, %xmm0
	vmovsd	%xmm9, 152(%rsp)                # 8-byte Spill
	vfmadd213sd	%xmm1, %xmm9, %xmm0     # xmm0 = (xmm9 * xmm0) + xmm1
	vmulsd	%xmm7, %xmm2, %xmm1
	vfnmadd213sd	%xmm0, %xmm9, %xmm1     # xmm1 = -(xmm9 * xmm1) + xmm0
	vmulsd	%xmm3, %xmm12, %xmm2
	vfnmadd213sd	%xmm1, %xmm8, %xmm2     # xmm2 = -(xmm8 * xmm2) + xmm1
	vmulsd	%xmm4, %xmm6, %xmm0
	vfnmadd213sd	%xmm2, %xmm5, %xmm0     # xmm0 = -(xmm5 * xmm0) + xmm2
	vmovsd	5120(%r14,%rbx,8), %xmm1        # xmm1 = mem[0],zero
	vmovsd	%xmm1, 168(%rsp)                # 8-byte Spill
	vzeroupper
	callq	cbrt@PLT
	vxorpd	%xmm19, %xmm19, %xmm19
	vmovsd	136(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm3
	vmovsd	112(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm14
	vmovsd	96(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm13
	vmovsd	128(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm15
	vmovsd	104(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm12
	vmovsd	160(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm10
	vmovsd	120(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm9
	vmovsd	152(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm8
	vmovsd	144(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm11
	vmovapd	%xmm3, %xmm6
	vmovsd	256(%rsp), %xmm18               # 8-byte Reload
                                        # xmm18 = mem[0],zero
	vfmadd213sd	%xmm19, %xmm18, %xmm6   # xmm6 = (xmm18 * xmm6) + xmm19
	vmovsd	288(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vfmadd231sd	%xmm14, %xmm1, %xmm6    # xmm6 = (xmm1 * xmm14) + xmm6
	vmovsd	64(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vfmadd231sd	%xmm13, %xmm0, %xmm6    # xmm6 = (xmm0 * xmm13) + xmm6
	vmovapd	%xmm15, %xmm5
	vfmadd213sd	%xmm19, %xmm18, %xmm5   # xmm5 = (xmm18 * xmm5) + xmm19
	vfmadd231sd	%xmm12, %xmm1, %xmm5    # xmm5 = (xmm1 * xmm12) + xmm5
	vfmadd231sd	%xmm10, %xmm0, %xmm5    # xmm5 = (xmm0 * xmm10) + xmm5
	vfmadd213sd	%xmm19, %xmm9, %xmm18   # xmm18 = (xmm9 * xmm18) + xmm19
	vfmadd231sd	%xmm1, %xmm8, %xmm18    # xmm18 = (xmm8 * xmm1) + xmm18
	vfmadd231sd	%xmm0, %xmm11, %xmm18   # xmm18 = (xmm11 * xmm0) + xmm18
	vmovapd	%xmm3, %xmm16
	vmovsd	8(%rsp), %xmm20                 # 8-byte Reload
                                        # xmm20 = mem[0],zero
	vfmadd213sd	%xmm19, %xmm20, %xmm16  # xmm16 = (xmm20 * xmm16) + xmm19
	vmovsd	176(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vfmadd231sd	%xmm14, %xmm1, %xmm16   # xmm16 = (xmm1 * xmm14) + xmm16
	vmovsd	16(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vfmadd231sd	%xmm13, %xmm0, %xmm16   # xmm16 = (xmm0 * xmm13) + xmm16
	vmovapd	%xmm15, %xmm17
	vfmadd213sd	%xmm19, %xmm20, %xmm17  # xmm17 = (xmm20 * xmm17) + xmm19
	vfmadd231sd	%xmm12, %xmm1, %xmm17   # xmm17 = (xmm1 * xmm12) + xmm17
	vfmadd231sd	%xmm10, %xmm0, %xmm17   # xmm17 = (xmm0 * xmm10) + xmm17
	vfmadd213sd	%xmm19, %xmm9, %xmm20   # xmm20 = (xmm9 * xmm20) + xmm19
	vfmadd231sd	%xmm1, %xmm8, %xmm20    # xmm20 = (xmm8 * xmm1) + xmm20
	vfmadd231sd	%xmm0, %xmm11, %xmm20   # xmm20 = (xmm11 * xmm0) + xmm20
	vmovapd	%xmm3, %xmm2
	vmovsd	48(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vfmadd213sd	%xmm19, %xmm0, %xmm2    # xmm2 = (xmm0 * xmm2) + xmm19
	vmovsd	24(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vfmadd231sd	%xmm14, %xmm1, %xmm2    # xmm2 = (xmm1 * xmm14) + xmm2
	vmovsd	168(%rsp), %xmm4                # 8-byte Reload
                                        # xmm4 = mem[0],zero
	vfmadd231sd	%xmm13, %xmm4, %xmm2    # xmm2 = (xmm4 * xmm13) + xmm2
	vmovapd	%xmm15, %xmm7
	vfmadd213sd	%xmm19, %xmm0, %xmm7    # xmm7 = (xmm0 * xmm7) + xmm19
	vfmadd231sd	%xmm12, %xmm1, %xmm7    # xmm7 = (xmm1 * xmm12) + xmm7
	vfmadd231sd	%xmm10, %xmm4, %xmm7    # xmm7 = (xmm4 * xmm10) + xmm7
	vfmadd213sd	%xmm19, %xmm9, %xmm0    # xmm0 = (xmm9 * xmm0) + xmm19
	vfmadd231sd	%xmm1, %xmm8, %xmm0     # xmm0 = (xmm8 * xmm1) + xmm0
	vfmadd231sd	%xmm4, %xmm11, %xmm0    # xmm0 = (xmm11 * xmm4) + xmm0
	vmovapd	%xmm0, %xmm21
	vmovapd	%xmm6, %xmm1
	vfmadd213sd	%xmm19, %xmm3, %xmm1    # xmm1 = (xmm3 * xmm1) + xmm19
	vfmadd231sd	%xmm16, %xmm14, %xmm1   # xmm1 = (xmm14 * xmm16) + xmm1
	vfmadd231sd	%xmm2, %xmm13, %xmm1    # xmm1 = (xmm13 * xmm2) + xmm1
	vmovapd	%xmm5, %xmm0
	vfmadd213sd	%xmm19, %xmm3, %xmm0    # xmm0 = (xmm3 * xmm0) + xmm19
	vfmadd231sd	%xmm17, %xmm14, %xmm0   # xmm0 = (xmm14 * xmm17) + xmm0
	vfmadd231sd	%xmm7, %xmm13, %xmm0    # xmm0 = (xmm13 * xmm7) + xmm0
	vfmadd213sd	%xmm19, %xmm18, %xmm3   # xmm3 = (xmm18 * xmm3) + xmm19
	vfmadd231sd	%xmm14, %xmm20, %xmm3   # xmm3 = (xmm20 * xmm14) + xmm3
	vfmadd231sd	%xmm13, %xmm21, %xmm3   # xmm3 = (xmm21 * xmm13) + xmm3
	vmovapd	%xmm6, %xmm4
	vfmadd213sd	%xmm19, %xmm15, %xmm4   # xmm4 = (xmm15 * xmm4) + xmm19
	vfmadd231sd	%xmm16, %xmm12, %xmm4   # xmm4 = (xmm12 * xmm16) + xmm4
	vfmadd231sd	%xmm2, %xmm10, %xmm4    # xmm4 = (xmm10 * xmm2) + xmm4
	vunpcklpd	%xmm4, %xmm3, %xmm3     # xmm3 = xmm3[0],xmm4[0]
	vmovapd	%xmm5, %xmm4
	vfmadd213sd	%xmm19, %xmm15, %xmm4   # xmm4 = (xmm15 * xmm4) + xmm19
	vfmadd231sd	%xmm17, %xmm12, %xmm4   # xmm4 = (xmm12 * xmm17) + xmm4
	vfmadd231sd	%xmm7, %xmm10, %xmm4    # xmm4 = (xmm10 * xmm7) + xmm4
	vfmadd213sd	%xmm19, %xmm18, %xmm15  # xmm15 = (xmm18 * xmm15) + xmm19
	vfmadd231sd	%xmm12, %xmm20, %xmm15  # xmm15 = (xmm20 * xmm12) + xmm15
	vfmadd231sd	%xmm10, %xmm21, %xmm15  # xmm15 = (xmm21 * xmm10) + xmm15
	vfmadd213sd	%xmm19, %xmm9, %xmm6    # xmm6 = (xmm9 * xmm6) + xmm19
	vfmadd231sd	%xmm16, %xmm8, %xmm6    # xmm6 = (xmm8 * xmm16) + xmm6
	vmovupd	320(%rsp), %ymm16               # 32-byte Reload
	vfmadd231sd	%xmm2, %xmm11, %xmm6    # xmm6 = (xmm11 * xmm2) + xmm6
	vfmadd213sd	%xmm19, %xmm9, %xmm5    # xmm5 = (xmm9 * xmm5) + xmm19
	vfmadd231sd	%xmm17, %xmm8, %xmm5    # xmm5 = (xmm8 * xmm17) + xmm5
	vfmadd231sd	%xmm7, %xmm11, %xmm5    # xmm5 = (xmm11 * xmm7) + xmm5
	vunpcklpd	%xmm5, %xmm6, %xmm2     # xmm2 = xmm6[0],xmm5[0]
	vmovapd	%xmm18, %xmm6
	vfmadd213sd	%xmm19, %xmm9, %xmm6    # xmm6 = (xmm9 * xmm6) + xmm19
	vfmadd231sd	%xmm20, %xmm8, %xmm6    # xmm6 = (xmm8 * xmm20) + xmm6
	vfmadd231sd	%xmm21, %xmm11, %xmm6   # xmm6 = (xmm11 * xmm21) + xmm6
	vaddsd	%xmm19, %xmm1, %xmm5
	vaddsd	%xmm5, %xmm4, %xmm5
	vaddsd	%xmm5, %xmm6, %xmm5
	vdivsd	.LCPI0_2(%rip), %xmm5, %xmm17
	vsubsd	%xmm17, %xmm1, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vsubsd	%xmm17, %xmm4, %xmm1
	vunpcklpd	%xmm15, %xmm1, %xmm1    # xmm1 = xmm1[0],xmm15[0]
	vsubsd	%xmm17, %xmm6, %xmm4
	vinsertf128	$1, %xmm3, %ymm0, %ymm0
	vinsertf128	$1, %xmm2, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm16, %ymm20
	vmulpd	%ymm0, %ymm16, %ymm21
	vmulsd	%xmm4, %xmm16, %xmm18
	vpermilpd	$1, %xmm21, %xmm0       # xmm0 = xmm21[1,0]
	vmovapd	%xmm21, %xmm1
	vfmadd213sd	%xmm19, %xmm21, %xmm1   # xmm1 = (xmm21 * xmm1) + xmm19
	vfmadd231sd	%xmm0, %xmm0, %xmm1     # xmm1 = (xmm0 * xmm0) + xmm1
	vextractf32x4	$1, %ymm21, %xmm0
	vfmadd231sd	%xmm0, %xmm0, %xmm1     # xmm1 = (xmm0 * xmm0) + xmm1
	vpermilpd	$1, %xmm0, %xmm0        # xmm0 = xmm0[1,0]
	vfmadd213sd	%xmm1, %xmm0, %xmm0     # xmm0 = (xmm0 * xmm0) + xmm1
	vfmadd231sd	%xmm20, %xmm20, %xmm0   # xmm0 = (xmm20 * xmm20) + xmm0
	vpermilpd	$1, %xmm20, %xmm1       # xmm1 = xmm20[1,0]
	vfmadd213sd	%xmm0, %xmm1, %xmm1     # xmm1 = (xmm1 * xmm1) + xmm0
	vextractf32x4	$1, %ymm20, %xmm0
	vfmadd231sd	%xmm0, %xmm0, %xmm1     # xmm1 = (xmm0 * xmm0) + xmm1
	vpermilpd	$1, %xmm0, %xmm3        # xmm3 = xmm0[1,0]
	vfmadd213sd	%xmm1, %xmm3, %xmm3     # xmm3 = (xmm3 * xmm3) + xmm1
	vfmadd231sd	%xmm18, %xmm18, %xmm3   # xmm3 = (xmm18 * xmm18) + xmm3
	vucomisd	%xmm19, %xmm3
	jb	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	vsqrtsd	%xmm3, %xmm3, %xmm0
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_3:                                # %call.sqrt
                                        #   in Loop: Header=BB0_1 Depth=1
	vmovapd	%xmm3, %xmm0
	vmovsd	%xmm17, 8(%rsp)                 # 8-byte Spill
	vmovapd	%xmm18, 64(%rsp)                # 16-byte Spill
	vmovupd	%ymm20, 288(%rsp)               # 32-byte Spill
	vmovupd	%ymm21, 256(%rsp)               # 32-byte Spill
	vmovapd	%xmm3, 48(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sqrt@PLT
	vmovapd	48(%rsp), %xmm3                 # 16-byte Reload
	vmovupd	256(%rsp), %ymm21               # 32-byte Reload
	vmovupd	288(%rsp), %ymm20               # 32-byte Reload
	vmovapd	64(%rsp), %xmm18                # 16-byte Reload
	vmovsd	8(%rsp), %xmm17                 # 8-byte Reload
                                        # xmm17 = mem[0],zero
	vmovupd	320(%rsp), %ymm16               # 32-byte Reload
	vxorpd	%xmm19, %xmm19, %xmm19
.LBB0_4:                                # %.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vmovsd	40(%rsp), %xmm15                # 8-byte Reload
                                        # xmm15 = mem[0],zero
	vmovsd	32(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	88(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vfmadd231sd	%xmm15, %xmm2, %xmm1    # xmm1 = (xmm2 * xmm15) + xmm1
	vfmadd132sd	.LCPI0_3(%rip), %xmm0, %xmm1 # xmm1 = (xmm1 * mem) + xmm0
	vucomisd	%xmm19, %xmm1
	jbe	.LBB0_9
# %bb.5:                                #   in Loop: Header=BB0_1 Depth=1
	vdivsd	%xmm17, %xmm16, %xmm4
	vmulsd	.LCPI0_2(%rip), %xmm1, %xmm1
	vmulsd	.LCPI0_4(%rip), %xmm4, %xmm5
	vfmadd231sd	.LCPI0_5(%rip), %xmm2, %xmm5 # xmm5 = (xmm2 * mem) + xmm5
	vucomisd	%xmm19, %xmm3
	jb	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_1 Depth=1
	vsqrtsd	%xmm3, %xmm3, %xmm0
	jmp	.LBB0_8
.LBB0_10:
	addq	$360, %rsp                      # imm = 0x168
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	vzeroupper
	retq