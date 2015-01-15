SECTION .data align=16 		;now we'll use instructions that works with aligned data!
rad	dd	1.0,2.0,3.0,4.0
two	times 4 	dd	2.0
pi	times 4		dd	3.14
SECTION .bss
volumes		resd	4
surfaces	resd	4

SECTION .text
global _start
_start:

put_data:
  movaps xmm0,[rad] 	;single precision - double word, in register it will be 4.0,3.0,2.0,1.0
  movaps xmm1,[two]
  movaps xmm2,[pi]
  mulps	xmm0,xmm1 	;result is in xmm0
  mulps xmm0,xmm2
  
  store_volumes:
  movaps [volumes],xmm0

  movaps xmm0,[rad]
  mulps	xmm0,xmm0	;in xmm0 is rad*rad
  mulps xmm0,xmm2

  store_surfaces:
  movaps [surfaces],xmm0
 
mov eax,1
mov ebx,0
int 80h