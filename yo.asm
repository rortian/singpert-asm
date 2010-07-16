DEFAULT REL
BITS 64

section .text
	
	global sweet
sweet:
	
	mov	r10,__float64__(-1.0)
	movq	xmm8,r10
	movddup	xmm9,xmm8
	mulsd	xmm9,xmm8
	movsd	xmm10,xmm0
	movsd	xmm12,xmm0
	movsd	xmm11,xmm1
	movsd	xmm13,xmm1
	call		mult
	movapd	xmm2,xmm14
	movsd	xmm10,xmm2
	shufpd	xmm14,xmm2,1
	movsd	xmm11,xmm14
	movsd	xmm12,xmm0
	movsd	xmm13,xmm1
	call		mult
	movapd	xmm10,xmm2
	call		inv
	movapd 	xmm3,xmm10
	movapd	xmm11,xmm10
	shufpd	xmm11,xmm10,1
	movapd	xmm12,xmm2
	movapd	xmm13,xmm12
	shufpd	xmm13,xmm12,1
	call		mult
	movapd	xmm15,xmm14
	ret
	

	
	
	
	
mult:
	
	movddup	xmm14,xmm10
	movddup	xmm15,xmm11
	movsd	xmm11,xmm12
	unpcklpd	xmm12,xmm13
	unpcklpd	xmm13,xmm11
	mulpd	xmm14,xmm12
	mulpd	xmm15,xmm13
	addsubpd	xmm14,xmm15
	ret
	

inv:

	movapd	xmm11,xmm10
	mulpd	xmm11,xmm10
	haddpd	xmm11,xmm10
	movddup	xmm12,xmm11
	divpd	xmm10,xmm12
	mulpd	xmm10,xmm9
	ret


	
	
	
	
	

