DEFAULT REL


section .text
	
	global sweet
sweet:

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
	
	
	
	

