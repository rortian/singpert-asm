DEFAULT REL


section .text
	
	global sweet
sweet:

	movddup	xmm8,xmm0	; 8 is x x
	movddup 	xmm9,xmm1	; 9 is y y
	movsd	xmm2,xmm0	; x at 2
	movsd	xmm3,xmm1	; y at 3
	unpcklpd	xmm2,xmm3  ; y x
	unpcklpd	xmm3,xmm0  ; 
	mulpd	xmm8,xmm2
	mulpd	xmm9,xmm3
	addsubpd	xmm8,xmm9 	; should be z^2 with y x

	
	
	
	
	
	
	

