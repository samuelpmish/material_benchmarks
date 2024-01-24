_Z24J2_plasticity_model_simdR14J2MaterialData:
.LFB11528:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	vxorpd	%xmm7, %xmm7, %xmm7
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	.cfi_offset 13, -24
	leaq	256(%rdi), %r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	andq	$-32, %rsp
	subq	$1056, %rsp
	movq	%fs:40, %rax
	movq	%rax, 1048(%rsp)
	xorl	%eax, %eax
	leaq	992(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L19:
	vmovupd	(%rbx), %ymm9
	vmovupd	5376(%rbx), %ymm10
	movq	%r12, %rdi
	vmovupd	7424(%rbx), %ymm15
	vmovupd	256(%rbx), %ymm3
	vmovupd	512(%rbx), %ymm8
	vmovupd	5632(%rbx), %ymm6
	vmovapd	%ymm9, 640(%rsp)
	vmovupd	5888(%rbx), %ymm4
	vmovupd	6400(%rbx), %ymm9
	vmovapd	%ymm10, 416(%rsp)
	vmovupd	6656(%rbx), %ymm2
	vmovupd	6144(%rbx), %ymm10
	vmovapd	%ymm15, 864(%rsp)
	vmovupd	7168(%rbx), %ymm14
	vmovupd	7680(%rbx), %ymm15
	vmovapd	%ymm3, 608(%rsp)
	vmovupd	6912(%rbx), %ymm13
	vmovupd	2560(%rbx), %ymm5
	vmovapd	%ymm8, 384(%rsp)
	vmovupd	2816(%rbx), %ymm0
	vmovupd	2304(%rbx), %ymm8
	vmovapd	%ymm6, 800(%rsp)
	vmovupd	1280(%rbx), %ymm12
	vmovupd	1792(%rbx), %ymm1
	vmovapd	%ymm4, 768(%rsp)
	vmovupd	2048(%rbx), %ymm11
	vmovapd	%ymm10, 736(%rsp)
	vmovapd	%ymm9, 704(%rsp)
	vmulpd	%ymm1, %ymm12, %ymm10
	vmovapd	%ymm2, 960(%rsp)
	vmovapd	%ymm14, 896(%rsp)
	vmovapd	%ymm15, 832(%rsp)
	vmovapd	%ymm13, 928(%rsp)
	vmovupd	3072(%rbx), %ymm13
	vmovupd	3328(%rbx), %ymm6
	vmovupd	3584(%rbx), %ymm14
	vmovupd	1024(%rbx), %ymm3
	vmulpd	768(%rbx), %ymm11, %ymm9
	vmovupd	4864(%rbx), %ymm15
	vmovapd	%ymm6, 512(%rsp)
	vmovupd	4352(%rbx), %ymm6
	vmovupd	4096(%rbx), %ymm2
	vmovapd	%ymm14, 480(%rsp)
	vmovupd	3840(%rbx), %ymm14
	vmovapd	%ymm13, 544(%rsp)
	vmulpd	1536(%rbx), %ymm12, %ymm13
	vmovapd	%ymm6, 320(%rsp)
	vmovupd	4608(%rbx), %ymm6
	vmovapd	%ymm14, 448(%rsp)
	vmulpd	%ymm3, %ymm11, %ymm14
	vmovapd	%ymm6, 288(%rsp)
	vmulpd	1536(%rbx), %ymm3, %ymm6
	vmulpd	768(%rbx), %ymm1, %ymm3
	vmovapd	%ymm15, 672(%rsp)
	vmovapd	.LC13(%rip), %ymm15
	vmovapd	%ymm2, 352(%rsp)
	vmovupd	5120(%rbx), %ymm2
	vmovapd	%ymm2, 576(%rsp)
	vmulpd	%ymm0, %ymm1, %ymm2
	vmulpd	%ymm0, %ymm3, %ymm4
	vsubpd	%ymm6, %ymm3, %ymm3
	vfnmadd231pd	%ymm5, %ymm11, %ymm2
	vmulpd	%ymm8, %ymm11, %ymm11
	vfnmadd231pd	1536(%rbx), %ymm0, %ymm11
	vfmadd231pd	%ymm8, %ymm14, %ymm4
	vsubpd	%ymm10, %ymm14, %ymm14
	vfmadd231pd	%ymm5, %ymm13, %ymm4
	vsubpd	%ymm9, %ymm13, %ymm13
	vfnmadd231pd	%ymm5, %ymm9, %ymm4
	vfnmadd231pd	%ymm0, %ymm6, %ymm4
	vfnmadd231pd	%ymm8, %ymm10, %ymm4
	vdivpd	%ymm4, %ymm15, %ymm4
	vmulpd	%ymm5, %ymm12, %ymm15
	vfnmadd231pd	1024(%rbx), %ymm0, %ymm15
	vmulpd	768(%rbx), %ymm0, %ymm0
	vfnmadd132pd	%ymm8, %ymm0, %ymm12
	vmulpd	1536(%rbx), %ymm5, %ymm0
	vfnmadd132pd	%ymm8, %ymm0, %ymm1
	vmulpd	1024(%rbx), %ymm8, %ymm0
	vfnmadd231pd	768(%rbx), %ymm5, %ymm0
	vmovapd	800(%rsp), %ymm5
	vmovapd	%ymm5, %ymm8
	vmovapd	%ymm5, %ymm6
	vmovapd	%ymm5, %ymm10
	vmulpd	%ymm2, %ymm4, %ymm2
	vmulpd	%ymm15, %ymm4, %ymm15
	vmulpd	%ymm4, %ymm14, %ymm14
	vmulpd	%ymm11, %ymm4, %ymm11
	vmulpd	%ymm12, %ymm4, %ymm12
	vmulpd	%ymm4, %ymm13, %ymm13
	vfmadd132pd	%ymm2, %ymm7, %ymm8
	vmulpd	%ymm1, %ymm4, %ymm1
	vfmadd132pd	%ymm15, %ymm7, %ymm6
	vmulpd	%ymm0, %ymm4, %ymm0
	vfmadd132pd	%ymm14, %ymm7, %ymm10
	vmulpd	%ymm4, %ymm3, %ymm3
	vmovapd	768(%rsp), %ymm4
	vmovapd	736(%rsp), %ymm9
	vfmadd231pd	%ymm4, %ymm11, %ymm8
	vfmadd231pd	%ymm4, %ymm12, %ymm6
	vfmadd231pd	%ymm4, %ymm13, %ymm10
	vfmadd231pd	%ymm9, %ymm1, %ymm8
	vfmadd231pd	%ymm9, %ymm0, %ymm6
	vfmadd231pd	%ymm9, %ymm3, %ymm10
	vmovapd	704(%rsp), %ymm9
	vmovapd	%ymm9, %ymm5
	vmovapd	%ymm9, %ymm4
	vfmadd132pd	%ymm2, %ymm7, %ymm5
	vfmadd132pd	%ymm15, %ymm7, %ymm4
	vmovapd	%ymm8, 160(%rsp)
	vfmadd132pd	896(%rsp), %ymm7, %ymm2
	vfmadd132pd	%ymm14, %ymm7, %ymm9
	vmovapd	%ymm6, 96(%rsp)
	vfmadd231pd	960(%rsp), %ymm11, %ymm5
	vmovapd	%ymm10, 32(%rsp)
	vfmadd132pd	864(%rsp), %ymm2, %ymm11
	vfmadd231pd	928(%rsp), %ymm1, %ymm5
	vfmadd132pd	832(%rsp), %ymm11, %ymm1
	vmovapd	896(%rsp), %ymm11
	vfmadd231pd	960(%rsp), %ymm12, %ymm4
	vfmadd231pd	928(%rsp), %ymm0, %ymm4
	vfmadd231pd	960(%rsp), %ymm13, %ymm9
	vfmadd132pd	%ymm11, %ymm7, %ymm15
	vfmadd132pd	%ymm11, %ymm7, %ymm14
	vfmadd132pd	864(%rsp), %ymm15, %ymm12
	vfmadd132pd	864(%rsp), %ymm14, %ymm13
	vmovapd	832(%rsp), %ymm15
	vmulpd	%ymm5, %ymm6, %ymm11
	vmovapd	%ymm5, (%rsp)
	vfmadd231pd	928(%rsp), %ymm3, %ymm9
	vmovapd	%ymm1, 256(%rsp)
	vmovapd	%ymm4, 128(%rsp)
	vfmadd132pd	%ymm15, %ymm13, %ymm3
	vfmadd132pd	%ymm15, %ymm12, %ymm0
	vmulpd	%ymm4, %ymm8, %ymm15
	vmovapd	%ymm9, 64(%rsp)
	vmulpd	%ymm9, %ymm6, %ymm14
	vmulpd	%ymm5, %ymm10, %ymm13
	vmulpd	%ymm9, %ymm8, %ymm12
	vmovapd	%ymm3, 224(%rsp)
	vmovapd	%ymm0, %ymm2
	vmovapd	%ymm2, 192(%rsp)
	vmulpd	%ymm3, %ymm15, %ymm15
	vmulpd	%ymm4, %ymm10, %ymm0
	vfmadd132pd	%ymm1, %ymm15, %ymm14
	vfmadd132pd	%ymm2, %ymm14, %ymm13
	vfnmadd132pd	%ymm2, %ymm13, %ymm12
	vfnmadd132pd	%ymm3, %ymm12, %ymm11
	vfnmadd132pd	%ymm1, %ymm11, %ymm0
	vmovapd	%ymm0, 992(%rsp)
	vzeroupper
	addq	$32, %rbx
	call	_ZN5enoki4cbrtINS_5ArrayIdLm4EEEEEDaRKT_
	vmovapd	96(%rsp), %ymm6
	vmovapd	(%rsp), %ymm5
	vxorpd	%xmm7, %xmm7, %xmm7
	vmovapd	32(%rsp), %ymm10
	vmovapd	64(%rsp), %ymm9
	vmovapd	%ymm0, %ymm11
	vmovapd	160(%rsp), %ymm8
	vdivpd	%ymm0, %ymm6, %ymm6
	vmovapd	128(%rsp), %ymm4
	vmovapd	256(%rsp), %ymm1
	vmovapd	544(%rsp), %ymm13
	vmovapd	192(%rsp), %ymm2
	vmovapd	512(%rsp), %ymm12
	vmovapd	224(%rsp), %ymm3
	vmovapd	448(%rsp), %ymm14
	vdivpd	%ymm0, %ymm8, %ymm8
	vdivpd	%ymm0, %ymm10, %ymm10
	vdivpd	%ymm0, %ymm5, %ymm5
	vdivpd	%ymm0, %ymm4, %ymm4
	vdivpd	%ymm0, %ymm9, %ymm9
	vdivpd	%ymm0, %ymm1, %ymm1
	vdivpd	%ymm0, %ymm2, %ymm0
	vmovapd	%ymm13, %ymm2
	vfmadd132pd	%ymm8, %ymm7, %ymm2
	vfmadd231pd	%ymm12, %ymm6, %ymm2
	vdivpd	%ymm11, %ymm3, %ymm3
	vmovapd	480(%rsp), %ymm11
	vfmadd231pd	%ymm11, %ymm10, %ymm2
	vmovapd	%ymm2, %ymm15
	vmovapd	%ymm13, %ymm2
	vfmadd132pd	%ymm5, %ymm7, %ymm2
	vfmadd132pd	%ymm1, %ymm7, %ymm13
	vfmadd231pd	%ymm12, %ymm4, %ymm2
	vfmadd231pd	%ymm11, %ymm9, %ymm2
	vmovapd	%ymm2, 544(%rsp)
	vmovapd	%ymm13, %ymm2
	vmovapd	352(%rsp), %ymm13
	vfmadd231pd	%ymm12, %ymm0, %ymm2
	vmovapd	%ymm14, %ymm12
	vfmadd132pd	%ymm8, %ymm7, %ymm12
	vfmadd231pd	%ymm11, %ymm3, %ymm2
	vmovapd	320(%rsp), %ymm11
	vfmadd231pd	%ymm13, %ymm6, %ymm12
	vmovapd	%ymm2, 512(%rsp)
	vmovapd	%ymm14, %ymm2
	vfmadd132pd	%ymm1, %ymm7, %ymm14
	vfmadd132pd	%ymm5, %ymm7, %ymm2
	vfmadd231pd	%ymm11, %ymm10, %ymm12
	vfmadd231pd	%ymm13, %ymm4, %ymm2
	vfmadd231pd	%ymm11, %ymm9, %ymm2
	vmovapd	%ymm2, 480(%rsp)
	vmovapd	%ymm14, %ymm2
	vfmadd231pd	%ymm13, %ymm0, %ymm2
	vmovapd	288(%rsp), %ymm13
	vmovapd	%ymm2, %ymm14
	vmovapd	%ymm13, %ymm2
	vfmadd231pd	%ymm11, %ymm3, %ymm14
	vfmadd132pd	%ymm1, %ymm7, %ymm2
	vmovapd	672(%rsp), %ymm11
	vmovapd	%ymm14, 448(%rsp)
	vmovapd	%ymm13, %ymm14
	vfmadd132pd	%ymm5, %ymm7, %ymm13
	vfmadd132pd	%ymm8, %ymm7, %ymm14
	vfmadd231pd	%ymm11, %ymm4, %ymm13
	vfmadd231pd	576(%rsp), %ymm9, %ymm13
	vfmadd231pd	%ymm11, %ymm6, %ymm14
	vmovapd	%ymm2, %ymm11
	vfmadd231pd	672(%rsp), %ymm0, %ymm11
	vmovapd	%ymm15, %ymm2
	vmovapd	%ymm15, 672(%rsp)
	vmovapd	544(%rsp), %ymm15
	vfmadd231pd	576(%rsp), %ymm10, %ymm14
	vfmadd132pd	%ymm8, %ymm7, %ymm2
	vfmadd231pd	576(%rsp), %ymm3, %ymm11
	vfmadd132pd	%ymm8, %ymm7, %ymm15
	vfmadd132pd	512(%rsp), %ymm7, %ymm8
	vfmadd231pd	480(%rsp), %ymm6, %ymm15
	vfmadd231pd	%ymm12, %ymm6, %ymm2
	vfmadd132pd	448(%rsp), %ymm8, %ymm6
	vmovapd	672(%rsp), %ymm8
	vfmadd231pd	%ymm13, %ymm10, %ymm15
	vfmadd231pd	%ymm14, %ymm10, %ymm2
	vfmadd132pd	%ymm11, %ymm6, %ymm10
	vmovapd	%ymm8, %ymm6
	vfmadd132pd	%ymm5, %ymm7, %ymm6
	vfmadd231pd	%ymm12, %ymm4, %ymm6
	vfmadd231pd	%ymm14, %ymm9, %ymm6
	vmovapd	%ymm6, 672(%rsp)
	vmovapd	544(%rsp), %ymm6
	vfmadd132pd	%ymm5, %ymm7, %ymm6
	vfmadd132pd	512(%rsp), %ymm7, %ymm5
	vfmadd231pd	480(%rsp), %ymm4, %ymm6
	vfmadd132pd	448(%rsp), %ymm5, %ymm4
	vmovapd	%ymm9, %ymm5
	vfmadd132pd	%ymm11, %ymm4, %ymm5
	vfmadd231pd	%ymm13, %ymm9, %ymm6
	vmovapd	%ymm8, %ymm4
	vmovapd	640(%rsp), %ymm9
	vfmadd132pd	%ymm1, %ymm7, %ymm4
	vmovapd	%ymm14, %ymm8
	vmovapd	%ymm5, 576(%rsp)
	vfmadd132pd	%ymm0, %ymm4, %ymm12
	vmovapd	544(%rsp), %ymm4
	vfmadd132pd	%ymm1, %ymm7, %ymm4
	vfmadd132pd	512(%rsp), %ymm7, %ymm1
	vfmadd231pd	480(%rsp), %ymm0, %ymm4
	vfmadd132pd	448(%rsp), %ymm1, %ymm0
	vmovapd	%ymm6, %ymm1
	vfmadd132pd	%ymm3, %ymm12, %ymm8
	vfmadd132pd	%ymm3, %ymm4, %ymm13
	vfmadd132pd	%ymm11, %ymm0, %ymm3
	vaddpd	%ymm2, %ymm7, %ymm0
	vaddpd	%ymm6, %ymm0, %ymm0
	vaddpd	%ymm3, %ymm0, %ymm0
	vmulpd	.LC14(%rip), %ymm0, %ymm12
	vaddpd	%ymm2, %ymm7, %ymm0
	vaddpd	%ymm6, %ymm0, %ymm0
	vaddpd	%ymm3, %ymm0, %ymm0
	vfnmadd231pd	.LC14(%rip), %ymm0, %ymm2
	vfnmadd231pd	.LC14(%rip), %ymm0, %ymm1
	vfnmadd132pd	.LC14(%rip), %ymm3, %ymm0
	vmovapd	608(%rsp), %ymm3
	vmulpd	672(%rsp), %ymm3, %ymm4
	vmulpd	%ymm3, %ymm13, %ymm14
	vmulpd	%ymm3, %ymm2, %ymm2
	vmulpd	%ymm3, %ymm0, %ymm13
	vmulpd	%ymm3, %ymm15, %ymm6
	vmulpd	%ymm3, %ymm10, %ymm5
	vmulpd	%ymm3, %ymm1, %ymm11
	vmovapd	%ymm3, %ymm1
	vmulpd	576(%rsp), %ymm3, %ymm15
	vmovapd	%ymm2, %ymm0
	vmovapd	%ymm2, 672(%rsp)
	vmulpd	%ymm3, %ymm8, %ymm10
	vfmadd132pd	%ymm2, %ymm7, %ymm0
	vmovapd	384(%rsp), %ymm8
	vmovapd	416(%rsp), %ymm3
	vdivpd	%ymm12, %ymm1, %ymm1
	vmovapd	.LC13(%rip), %ymm2
	vfmadd231pd	%ymm9, %ymm3, %ymm8
	vaddpd	%ymm9, %ymm9, %ymm9
	vfmadd231pd	%ymm6, %ymm6, %ymm0
	vfmadd231pd	%ymm5, %ymm5, %ymm0
	vfmadd231pd	%ymm4, %ymm4, %ymm0
	vfmadd231pd	%ymm11, %ymm11, %ymm0
	vfmadd231pd	.LC28(%rip), %ymm1, %ymm9
	vfmadd231pd	%ymm15, %ymm15, %ymm0
	vaddpd	%ymm1, %ymm1, %ymm1
	vfmadd231pd	%ymm10, %ymm10, %ymm0
	vfmadd231pd	%ymm14, %ymm14, %ymm0
	vfmadd231pd	%ymm13, %ymm13, %ymm0
	vsqrtpd	%ymm0, %ymm0
	vfnmadd132pd	.LC27(%rip), %ymm0, %ymm8
	vdivpd	%ymm0, %ymm2, %ymm0
	vcmppd	$30, %ymm7, %ymm8, %ymm3
	vmulpd	.LC15(%rip), %ymm8, %ymm8
	vdivpd	%ymm9, %ymm8, %ymm8
	vmulpd	%ymm5, %ymm0, %ymm2
	vmulpd	%ymm10, %ymm0, %ymm9
	vmovapd	%ymm2, 512(%rsp)
	vmulpd	%ymm4, %ymm0, %ymm2
	vmovapd	%ymm2, 480(%rsp)
	vmulpd	%ymm13, %ymm0, %ymm2
	vmovapd	%ymm2, 352(%rsp)
	vmovapd	%ymm8, 576(%rsp)
	vmulpd	%ymm6, %ymm0, %ymm8
	vmulpd	576(%rsp), %ymm1, %ymm1
	vmovapd	%ymm8, 544(%rsp)
	vmulpd	%ymm11, %ymm0, %ymm8
	vfnmadd132pd	%ymm1, %ymm10, %ymm9
	vmovapd	%ymm8, 448(%rsp)
	vmulpd	%ymm15, %ymm0, %ymm8
	vmovapd	%ymm8, 384(%rsp)
	vmulpd	%ymm14, %ymm0, %ymm8
	vmovapd	672(%rsp), %ymm2
	vmulpd	%ymm2, %ymm0, %ymm0
	vfnmadd132pd	%ymm1, %ymm14, %ymm8
	vfnmadd132pd	%ymm1, %ymm2, %ymm0
	vmovapd	544(%rsp), %ymm2
	vfnmadd132pd	%ymm1, %ymm6, %ymm2
	vblendvpd	%ymm3, %ymm8, %ymm14, %ymm14
	vmovapd	576(%rsp), %ymm8
	vmovapd	%ymm2, 544(%rsp)
	vmovapd	512(%rsp), %ymm2
	vfnmadd132pd	%ymm1, %ymm5, %ymm2
	vmovapd	%ymm2, 512(%rsp)
	vmovapd	480(%rsp), %ymm2
	vblendvpd	%ymm3, 512(%rsp), %ymm5, %ymm5
	vfnmadd132pd	%ymm1, %ymm4, %ymm2
	vmovapd	%ymm2, 480(%rsp)
	vmovapd	448(%rsp), %ymm2
	vfnmadd132pd	%ymm1, %ymm11, %ymm2
	vmovapd	%ymm2, 448(%rsp)
	vmovapd	384(%rsp), %ymm2
	vfnmadd132pd	%ymm1, %ymm15, %ymm2
	vfnmadd132pd	352(%rsp), %ymm13, %ymm1
	vmovapd	%ymm2, 384(%rsp)
	vblendvpd	%ymm3, %ymm1, %ymm13, %ymm13
	vmovapd	672(%rsp), %ymm2
	vblendvpd	%ymm3, 384(%rsp), %ymm15, %ymm15
	vblendvpd	%ymm3, %ymm0, %ymm2, %ymm0
	vblendvpd	%ymm3, 544(%rsp), %ymm6, %ymm2
	vblendvpd	%ymm3, 480(%rsp), %ymm4, %ymm6
	vblendvpd	%ymm3, 448(%rsp), %ymm11, %ymm4
	vblendvpd	%ymm3, %ymm9, %ymm10, %ymm11
	vmovapd	416(%rsp), %ymm10
	vmovapd	704(%rsp), %ymm9
	vfmadd132pd	.LC27(%rip), %ymm10, %ymm8
	vmovapd	%ymm11, 672(%rsp)
	vblendvpd	%ymm3, %ymm8, %ymm10, %ymm10
	vmovapd	928(%rsp), %ymm3
	vmovapd	960(%rsp), %ymm8
	vmovapd	%ymm10, 544(%rsp)
	vmovapd	768(%rsp), %ymm10
	vmulpd	736(%rsp), %ymm8, %ymm1
	vmulpd	%ymm9, %ymm10, %ymm11
	vmulpd	736(%rsp), %ymm9, %ymm9
	vmulpd	%ymm10, %ymm3, %ymm10
	vmovapd	%ymm11, 576(%rsp)
	vmovapd	800(%rsp), %ymm11
	vmulpd	%ymm11, %ymm3, %ymm8
	vmulpd	960(%rsp), %ymm11, %ymm11
	vmulpd	832(%rsp), %ymm11, %ymm11
	vmovapd	864(%rsp), %ymm3
	vfmadd132pd	896(%rsp), %ymm11, %ymm10
	vmovapd	576(%rsp), %ymm11
	vfmadd132pd	%ymm3, %ymm10, %ymm9
	vmovapd	768(%rsp), %ymm10
	vmovupd	%ymm10, 992(%rbx)
	vmovapd	736(%rsp), %ymm10
	vmovupd	%ymm10, 1248(%rbx)
	vmovapd	864(%rsp), %ymm10
	vfnmadd132pd	%ymm3, %ymm9, %ymm8
	vmovapd	704(%rsp), %ymm9
	vfnmadd132pd	832(%rsp), %ymm8, %ymm11
	vmovupd	%ymm10, 2528(%rbx)
	vmovapd	960(%rsp), %ymm8
	vmovupd	%ymm9, 1504(%rbx)
	vmovapd	832(%rsp), %ymm9
	vmovupd	%ymm8, 1760(%rbx)
	vmovapd	928(%rsp), %ymm8
	vmovupd	%ymm9, 2784(%rbx)
	vmovapd	640(%rsp), %ymm9
	vmovupd	%ymm8, 2016(%rbx)
	vmovapd	.LC13(%rip), %ymm8
	vmovapd	%ymm11, %ymm3
	vfnmadd231pd	896(%rsp), %ymm1, %ymm3
	vmovapd	800(%rsp), %ymm11
	vmovupd	%ymm11, 736(%rbx)
	vmovapd	896(%rsp), %ymm11
	vmovupd	%ymm11, 2272(%rbx)
	vdivpd	%ymm3, %ymm8, %ymm1
	vmulpd	.LC29(%rip), %ymm9, %ymm8
	vsubpd	%ymm1, %ymm3, %ymm1
	vmulpd	%ymm8, %ymm1, %ymm1
	vmovapd	672(%rsp), %ymm8
	vmulpd	%ymm3, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm1, %ymm3
	vfmadd231pd	%ymm7, %ymm1, %ymm8
	vmovapd	%ymm1, %ymm9
	vfmadd132pd	%ymm7, %ymm15, %ymm9
	vaddpd	%ymm4, %ymm1, %ymm10
	vmovupd	%ymm3, 7904(%rbx)
	vmovapd	%ymm1, %ymm3
	vfmadd132pd	%ymm7, %ymm2, %ymm3
	vmovupd	%ymm3, 8160(%rbx)
	vmovapd	%ymm1, %ymm3
	vfmadd132pd	%ymm7, %ymm5, %ymm3
	vmovupd	%ymm3, 8416(%rbx)
	vmovapd	%ymm1, %ymm3
	vfmadd132pd	%ymm7, %ymm6, %ymm3
	vmovapd	%ymm3, %ymm11
	vmovapd	%ymm1, %ymm3
	vaddpd	%ymm13, %ymm1, %ymm1
	vfmadd132pd	%ymm7, %ymm14, %ymm3
	vmovupd	%ymm11, 8672(%rbx)
	vmovupd	%ymm10, 8928(%rbx)
	vmovupd	%ymm8, 9440(%rbx)
	vmovupd	%ymm1, 9952(%rbx)
	vmovupd	%ymm9, 9184(%rbx)
	vmovupd	%ymm3, 9696(%rbx)
	vmovapd	.LC13(%rip), %ymm3
	vdivpd	608(%rsp), %ymm3, %ymm1
	vmulpd	%ymm2, %ymm1, %ymm8
	vfmadd132pd	%ymm1, %ymm12, %ymm0
	vfmadd132pd	%ymm1, %ymm12, %ymm4
	vmulpd	%ymm14, %ymm1, %ymm2
	vmulpd	%ymm5, %ymm1, %ymm9
	vmulpd	%ymm6, %ymm1, %ymm6
	vmulpd	%ymm15, %ymm1, %ymm5
	vfmadd231pd	%ymm7, %ymm12, %ymm8
	vmulpd	672(%rsp), %ymm1, %ymm3
	vmovapd	%ymm0, %ymm10
	vmovupd	%ymm4, 4064(%rbx)
	vmovapd	%ymm2, %ymm0
	vfmadd132pd	%ymm13, %ymm12, %ymm1
	vmovupd	%ymm10, 3040(%rbx)
	vmovapd	544(%rsp), %ymm10
	vfmadd231pd	%ymm7, %ymm12, %ymm9
	vfmadd231pd	%ymm7, %ymm12, %ymm0
	vfmadd231pd	%ymm7, %ymm12, %ymm6
	vmovupd	%ymm10, 5344(%rbx)
	vfmadd231pd	%ymm7, %ymm12, %ymm5
	vmovupd	%ymm8, 3296(%rbx)
	vfmadd231pd	%ymm7, %ymm12, %ymm3
	vmovupd	%ymm1, 5088(%rbx)
	vmovupd	%ymm9, 3552(%rbx)
	vmovupd	%ymm6, 3808(%rbx)
	vmovupd	%ymm5, 4320(%rbx)
	vmovupd	%ymm3, 4576(%rbx)
	vmovupd	%ymm0, 4832(%rbx)
