	.arch armv6
	.global asm_fib

	.cpu cortex-a53
	.equ 	FP_OFFSET, 0 
	.data
	.text

asm_fib: 
	// PROLOG
	push	{lr} 	// push lr into stack

	mov r1, r0		// r1 = r0 
	cmp r0, #1		// if(r0 <= 1)
	ble end1		// .

	sub r0, r0, #1		// r0 = r0 - 1		
	push {r1}		// push r1 into stack to save
	bl asm_fib 		// asm_fib(r0)
	pop {r1} 		// pop r1 out of stack to access r1

	mov r2, r0		// r2 = r0
	sub r0, r1, #2		// r0 = r1 - 2
	push {r2}		// push r2 into stack to save
	bl asm_fib		// asm_fib(r0)
	pop {r2}		// pop r2 out of stack to access r2
	add r0, r0, r2		// r0 = r0 + r2
	b end			// break
	
	end1: 
		mov r0, #1		// r0 = 1
		b end			// break
	end:
		// EPILOGUE
		pop 	{lr}		// pop from stack {lr}
		bx lr 			// return
	
	
