#!/usr/bin/ruby

require 'erb'


assembly_generator = %q{
<%	
	powers = {}
	
	debug = {}
	
	finish_types = {}
	
	bytes = {}
	
	bytes['max_it'] = 'mov		rbx,255'
	
	bytes['per_qw'] = 8
	bytes['bits'] = 8
	
	finish_types['bytes'] = bytes
	
	functions = ['m2n1','m2n2','m3n1']
	
	mult = <<EOF
	movddup	xmm14,xmm10
	movddup	xmm15,xmm11
	movsd	xmm11,xmm12
	unpcklpd	xmm12,xmm13
	unpcklpd	xmm13,xmm11
	mulpd	xmm14,xmm12
	mulpd	xmm15,xmm13
	addsubpd	xmm14,xmm15
EOF

	inv = <<EOF
	movapd	xmm11,xmm10
	mulpd	xmm11,xmm10
	haddpd	xmm11,xmm10
	movddup	xmm12,xmm11
	divpd	xmm10,xmm12
	mulpd	xmm10,xmm9
EOF

	mag = <<EOF
	movapd	xmm15,xmm14
	mulpd	xmm15,xmm14
	haddpd	xmm15,xmm14
EOF
	
	
debug['m2n1'] = <<EOF
	movapd	xmm10,xmm1
	movapd	xmm11,xmm10
	movapd	xmm12,xmm10
	movapd	xmm13,xmm10
	shufpd	xmm11,xmm10,1
	shufpd	xmm13,xmm12,1
	call		mult
	movapd	xmm2,xmm14
	movapd	xmm10,xmm1
	call		inv
	movapd xmm11,xmm10
	shufpd	xmm11,xmm10,1
	movapd	xmm12,xmm0
	movapd	xmm13,xmm0
	shufpd	xmm13,xmm12,1
	call		mult
	addpd	xmm14,xmm2
	movapd	xmm1,xmm14
EOF


debug['m2n2'] = <<EOF
	movapd	xmm10,xmm1
	movapd	xmm11,xmm10
	movapd	xmm12,xmm10
	movapd	xmm13,xmm10
	shufpd	xmm11,xmm10,1
	shufpd	xmm13,xmm12,1
	call		mult
	movapd	xmm2,xmm14
	movapd	xmm10,xmm2
	call		inv
	movapd xmm11,xmm10
	shufpd	xmm11,xmm10,1
	movapd	xmm12,xmm0
	movapd	xmm13,xmm0
	shufpd	xmm13,xmm12,1
	call		mult
	addpd	xmm14,xmm2
	movapd	xmm1,xmm14
EOF


debug['m3n1'] = <<EOF
	movapd	xmm10,xmm1
	movapd	xmm11,xmm10
	movapd	xmm12,xmm10
	movapd	xmm13,xmm10
	shufpd	xmm11,xmm10,1
	shufpd	xmm13,xmm12,1
	call		mult
	movapd	xmm2,xmm14
	movapd	xmm10,xmm2
	movapd	xmm11,xmm2
	movapd	xmm12,xmm1
	movapd	xmm13,xmm1
	shufpd	xmm11,xmm10,1
	shufpd	xmm13,xmm12,1
	call		mult
	movapd	xmm3,xmm14
	movapd	xmm10,xmm1
	call		inv
	movapd xmm11,xmm10
	shufpd	xmm11,xmm10,1
	movapd	xmm12,xmm0
	movapd	xmm13,xmm0
	shufpd	xmm13,xmm12,1
	call		mult
	addpd	xmm14,xmm3
	movapd	xmm1,xmm14
EOF


debug.each_key do |key|
	str = debug[key]
	while (str =~ /\tcall\t*mult/)
		str = str.sub(/\tcall\t*mult\n/,mult)
	end
	powers[key] = str.sub(/\tcall\t*inv\n/,inv)
end
	

	

%>

DEFAULT REL
BITS 64

section .text

	<%	functions.each do |f_name| %>
	
	<%= "global #{f_name}" %>
	
	<%	end %>
	
	<%	functions.each do |f_name| %>
	
	<%	ret_size = 'bytes' %>
	
<%= "#{f_name}:" %>
	
	mov		rax,<%=finish_types[ret_size]['per_qw'] %>
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
	<%= bytes['max_it'] %>
<%= "start#{f_name}:" %>
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
	jmp		<%= "inner#{f_name}" %>
<%= "inloop#{f_name}:" %>
	loop	<%= "inner#{f_name}" %>
	inc		r14
	cmp	r14,rax
	je		<%= "tomem#{f_name}" %>
	sal		r13,<%= finish_types[ret_size]['bits'] %>
<%= "comeback#{f_name}:" %>
	inc		r11
	cmp	r9,r11
	je		<%= "newrow#{f_name}" %>
	jmp		<%= "start#{f_name}" %>

<%= "inner#{f_name}:" %>
<%= powers[f_name] %>
	movapd	xmm15,xmm14
	mulpd	xmm15,xmm14
	haddpd	xmm15,xmm14
	comisd	xmm15,xmm8
	inc		r13
	cmovnb	rcx,r15
	jmp		<%= "inloop#{f_name}" %>
	
<%= "done#{f_name}:" %>
	cmp	r14,r11
	je		<%= "reallydone#{f_name}" %>
	jmp		<%= "lastwrite#{f_name}" %>
	
<%= "reallydone#{f_name}:" %>	
	movq	mm4,r12			;return to initial values
	movq	mm5,r13
	movq	mm6,r14
	movq	mm7,r15
	ret
	

<%= "tomem#{f_name}:" %>

	movnti	[rdx],r13
	mov	r15,r13
	xor		r13,r15
	mov	r15,r13
	mov	r14,r13
	inc		r15
	lea		rdx,[rdx+8]
	jmp		<%= "comeback#{f_name}" %>

<%= "newrow#{f_name}:" %>

	mov	r15,r11
	xor		r11,r15
	mov	r15,r11
	inc		r15
	inc		r12
	cmp	r10,r12
	je		<%= "done#{f_name}" %>
	jmp		<%= "start#{f_name}" %>
	
<%= "lastwrite#{f_name}:" %>

	mov	rcx,3
	mov	rax,<%= finish_types[ret_size]['per_qw'] %>
	sub		rax,r14
	dec		rax
	sal		rax,cl
	mov	rcx,rax
	sal		r13,cl
	movnti	[rdx],r13
	jmp		<%= "reallydone#{f_name}" %>
	
	<% end %>
	
mult:
	
<%= mult %>
	ret
	

inv:

<%= inv %>
	ret
	
mag:

<%= mag %>
	ret
}


switch_builder =<<EOF

extern void m2n1();

extern void m2n2();

void pertubations(int m,int n,double real,double imag,double xinit,double yinit,double deltax,double deltay,int x,int y,char *array){
	switch(m){
		case 2:
			switch(n){
				case 1:
					m2n1(real,imag,xinit,yinit,deltax,deltay,x,y,array);
					break;
				case 2:
					m2n2(real,imag,xinit,yinit,deltax,deltay,x,y,array);
					break;
			}
			break;
	}
}

EOF


simple =<<EOF

#include <math.h>
#include <stdlib.h>

<%= switch %>

int main(){
	char *c;
	char hi,there;
	
	c = malloc((100*100+8)*sizeof(char));
	pertubations(2,1,0.18,0.02,-0.65,-0.65,0.01,0.01,25,25,c);
	hi = c[0];
	there = c[1];
	return 0;
}

EOF

	
	
	
	
	

