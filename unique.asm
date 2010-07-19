
	


DEFAULT REL
BITS 64

section .text

	
	
	global m2n1
	
	
	
	
	
	
	
m2n1:
	
	mov		rax,8
	movq		r12,mm4				;preserve for previous function
	movq		r13,mm5
	movq		r14,mm6
	movq		r15,mm7
	mov		r10,__float64__(-1.0)
	movq		xmm8,r10
	mov		r10,__float64__(3.0)
	movddup	xmm9,xmm8
	mulsd		xmm9,xmm8			;creates conujgation number
	movq		xmm8,r10				;sets up 3 for comparisons
	movdq2q	mm0,xmm2			;these are the initial values
	movdq2q	mm1,xmm3
	movdq2q	mm2,xmm4
	movdq2q	mm3,xmm5
	unpcklpd	xmm0,xmm1
	mov		r9,rsi
	mov		r10,rdi
	mov		r12,r11
	xor			r11,r12
	mov		r12,r11
	mov		r13,r11
	mov		r14,r11
	mov		r15,r11
	inc			r15
	mov		rbx,255
startm2n1:
	mov	rcx,rbx
	movq2dq	xmm1,mm0			
	movq2dq	xmm2,mm1
	unpcklpd	xmm1,xmm2
	movq2dq	xmm2,mm2
	movq2dq	xmm3,mm3
	unpcklpd	xmm2,xmm3
	cvtsi2sd	xmm3,r11
	cvtsi2sd	xmm4,r12
	unpcklpd	xmm3,xmm4
	mulpd	xmm2,xmm3
	addpd	xmm1,xmm2
	jmp		innerm2n1
inloopm2n1:
	loop	innerm2n1
	inc		r14
	cmp	r14,rax
	je		tomemm2n1
	sal		r13,8
comebackm2n1:
	inc		r11
	cmp	r9,r11
	je		newrowm2n1
	jmp		startm2n1

innerm2n1:
	movapd	xmm10,xmm1
	movapd	xmm11,xmm10
	movapd	xmm12,xmm10
	movapd	xmm13,xmm10
	shufpd	xmm11,xmm10,1
	shufpd	xmm13,xmm12,1
	movddup	xmm14,xmm10
	movddup	xmm15,xmm11
	movsd	xmm11,xmm12
	unpcklpd	xmm12,xmm13
	unpcklpd	xmm13,xmm11
	mulpd	xmm14,xmm12
	mulpd	xmm15,xmm13
	addsubpd	xmm14,xmm15
	movapd	xmm2,xmm14
	movapd	xmm10,xmm1
	movapd	xmm11,xmm10
	mulpd	xmm11,xmm10
	haddpd	xmm11,xmm10
	movddup	xmm12,xmm11
	divpd	xmm10,xmm12
	mulpd	xmm10,xmm9
	movapd xmm11,xmm10
	shufpd	xmm11,xmm10,1
	movapd	xmm12,xmm0
	movapd	xmm13,xmm0
	shufpd	xmm13,xmm12,1
	movddup	xmm14,xmm10
	movddup	xmm15,xmm11
	movsd	xmm11,xmm12
	unpcklpd	xmm12,xmm13
	unpcklpd	xmm13,xmm11
	mulpd	xmm14,xmm12
	mulpd	xmm15,xmm13
	addsubpd	xmm14,xmm15
	addpd	xmm14,xmm2
	movapd	xmm1,xmm14

	movapd	xmm15,xmm14
	mulpd	xmm15,xmm14
	haddpd	xmm15,xmm14
	comisd	xmm15,xmm8
	inc		r13
	cmovnb	rcx,r15
	jmp		inloopm2n1
	
donem2n1:
	cmp	r14,r11
	je		reallydonem2n1
	jmp		lastwritem2n1
	
reallydonem2n1:	
	movq	mm4,r12			;return to initial values
	movq	mm5,r13
	movq	mm6,r14
	movq	mm7,r15
	ret
	

tomemm2n1:

	movnti	[rdx],r13
	mov	r15,r13
	xor		r13,r15
	mov	r15,r13
	mov	r14,r13
	inc		r15
	lea		rdx,[rdx+8]
	jmp		comebackm2n1

newrowm2n1:

	mov	r15,r11
	xor		r11,r15
	mov	r15,r11
	inc		r15
	inc		r12
	cmp	r10,r12
	je		donem2n1
	jmp		startm2n1
	
lastwritem2n1:

	mov	rcx,3
	mov	rax,8
	sub		rax,r14
	dec		rax
	sal		rax,cl
	mov	rcx,rax
	sal		r13,cl
	movnti	[rdx],r13
	jmp		reallydonem2n1
	
	
	
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
	
mag:

	movapd	xmm15,xmm14
	mulpd	xmm15,xmm14
	haddpd	xmm15,xmm14

	ret
	


	
	
	
	
	

