
/*
	double convolution(double *a,double *b,int n);
	Function which is optimized by SSE2 computing convolution.
	(a[0]*b[0]) + ... + (a[n-1]*b[n-1])
*/
.data
sumInit: .double 0.0,0.0
.text
.globl convolution
convolution:
	pushl	%ebp
	movl	%esp,%ebp
	subl	$20,%esp
	movl	16(%ebp),%ecx /* insert n */
	/* if n is 0, return 0*/
	test	%ecx,%ecx
	jnz	MAIN_PROCESS
	fldz
	leave
	ret
MAIN_PROCESS:
	movl	8(%ebp),%eax /* a pointer */
	movl	12(%ebp),%ebx /* b pointer */
	movupd	sumInit,%xmm2 /* init sum*/
	/* n divided by 2 */
	shrl	$1,%ecx
LOOP_IN:
	movupd	(%eax),%xmm0
	movupd	(%ebx),%xmm1
	mulpd	%xmm1,%xmm0
	addpd	%xmm0,%xmm2
	addl	$16,%eax
	addl	$16,%ebx
	loopl	LOOP_IN

	movupd	%xmm2,-16(%ebp)
	fldl    -16(%ebp)
	faddl	-8(%ebp)
	
	andl	$1,16(%ebp)
	jz	FUNCTION_FINISH
	fstpl	-8(%ebp)
	/* If n is odd number,Caluclation one more times. */
	fldl	(%eax)
	fsubl	(%ebx)
	fmul	%st(0)
	faddl	-8(%ebp)
FUNCTION_FINISH:
	leave
	ret
	
