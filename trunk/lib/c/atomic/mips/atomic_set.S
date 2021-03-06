/*
 * $QNXLicenseC:
 * Copyright 2007, QNX Software Systems. All Rights Reserved.
 * 
 * You must obtain a written license from and pay applicable license fees to QNX 
 * Software Systems before you may reproduce, modify or distribute this software, 
 * or any work that includes all or part of this software.   Free development 
 * licenses are available for evaluation and non-commercial purposes.  For more 
 * information visit http://licensing.qnx.com or email licensing@qnx.com.
 *  
 * This file may contain contributions from others.  Please review this entire 
 * file for other proprietary rights or license notices, as well as the QNX 
 * Development Suite License Guide at http://licensing.qnx.com/license-guide/ 
 * for other information.
 * $
 */




/*
 * atomic_set.S
 *	atomicly set bit(s) in a memory location
 */
#include <mips/asm.h>
 
 #
 # void atomic_set( volatile unsigned *loc, unsigned bits )
 # unsigned atomic_set_value( volatile unsigned *loc, unsigned bits )
 #
FRAME(atomic_set,sp,0,ra)
atomic_set_value:
	.set    noreorder
	.set	mips3	
	
1:	ll		v0,0(a0)
	 nop		
	or		t0,v0,a1
	sc		t0,0(a0)
	beq		t0,zero,1b
	 nop		 
	j		ra
	 sync
ENDFRAME(atomic_set)

	.globl	atomic_set_value
	.type	atomic_set_value,@function
	.size	atomic_set_value,.-atomic_set_value
