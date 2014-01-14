	.file	"fgt.c"
	.section	.rodata
.LC3:
	.string	"pd:%d\n"
	.text
	.globl	fgt_predict
	.type	fgt_predict, @function
fgt_predict:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$168, %esp
	movl	20(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -60(%ebp)
	movl	20(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -56(%ebp)
	movl	20(%ebp), %eax
	fldl	20(%eax)
	fstpl	-120(%ebp)
	movl	20(%ebp), %eax
	movl	32(%eax), %eax
	movl	%eax, -52(%ebp)
	movl	20(%ebp), %eax
	fldl	36(%eax)
	fstpl	-112(%ebp)
	movl	20(%ebp), %eax
	movl	44(%eax), %eax
	movl	%eax, -48(%ebp)
	movl	20(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, -44(%ebp)
	movl	20(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -40(%ebp)
	movl	20(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -36(%ebp)
	movl	-48(%ebp), %eax
	sall	$3, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -32(%ebp)
	fld1
	fdivl	-120(%ebp)
	fstpl	-104(%ebp)
	movl	-44(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	invnchoosek
	movl	%eax, -28(%ebp)
	movl	$0, -80(%ebp)
	jmp	.L2
.L17:
	fldz
	fstpl	-128(%ebp)
	movl	-80(%ebp), %eax
	imull	-48(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	$0, -64(%ebp)
	jmp	.L3
.L16:
	movl	-64(%ebp), %eax
	imull	-48(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	-64(%ebp), %eax
	imull	-44(%ebp), %eax
	movl	%eax, -16(%ebp)
	fldz
	fstpl	-136(%ebp)
	movl	$0, -88(%ebp)
	jmp	.L4
.L5:
	movl	-88(%ebp), %eax
	sall	$3, %eax
	addl	-32(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	-88(%ebp), %ecx
	addl	%ecx, %edx
	sall	$3, %edx
	addl	8(%ebp), %edx
	fldl	(%edx)
	movl	-20(%ebp), %edx
	movl	-88(%ebp), %ecx
	addl	%ecx, %edx
	sall	$3, %edx
	addl	-56(%ebp), %edx
	fldl	(%edx)
	fsubrp	%st, %st(1)
	fmull	-104(%ebp)
	fstpl	(%eax)
	movl	-88(%ebp), %eax
	sall	$3, %eax
	addl	-32(%ebp), %eax
	fldl	(%eax)
	movl	-88(%ebp), %eax
	sall	$3, %eax
	addl	-32(%ebp), %eax
	fldl	(%eax)
	fmulp	%st, %st(1)
	fldl	-136(%ebp)
	faddp	%st, %st(1)
	fstpl	-136(%ebp)
	movl	-88(%ebp), %eax
	sall	$2, %eax
	addl	-36(%ebp), %eax
	movl	$0, (%eax)
	addl	$1, -88(%ebp)
.L4:
	movl	-88(%ebp), %eax
	cmpl	-48(%ebp), %eax
	jl	.L5
	fldl	-136(%ebp)
	fldl	-112(%ebp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	seta	%al
	testb	%al, %al
	jne	.L18
.L6:
	fldl	-136(%ebp)
	fldl	.LC2
	fmulp	%st, %st(1)
	fstpl	(%esp)
	call	exp
	movl	-40(%ebp), %eax
	fstpl	(%eax)
	movl	$.LC3, %eax
	movl	-44(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	-48(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	computeBuffer
	movl	$1, -76(%ebp)
	movl	$1, -72(%ebp)
	movl	$1, -68(%ebp)
	jmp	.L8
.L13:
	movl	$0, -88(%ebp)
	jmp	.L9
.L12:
	movl	-88(%ebp), %eax
	sall	$2, %eax
	addl	-36(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-88(%ebp), %eax
	sall	$2, %eax
	addl	-36(%ebp), %eax
	movl	-72(%ebp), %edx
	movl	%edx, (%eax)
	movl	-88(%ebp), %eax
	sall	$3, %eax
	addl	-32(%ebp), %eax
	fldl	(%eax)
	fstpl	-96(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, -84(%ebp)
	jmp	.L10
.L11:
	movl	-72(%ebp), %eax
	sall	$3, %eax
	addl	-40(%ebp), %eax
	movl	-84(%ebp), %edx
	sall	$3, %edx
	addl	-40(%ebp), %edx
	fldl	(%edx)
	fmull	-96(%ebp)
	fstpl	(%eax)
	addl	$1, -84(%ebp)
	addl	$1, -72(%ebp)
.L10:
	movl	-84(%ebp), %eax
	cmpl	-68(%ebp), %eax
	jl	.L11
	addl	$1, -88(%ebp)
.L9:
	movl	-88(%ebp), %eax
	cmpl	-48(%ebp), %eax
	jl	.L12
	addl	$1, -76(%ebp)
	movl	-72(%ebp), %eax
	movl	%eax, -68(%ebp)
.L8:
	movl	-76(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jl	.L13
	movl	$0, -88(%ebp)
	jmp	.L14
.L15:
	movl	-16(%ebp), %eax
	movl	-88(%ebp), %edx
	addl	%edx, %eax
	sall	$3, %eax
	addl	-60(%ebp), %eax
	fldl	(%eax)
	movl	-88(%ebp), %eax
	sall	$3, %eax
	addl	-40(%ebp), %eax
	fldl	(%eax)
	fmulp	%st, %st(1)
	fldl	-128(%ebp)
	faddp	%st, %st(1)
	fstpl	-128(%ebp)
	addl	$1, -88(%ebp)
.L14:
	movl	-88(%ebp), %eax
	cmpl	-44(%ebp), %eax
	jl	.L15
	jmp	.L7
.L18:
	nop
.L7:
	addl	$1, -64(%ebp)
.L3:
	movl	-64(%ebp), %eax
	cmpl	-52(%ebp), %eax
	jl	.L16
	movl	-80(%ebp), %eax
	sall	$3, %eax
	addl	16(%ebp), %eax
	fldl	-128(%ebp)
	fstpl	(%eax)
	addl	$1, -80(%ebp)
.L2:
	movl	-80(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L17
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	fgt_predict, .-fgt_predict
	.globl	invnchoosek
	.type	invnchoosek, @function
invnchoosek:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	movl	$1, -16(%ebp)
	movl	$2, -20(%ebp)
	jmp	.L20
.L21:
	movl	-16(%ebp), %eax
	imull	-20(%ebp), %eax
	movl	%eax, -16(%ebp)
	addl	$1, -20(%ebp)
.L20:
	movl	-20(%ebp), %eax
	cmpl	8(%ebp), %eax
	jle	.L21
	movl	12(%ebp), %eax
	imull	-16(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	$2, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -20(%ebp)
	jmp	.L22
.L23:
	movl	-12(%ebp), %eax
	imull	-20(%ebp), %eax
	movl	%eax, -12(%ebp)
	addl	$1, -20(%ebp)
.L22:
	movl	8(%ebp), %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	cmpl	-20(%ebp), %eax
	jg	.L23
	jmp	.L24
.L25:
	movl	8(%ebp), %eax
	movl	-8(%ebp), %edx
	addl	%edx, %eax
	imull	-12(%ebp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	-8(%ebp)
	movl	%eax, -12(%ebp)
	addl	$1, -8(%ebp)
.L24:
	movl	-12(%ebp), %eax
	cmpl	-4(%ebp), %eax
	jne	.L25
	movl	-8(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	invnchoosek, .-invnchoosek
	.globl	fgt_model
	.type	fgt_model, @function
fgt_model:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$152, %esp
	movl	16(%ebp), %eax
	movl	%eax, -80(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, -76(%ebp)
	movl	32(%ebp), %eax
	movl	%eax, -88(%ebp)
	movl	36(%ebp), %eax
	movl	%eax, -84(%ebp)
	movl	40(%ebp), %eax
	movl	24(%ebp), %edx
	addl	%edx, %eax
	leal	-1(%eax), %edx
	movl	40(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	nchoosek
	movl	%eax, -64(%ebp)
	movl	-64(%ebp), %eax
	sall	$3, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -60(%ebp)
	movl	44(%ebp), %eax
	sall	$3, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -56(%ebp)
	movl	-64(%ebp), %eax
	sall	$3, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -52(%ebp)
	movl	40(%ebp), %eax
	addl	$1, %eax
	sall	$2, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -48(%ebp)
	movl	40(%ebp), %eax
	sall	$3, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -44(%ebp)
	movl	40(%ebp), %edx
	movl	28(%ebp), %eax
	imull	%edx, %eax
	sall	$3, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -40(%ebp)
	movl	-64(%ebp), %edx
	movl	28(%ebp), %eax
	imull	%edx, %eax
	sall	$3, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -36(%ebp)
	movl	28(%ebp), %eax
	sall	$2, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -32(%ebp)
	movl	44(%ebp), %eax
	sall	$2, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -28(%ebp)
	movl	28(%ebp), %eax
	sall	$2, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -24(%ebp)
	movl	28(%ebp), %eax
	sall	$2, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -20(%ebp)
	movl	-64(%ebp), %eax
	sall	$2, %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -16(%ebp)
	movl	-56(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	-40(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	Kcenter
	movl	-16(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-48(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-60(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	40(%ebp), %eax
	movl	%eax, (%esp)
	call	Compute_C_k
	movl	-48(%ebp), %eax
	movl	%eax, 60(%esp)
	movl	-52(%ebp), %eax
	movl	%eax, 56(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, 52(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 48(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	-64(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 24(%esp)
	fldl	-80(%ebp)
	fstpl	16(%esp)
	movl	-60(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-40(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	Compute_A_k
	movl	$52, (%esp)
	call	malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	-48(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-12(%ebp), %eax
	movl	-44(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-12(%ebp), %eax
	fldl	-80(%ebp)
	fstpl	20(%eax)
	movl	-12(%ebp), %eax
	movl	-64(%ebp), %edx
	movl	%edx, 28(%eax)
	movl	-12(%ebp), %eax
	movl	28(%ebp), %edx
	movl	%edx, 32(%eax)
	movl	-12(%ebp), %eax
	fldl	-88(%ebp)
	fstpl	36(%eax)
	movl	-12(%ebp), %eax
	movl	40(%ebp), %edx
	movl	%edx, 44(%eax)
	movl	-12(%ebp), %eax
	movl	44(%ebp), %edx
	movl	%edx, 48(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	fgt_model, .-fgt_model
	.globl	Kcenter
	.type	Kcenter, @function
Kcenter:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	movl	$1, -16(%ebp)
	movl	28(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, (%eax)
	addl	$4, 28(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -36(%ebp)
	movl	-16(%ebp), %eax
	imull	12(%ebp), %eax
	sall	$3, %eax
	addl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -28(%ebp)
	jmp	.L28
	.cfi_offset 3, -12
.L31:
	movl	-28(%ebp), %eax
	sall	$3, %eax
	movl	%eax, %ebx
	addl	40(%ebp), %ebx
	movl	-28(%ebp), %eax
	cmpl	-16(%ebp), %eax
	je	.L29
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	ddist
	jmp	.L30
.L29:
	fldz
.L30:
	fstpl	(%ebx)
	movl	-28(%ebp), %eax
	sall	$2, %eax
	addl	32(%ebp), %eax
	movl	$0, (%eax)
	movl	12(%ebp), %eax
	sall	$3, %eax
	addl	%eax, -36(%ebp)
	addl	$1, -28(%ebp)
.L28:
	movl	-28(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L31
	movl	$1, -32(%ebp)
	jmp	.L32
.L38:
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	40(%ebp), %eax
	movl	%eax, (%esp)
	call	idmax
	movl	%eax, -16(%ebp)
	movl	28(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, (%eax)
	addl	$4, 28(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -36(%ebp)
	movl	-16(%ebp), %eax
	imull	12(%ebp), %eax
	sall	$3, %eax
	addl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -28(%ebp)
	jmp	.L33
.L37:
	movl	-28(%ebp), %eax
	cmpl	-16(%ebp), %eax
	je	.L34
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	ddist
	jmp	.L35
.L34:
	fldz
.L35:
	fstpl	-56(%ebp)
	movl	-28(%ebp), %eax
	sall	$3, %eax
	addl	40(%ebp), %eax
	fldl	(%eax)
	fldl	-56(%ebp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	seta	%al
	testb	%al, %al
	je	.L36
	movl	-28(%ebp), %eax
	sall	$3, %eax
	addl	40(%ebp), %eax
	fldl	-56(%ebp)
	fstpl	(%eax)
	movl	-28(%ebp), %eax
	sall	$2, %eax
	addl	32(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, (%eax)
.L36:
	movl	12(%ebp), %eax
	sall	$3, %eax
	addl	%eax, -36(%ebp)
	addl	$1, -28(%ebp)
.L33:
	movl	-28(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L37
	addl	$1, -32(%ebp)
.L32:
	movl	-32(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	.L38
	movl	$0, -32(%ebp)
	jmp	.L39
.L40:
	movl	-32(%ebp), %eax
	sall	$2, %eax
	addl	36(%ebp), %eax
	movl	$0, (%eax)
	addl	$1, -32(%ebp)
.L39:
	movl	-32(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	.L40
	movl	$0, -32(%ebp)
	jmp	.L41
.L42:
	movl	-32(%ebp), %eax
	sall	$3, %eax
	addl	24(%ebp), %eax
	fldz
	fstpl	(%eax)
	addl	$1, -32(%ebp)
.L41:
	movl	12(%ebp), %eax
	imull	20(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jg	.L42
	movl	$0, -32(%ebp)
	movl	$0, -24(%ebp)
	jmp	.L43
.L46:
	movl	-32(%ebp), %eax
	sall	$2, %eax
	addl	32(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	addl	36(%ebp), %eax
	movl	(%eax), %edx
	addl	$1, %edx
	movl	%edx, (%eax)
	movl	-32(%ebp), %eax
	sall	$2, %eax
	addl	32(%ebp), %eax
	movl	(%eax), %eax
	imull	12(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	$0, -28(%ebp)
	jmp	.L44
.L45:
	movl	-20(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	%edx, %eax
	sall	$3, %eax
	addl	24(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	-28(%ebp), %ecx
	addl	%ecx, %edx
	sall	$3, %edx
	addl	24(%ebp), %edx
	fldl	(%edx)
	movl	-24(%ebp), %edx
	movl	-28(%ebp), %ecx
	addl	%ecx, %edx
	sall	$3, %edx
	addl	8(%ebp), %edx
	fldl	(%edx)
	faddp	%st, %st(1)
	fstpl	(%eax)
	addl	$1, -28(%ebp)
.L44:
	movl	-28(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L45
	addl	$1, -32(%ebp)
	movl	12(%ebp), %eax
	addl	%eax, -24(%ebp)
.L43:
	movl	-32(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L46
	movl	$0, -32(%ebp)
	movl	$0, -20(%ebp)
	jmp	.L47
.L50:
	movl	-32(%ebp), %eax
	sall	$2, %eax
	addl	36(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	fld1
	fdivp	%st, %st(1)
	fstpl	-56(%ebp)
	movl	$0, -28(%ebp)
	jmp	.L48
.L49:
	movl	-20(%ebp), %eax
	movl	-28(%ebp), %edx
	addl	%edx, %eax
	sall	$3, %eax
	addl	24(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	-28(%ebp), %ecx
	addl	%ecx, %edx
	sall	$3, %edx
	addl	24(%ebp), %edx
	fldl	(%edx)
	fmull	-56(%ebp)
	fstpl	(%eax)
	addl	$1, -28(%ebp)
.L48:
	movl	-28(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L49
	addl	$1, -32(%ebp)
	movl	12(%ebp), %eax
	addl	%eax, -20(%ebp)
.L47:
	movl	-32(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	.L50
	addl	$68, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
	.cfi_endproc
.LFE3:
	.size	Kcenter, .-Kcenter
	.globl	Compute_C_k
	.type	Compute_C_k, @function
Compute_C_k:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -24(%ebp)
	jmp	.L52
.L53:
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	20(%ebp), %eax
	movl	$0, (%eax)
	addl	$1, -24(%ebp)
.L52:
	movl	-24(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	.L53
	movl	8(%ebp), %eax
	sall	$2, %eax
	addl	20(%ebp), %eax
	movl	$2147483647, (%eax)
	movl	24(%ebp), %eax
	movl	$0, (%eax)
	movl	16(%ebp), %eax
	fld1
	fstpl	(%eax)
	movl	$1, -20(%ebp)
	movl	$1, -16(%ebp)
	movl	$1, -8(%ebp)
	jmp	.L54
.L61:
	movl	$0, -24(%ebp)
	jmp	.L55
.L60:
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	20(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	20(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, (%eax)
	movl	-4(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	.L56
.L59:
	movl	-16(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	addl	24(%ebp), %edx
	movl	-24(%ebp), %eax
	addl	$1, %eax
	sall	$2, %eax
	addl	20(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-12(%ebp), %eax
	jle	.L57
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	$1, %eax
	jmp	.L58
.L57:
	movl	$1, %eax
.L58:
	movl	%eax, (%edx)
	movl	-16(%ebp), %eax
	sall	$3, %eax
	addl	16(%ebp), %eax
	movl	-12(%ebp), %edx
	sall	$3, %edx
	addl	16(%ebp), %edx
	fldl	(%edx)
	fadd	%st(0), %st
	fstpl	(%eax)
	movl	-16(%ebp), %eax
	sall	$3, %eax
	addl	16(%ebp), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	16(%ebp), %edx
	fldl	(%edx)
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	24(%ebp), %edx
	movl	(%edx), %edx
	movl	%edx, -36(%ebp)
	fildl	-36(%ebp)
	fdivrp	%st, %st(1)
	fstpl	(%eax)
	addl	$1, -12(%ebp)
	addl	$1, -16(%ebp)
.L56:
	movl	-12(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jl	.L59
	addl	$1, -24(%ebp)
.L55:
	movl	-24(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	.L60
	addl	$1, -20(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, -8(%ebp)
.L54:
	movl	-20(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L61
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	Compute_C_k, .-Compute_C_k
	.globl	Compute_A_k
	.type	Compute_A_k, @function
Compute_A_k:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$120, %esp
	movl	24(%ebp), %eax
	movl	%eax, -64(%ebp)
	movl	28(%ebp), %eax
	movl	%eax, -60(%ebp)
	fld1
	fdivl	-64(%ebp)
	fstpl	-80(%ebp)
	movl	$0, -48(%ebp)
	jmp	.L63
.L64:
	movl	-48(%ebp), %eax
	sall	$3, %eax
	addl	52(%ebp), %eax
	fldz
	fstpl	(%eax)
	addl	$1, -48(%ebp)
.L63:
	movl	48(%ebp), %eax
	imull	44(%ebp), %eax
	cmpl	-48(%ebp), %eax
	jg	.L64
	movl	$0, -52(%ebp)
	jmp	.L65
.L76:
	movl	-52(%ebp), %eax
	imull	32(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	-52(%ebp), %eax
	sall	$2, %eax
	addl	56(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	imull	32(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	-24(%ebp), %eax
	imull	48(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-52(%ebp), %eax
	sall	$3, %eax
	addl	12(%ebp), %eax
	fldl	(%eax)
	fstpl	-88(%ebp)
	fldz
	fstpl	-72(%ebp)
	movl	$0, -48(%ebp)
	jmp	.L66
.L67:
	movl	-48(%ebp), %eax
	sall	$3, %eax
	addl	60(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	-48(%ebp), %ecx
	addl	%ecx, %edx
	sall	$3, %edx
	addl	8(%ebp), %edx
	fldl	(%edx)
	movl	-20(%ebp), %edx
	movl	-48(%ebp), %ecx
	addl	%ecx, %edx
	sall	$3, %edx
	addl	16(%ebp), %edx
	fldl	(%edx)
	fsubrp	%st, %st(1)
	fmull	-80(%ebp)
	fstpl	(%eax)
	movl	-48(%ebp), %eax
	sall	$3, %eax
	addl	60(%ebp), %eax
	fldl	(%eax)
	movl	-48(%ebp), %eax
	sall	$3, %eax
	addl	60(%ebp), %eax
	fldl	(%eax)
	fmulp	%st, %st(1)
	fldl	-72(%ebp)
	faddp	%st, %st(1)
	fstpl	-72(%ebp)
	movl	-48(%ebp), %eax
	sall	$2, %eax
	addl	68(%ebp), %eax
	movl	$0, (%eax)
	addl	$1, -48(%ebp)
.L66:
	movl	-48(%ebp), %eax
	cmpl	32(%ebp), %eax
	jl	.L67
	fldl	-72(%ebp)
	fchs
	fstpl	(%esp)
	call	exp
	movl	64(%ebp), %eax
	fstpl	(%eax)
	movl	$1, -44(%ebp)
	movl	$1, -40(%ebp)
	movl	$1, -36(%ebp)
	jmp	.L68
.L73:
	movl	$0, -48(%ebp)
	jmp	.L69
.L72:
	movl	-48(%ebp), %eax
	sall	$2, %eax
	addl	68(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-48(%ebp), %eax
	sall	$2, %eax
	addl	68(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, (%eax)
	movl	-48(%ebp), %eax
	sall	$3, %eax
	addl	60(%ebp), %eax
	fldl	(%eax)
	fstpl	-96(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, -32(%ebp)
	jmp	.L70
.L71:
	movl	-40(%ebp), %eax
	sall	$3, %eax
	addl	64(%ebp), %eax
	movl	-32(%ebp), %edx
	sall	$3, %edx
	addl	64(%ebp), %edx
	fldl	(%edx)
	fmull	-96(%ebp)
	fstpl	(%eax)
	addl	$1, -32(%ebp)
	addl	$1, -40(%ebp)
.L70:
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jl	.L71
	addl	$1, -48(%ebp)
.L69:
	movl	-48(%ebp), %eax
	cmpl	32(%ebp), %eax
	jl	.L72
	addl	$1, -44(%ebp)
	movl	-40(%ebp), %eax
	movl	%eax, -36(%ebp)
.L68:
	movl	-44(%ebp), %eax
	cmpl	40(%ebp), %eax
	jl	.L73
	movl	$0, -48(%ebp)
	jmp	.L74
.L75:
	movl	-16(%ebp), %eax
	movl	-48(%ebp), %edx
	addl	%edx, %eax
	sall	$3, %eax
	addl	52(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	-48(%ebp), %ecx
	addl	%ecx, %edx
	sall	$3, %edx
	addl	52(%ebp), %edx
	fldl	(%edx)
	movl	-48(%ebp), %edx
	sall	$3, %edx
	addl	64(%ebp), %edx
	fldl	(%edx)
	fmull	-88(%ebp)
	faddp	%st, %st(1)
	fstpl	(%eax)
	addl	$1, -48(%ebp)
.L74:
	movl	-48(%ebp), %eax
	cmpl	48(%ebp), %eax
	jl	.L75
	addl	$1, -52(%ebp)
.L65:
	movl	-52(%ebp), %eax
	cmpl	36(%ebp), %eax
	jl	.L76
	movl	$0, -44(%ebp)
	jmp	.L77
.L80:
	movl	-44(%ebp), %eax
	imull	48(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	$0, -48(%ebp)
	jmp	.L78
.L79:
	movl	-16(%ebp), %eax
	movl	-48(%ebp), %edx
	addl	%edx, %eax
	sall	$3, %eax
	addl	52(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	-48(%ebp), %ecx
	addl	%ecx, %edx
	sall	$3, %edx
	addl	52(%ebp), %edx
	fldl	(%edx)
	movl	-48(%ebp), %edx
	sall	$3, %edx
	addl	20(%ebp), %edx
	fldl	(%edx)
	fmulp	%st, %st(1)
	fstpl	(%eax)
	addl	$1, -48(%ebp)
.L78:
	movl	-48(%ebp), %eax
	cmpl	48(%ebp), %eax
	jl	.L79
	addl	$1, -44(%ebp)
.L77:
	movl	-44(%ebp), %eax
	cmpl	44(%ebp), %eax
	jl	.L80
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	Compute_A_k, .-Compute_A_k
	.globl	nchoosek
	.type	nchoosek, @function
nchoosek:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -8(%ebp)
	movl	$1, -4(%ebp)
	movl	12(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jge	.L82
	movl	-8(%ebp), %eax
	movl	%eax, 12(%ebp)
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -8(%ebp)
.L82:
	movl	$1, -12(%ebp)
	jmp	.L83
.L84:
	addl	$1, 12(%ebp)
	movl	-4(%ebp), %eax
	imull	12(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	-12(%ebp)
	movl	%eax, -4(%ebp)
	addl	$1, -12(%ebp)
.L83:
	movl	-12(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jle	.L84
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	nchoosek, .-nchoosek
	.globl	ddist
	.type	ddist, @function
ddist:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	fldz
	fstpl	-24(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L86
.L87:
	movl	-4(%ebp), %eax
	sall	$3, %eax
	addl	8(%ebp), %eax
	fldl	(%eax)
	movl	-4(%ebp), %eax
	sall	$3, %eax
	addl	12(%ebp), %eax
	fldl	(%eax)
	fsubrp	%st, %st(1)
	fstpl	-32(%ebp)
	fldl	-32(%ebp)
	fmull	-32(%ebp)
	fldl	-24(%ebp)
	faddp	%st, %st(1)
	fstpl	-24(%ebp)
	addl	$1, -4(%ebp)
.L86:
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L87
	fldl	-24(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	ddist, .-ddist
	.globl	idmax
	.type	idmax, @function
idmax:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	fld1
	fchs
	fstpl	-16(%ebp)
	movl	$0, -8(%ebp)
	jmp	.L89
.L91:
	movl	-8(%ebp), %eax
	sall	$3, %eax
	addl	8(%ebp), %eax
	fldl	(%eax)
	fldl	-16(%ebp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	seta	%al
	testb	%al, %al
	je	.L90
	movl	-8(%ebp), %eax
	sall	$3, %eax
	addl	8(%ebp), %eax
	fldl	(%eax)
	fstpl	-16(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, -4(%ebp)
.L90:
	addl	$1, -8(%ebp)
.L89:
	movl	-8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L91
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	idmax, .-idmax
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	-1075838976
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
