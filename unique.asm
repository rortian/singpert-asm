


DEFAULT REL
BITS 64

section .text

	
	
	global m2n1
	
	
	
	global m2n2
	
	
	
	global m2n3
	
	
	
	global m2n4
	
	
	
	global m3n1
	
	
	
	global m3n2
	
	
	
	global m3n3
	
	
	
	global m4n1
	
	
	
	global m4n2
	
	
	
	global m4n4
	
	
	
	
	
	
	
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
	
	
	
	
	
m2n2:
	
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
startm2n2:
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
	jmp		innerm2n2
inloopm2n2:
	loop	innerm2n2
	inc		r14
	cmp	r14,rax
	je		tomemm2n2
	sal		r13,8
comebackm2n2:
	inc		r11
	cmp	r9,r11
	je		newrowm2n2
	jmp		startm2n2

innerm2n2:
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
	movapd	xmm10,xmm2
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
	jmp		inloopm2n2
	
donem2n2:
	cmp	r14,r11
	je		reallydonem2n2
	jmp		lastwritem2n2
	
reallydonem2n2:	
	movq	mm4,r12			;return to initial values
	movq	mm5,r13
	movq	mm6,r14
	movq	mm7,r15
	ret
	

tomemm2n2:

	movnti	[rdx],r13
	mov	r15,r13
	xor		r13,r15
	mov	r15,r13
	mov	r14,r13
	inc		r15
	lea		rdx,[rdx+8]
	jmp		comebackm2n2

newrowm2n2:

	mov	r15,r11
	xor		r11,r15
	mov	r15,r11
	inc		r15
	inc		r12
	cmp	r10,r12
	je		donem2n2
	jmp		startm2n2
	
lastwritem2n2:

	mov	rcx,3
	mov	rax,8
	sub		rax,r14
	dec		rax
	sal		rax,cl
	mov	rcx,rax
	sal		r13,cl
	movnti	[rdx],r13
	jmp		reallydonem2n2
	
	
	
	
	
m2n3:
	
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
startm2n3:
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
	jmp		innerm2n3
inloopm2n3:
	loop	innerm2n3
	inc		r14
	cmp	r14,rax
	je		tomemm2n3
	sal		r13,8
comebackm2n3:
	inc		r11
	cmp	r9,r11
	je		newrowm2n3
	jmp		startm2n3

innerm2n3:
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
	movapd	xmm10,xmm2
	movapd	xmm11,xmm2
	movapd	xmm12,xmm1
	movapd	xmm13,xmm1
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
	movapd	xmm3,xmm14
	movapd	xmm10,xmm14
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
	jmp		inloopm2n3
	
donem2n3:
	cmp	r14,r11
	je		reallydonem2n3
	jmp		lastwritem2n3
	
reallydonem2n3:	
	movq	mm4,r12			;return to initial values
	movq	mm5,r13
	movq	mm6,r14
	movq	mm7,r15
	ret
	

tomemm2n3:

	movnti	[rdx],r13
	mov	r15,r13
	xor		r13,r15
	mov	r15,r13
	mov	r14,r13
	inc		r15
	lea		rdx,[rdx+8]
	jmp		comebackm2n3

newrowm2n3:

	mov	r15,r11
	xor		r11,r15
	mov	r15,r11
	inc		r15
	inc		r12
	cmp	r10,r12
	je		donem2n3
	jmp		startm2n3
	
lastwritem2n3:

	mov	rcx,3
	mov	rax,8
	sub		rax,r14
	dec		rax
	sal		rax,cl
	mov	rcx,rax
	sal		r13,cl
	movnti	[rdx],r13
	jmp		reallydonem2n3
	
	
	
	
	
m2n4:
	
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
startm2n4:
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
	jmp		innerm2n4
inloopm2n4:
	loop	innerm2n4
	inc		r14
	cmp	r14,rax
	je		tomemm2n4
	sal		r13,8
comebackm2n4:
	inc		r11
	cmp	r9,r11
	je		newrowm2n4
	jmp		startm2n4

innerm2n4:
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
	movapd	xmm10,xmm2
	movapd	xmm11,xmm2
	movapd	xmm12,xmm2
	movapd	xmm13,xmm2
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
	movapd	xmm4,xmm14
	movapd	xmm10,xmm4
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
	jmp		inloopm2n4
	
donem2n4:
	cmp	r14,r11
	je		reallydonem2n4
	jmp		lastwritem2n4
	
reallydonem2n4:	
	movq	mm4,r12			;return to initial values
	movq	mm5,r13
	movq	mm6,r14
	movq	mm7,r15
	ret
	

tomemm2n4:

	movnti	[rdx],r13
	mov	r15,r13
	xor		r13,r15
	mov	r15,r13
	mov	r14,r13
	inc		r15
	lea		rdx,[rdx+8]
	jmp		comebackm2n4

newrowm2n4:

	mov	r15,r11
	xor		r11,r15
	mov	r15,r11
	inc		r15
	inc		r12
	cmp	r10,r12
	je		donem2n4
	jmp		startm2n4
	
lastwritem2n4:

	mov	rcx,3
	mov	rax,8
	sub		rax,r14
	dec		rax
	sal		rax,cl
	mov	rcx,rax
	sal		r13,cl
	movnti	[rdx],r13
	jmp		reallydonem2n4
	
	
	
	
	
m3n1:
	
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
startm3n1:
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
	jmp		innerm3n1
inloopm3n1:
	loop	innerm3n1
	inc		r14
	cmp	r14,rax
	je		tomemm3n1
	sal		r13,8
comebackm3n1:
	inc		r11
	cmp	r9,r11
	je		newrowm3n1
	jmp		startm3n1

innerm3n1:
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
	movapd	xmm10,xmm2
	movapd	xmm11,xmm2
	movapd	xmm12,xmm1
	movapd	xmm13,xmm1
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
	movapd	xmm3,xmm14
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
	addpd	xmm14,xmm3
	movapd	xmm1,xmm14

	movapd	xmm15,xmm14
	mulpd	xmm15,xmm14
	haddpd	xmm15,xmm14
	comisd	xmm15,xmm8
	inc		r13
	cmovnb	rcx,r15
	jmp		inloopm3n1
	
donem3n1:
	cmp	r14,r11
	je		reallydonem3n1
	jmp		lastwritem3n1
	
reallydonem3n1:	
	movq	mm4,r12			;return to initial values
	movq	mm5,r13
	movq	mm6,r14
	movq	mm7,r15
	ret
	

tomemm3n1:

	movnti	[rdx],r13
	mov	r15,r13
	xor		r13,r15
	mov	r15,r13
	mov	r14,r13
	inc		r15
	lea		rdx,[rdx+8]
	jmp		comebackm3n1

newrowm3n1:

	mov	r15,r11
	xor		r11,r15
	mov	r15,r11
	inc		r15
	inc		r12
	cmp	r10,r12
	je		donem3n1
	jmp		startm3n1
	
lastwritem3n1:

	mov	rcx,3
	mov	rax,8
	sub		rax,r14
	dec		rax
	sal		rax,cl
	mov	rcx,rax
	sal		r13,cl
	movnti	[rdx],r13
	jmp		reallydonem3n1
	
	
	
	
	
m3n2:
	
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
startm3n2:
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
	jmp		innerm3n2
inloopm3n2:
	loop	innerm3n2
	inc		r14
	cmp	r14,rax
	je		tomemm3n2
	sal		r13,8
comebackm3n2:
	inc		r11
	cmp	r9,r11
	je		newrowm3n2
	jmp		startm3n2

innerm3n2:
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
	movapd	xmm10,xmm2
	movapd	xmm11,xmm2
	movapd	xmm12,xmm1
	movapd	xmm13,xmm1
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
	movapd	xmm3,xmm14
	movapd	xmm10,xmm2
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
	addpd	xmm14,xmm3
	movapd	xmm1,xmm14

	movapd	xmm15,xmm14
	mulpd	xmm15,xmm14
	haddpd	xmm15,xmm14
	comisd	xmm15,xmm8
	inc		r13
	cmovnb	rcx,r15
	jmp		inloopm3n2
	
donem3n2:
	cmp	r14,r11
	je		reallydonem3n2
	jmp		lastwritem3n2
	
reallydonem3n2:	
	movq	mm4,r12			;return to initial values
	movq	mm5,r13
	movq	mm6,r14
	movq	mm7,r15
	ret
	

tomemm3n2:

	movnti	[rdx],r13
	mov	r15,r13
	xor		r13,r15
	mov	r15,r13
	mov	r14,r13
	inc		r15
	lea		rdx,[rdx+8]
	jmp		comebackm3n2

newrowm3n2:

	mov	r15,r11
	xor		r11,r15
	mov	r15,r11
	inc		r15
	inc		r12
	cmp	r10,r12
	je		donem3n2
	jmp		startm3n2
	
lastwritem3n2:

	mov	rcx,3
	mov	rax,8
	sub		rax,r14
	dec		rax
	sal		rax,cl
	mov	rcx,rax
	sal		r13,cl
	movnti	[rdx],r13
	jmp		reallydonem3n2
	
	
	
	
	
m3n3:
	
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
startm3n3:
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
	jmp		innerm3n3
inloopm3n3:
	loop	innerm3n3
	inc		r14
	cmp	r14,rax
	je		tomemm3n3
	sal		r13,8
comebackm3n3:
	inc		r11
	cmp	r9,r11
	je		newrowm3n3
	jmp		startm3n3

innerm3n3:
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
	movapd	xmm10,xmm2
	movapd	xmm11,xmm2
	movapd	xmm12,xmm1
	movapd	xmm13,xmm1
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
	movapd	xmm3,xmm14
	movapd	xmm10,xmm14
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
	addpd	xmm14,xmm3
	movapd	xmm1,xmm14

	movapd	xmm15,xmm14
	mulpd	xmm15,xmm14
	haddpd	xmm15,xmm14
	comisd	xmm15,xmm8
	inc		r13
	cmovnb	rcx,r15
	jmp		inloopm3n3
	
donem3n3:
	cmp	r14,r11
	je		reallydonem3n3
	jmp		lastwritem3n3
	
reallydonem3n3:	
	movq	mm4,r12			;return to initial values
	movq	mm5,r13
	movq	mm6,r14
	movq	mm7,r15
	ret
	

tomemm3n3:

	movnti	[rdx],r13
	mov	r15,r13
	xor		r13,r15
	mov	r15,r13
	mov	r14,r13
	inc		r15
	lea		rdx,[rdx+8]
	jmp		comebackm3n3

newrowm3n3:

	mov	r15,r11
	xor		r11,r15
	mov	r15,r11
	inc		r15
	inc		r12
	cmp	r10,r12
	je		donem3n3
	jmp		startm3n3
	
lastwritem3n3:

	mov	rcx,3
	mov	rax,8
	sub		rax,r14
	dec		rax
	sal		rax,cl
	mov	rcx,rax
	sal		r13,cl
	movnti	[rdx],r13
	jmp		reallydonem3n3
	
	
	
	
	
m4n1:
	
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
startm4n1:
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
	jmp		innerm4n1
inloopm4n1:
	loop	innerm4n1
	inc		r14
	cmp	r14,rax
	je		tomemm4n1
	sal		r13,8
comebackm4n1:
	inc		r11
	cmp	r9,r11
	je		newrowm4n1
	jmp		startm4n1

innerm4n1:
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
	movapd	xmm10,xmm2
	movapd	xmm11,xmm2
	movapd	xmm12,xmm2
	movapd	xmm13,xmm2
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
	movapd	xmm4,xmm14
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
	addpd	xmm14,xmm4
	movapd	xmm1,xmm14

	movapd	xmm15,xmm14
	mulpd	xmm15,xmm14
	haddpd	xmm15,xmm14
	comisd	xmm15,xmm8
	inc		r13
	cmovnb	rcx,r15
	jmp		inloopm4n1
	
donem4n1:
	cmp	r14,r11
	je		reallydonem4n1
	jmp		lastwritem4n1
	
reallydonem4n1:	
	movq	mm4,r12			;return to initial values
	movq	mm5,r13
	movq	mm6,r14
	movq	mm7,r15
	ret
	

tomemm4n1:

	movnti	[rdx],r13
	mov	r15,r13
	xor		r13,r15
	mov	r15,r13
	mov	r14,r13
	inc		r15
	lea		rdx,[rdx+8]
	jmp		comebackm4n1

newrowm4n1:

	mov	r15,r11
	xor		r11,r15
	mov	r15,r11
	inc		r15
	inc		r12
	cmp	r10,r12
	je		donem4n1
	jmp		startm4n1
	
lastwritem4n1:

	mov	rcx,3
	mov	rax,8
	sub		rax,r14
	dec		rax
	sal		rax,cl
	mov	rcx,rax
	sal		r13,cl
	movnti	[rdx],r13
	jmp		reallydonem4n1
	
	
	
	
	
m4n2:
	
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
startm4n2:
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
	jmp		innerm4n2
inloopm4n2:
	loop	innerm4n2
	inc		r14
	cmp	r14,rax
	je		tomemm4n2
	sal		r13,8
comebackm4n2:
	inc		r11
	cmp	r9,r11
	je		newrowm4n2
	jmp		startm4n2

innerm4n2:
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
	movapd	xmm10,xmm2
	movapd	xmm11,xmm2
	movapd	xmm12,xmm2
	movapd	xmm13,xmm2
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
	movapd	xmm4,xmm14
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
	addpd	xmm14,xmm4
	movapd	xmm1,xmm14

	movapd	xmm15,xmm14
	mulpd	xmm15,xmm14
	haddpd	xmm15,xmm14
	comisd	xmm15,xmm8
	inc		r13
	cmovnb	rcx,r15
	jmp		inloopm4n2
	
donem4n2:
	cmp	r14,r11
	je		reallydonem4n2
	jmp		lastwritem4n2
	
reallydonem4n2:	
	movq	mm4,r12			;return to initial values
	movq	mm5,r13
	movq	mm6,r14
	movq	mm7,r15
	ret
	

tomemm4n2:

	movnti	[rdx],r13
	mov	r15,r13
	xor		r13,r15
	mov	r15,r13
	mov	r14,r13
	inc		r15
	lea		rdx,[rdx+8]
	jmp		comebackm4n2

newrowm4n2:

	mov	r15,r11
	xor		r11,r15
	mov	r15,r11
	inc		r15
	inc		r12
	cmp	r10,r12
	je		donem4n2
	jmp		startm4n2
	
lastwritem4n2:

	mov	rcx,3
	mov	rax,8
	sub		rax,r14
	dec		rax
	sal		rax,cl
	mov	rcx,rax
	sal		r13,cl
	movnti	[rdx],r13
	jmp		reallydonem4n2
	
	
	
	
	
m4n4:
	
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
startm4n4:
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
	jmp		innerm4n4
inloopm4n4:
	loop	innerm4n4
	inc		r14
	cmp	r14,rax
	je		tomemm4n4
	sal		r13,8
comebackm4n4:
	inc		r11
	cmp	r9,r11
	je		newrowm4n4
	jmp		startm4n4

innerm4n4:
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
	movapd	xmm10,xmm2
	movapd	xmm11,xmm2
	movapd	xmm12,xmm2
	movapd	xmm13,xmm2
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
	movapd	xmm4,xmm14
	movapd	xmm10,xmm4
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
	addpd	xmm14,xmm4
	movapd	xmm1,xmm14

	movapd	xmm15,xmm14
	mulpd	xmm15,xmm14
	haddpd	xmm15,xmm14
	comisd	xmm15,xmm8
	inc		r13
	cmovnb	rcx,r15
	jmp		inloopm4n4
	
donem4n4:
	cmp	r14,r11
	je		reallydonem4n4
	jmp		lastwritem4n4
	
reallydonem4n4:	
	movq	mm4,r12			;return to initial values
	movq	mm5,r13
	movq	mm6,r14
	movq	mm7,r15
	ret
	

tomemm4n4:

	movnti	[rdx],r13
	mov	r15,r13
	xor		r13,r15
	mov	r15,r13
	mov	r14,r13
	inc		r15
	lea		rdx,[rdx+8]
	jmp		comebackm4n4

newrowm4n4:

	mov	r15,r11
	xor		r11,r15
	mov	r15,r11
	inc		r15
	inc		r12
	cmp	r10,r12
	je		donem4n4
	jmp		startm4n4
	
lastwritem4n4:

	mov	rcx,3
	mov	rax,8
	sub		rax,r14
	dec		rax
	sal		rax,cl
	mov	rcx,rax
	sal		r13,cl
	movnti	[rdx],r13
	jmp		reallydonem4n4
	
	
	
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
