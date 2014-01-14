.text
.global computeBuffer
computeBuffer:
	pushl	%ebp
	movl	%esp,%ebp
	subl	$28,%esp

	movl	$1,-4(%ebp) /* k <- 1 */
	movl	$1,%edi /*t <- 1 */
	movl	$1,-12(%ebp) /*tail <- 1 */
LOOP1_IN:
	movl	-4(%ebp),%eax 
	cmpl	20(%ebp),%eax /* test k and p */
	jbe	LOOP1_OUT
	movl	$0,-16(%ebp) /* i <- 0 */
	movl	12(%ebp),%esi /* esi <- heads */
LOOP2_IN:
	movl	-16(%ebp),%eax 
	cmpl	24(%ebp),%eax /* test i and d */
	je	LOOP2_OUT
	movl	(%esi),%ecx /* j <- *(heads+i*4) */
	movl	%edi,(%esi) /* *(heads+i*4) <- t */
	movl	8(%ebp),%ebx
	movl	8(%ebp),%edx
	movl	%edi,%eax
	shll	$3,%eax
	addl	%eax,%ebx /* ebx <- prods+t*8 */
	movl	%ecx,%eax
	shll	$3,%eax
	addl	%eax,%edx /* edx <- prods+j*8 */
	movl	-12(%ebp),%eax
	subl	%ecx,%eax
	movl	%eax,%ecx /* ecx <- tail-j */
	movl	-16(%ebp),%eax
	shll	$3,%eax
	addl	16(%ebp),%eax /* eax <- dy+i*8 */
LOOP3_IN:
	fldl	(%eax)
	fmul	(%edx)
	fstpl	(%ebx)
	addl	$8,%ebx
	addl	$8,%edx
	incl	%edi /* t++*/
	loopl	LOOP3_IN

	incl	-16(%ebp) /*i++*/
	addl	$4,%esi /* heads+=4 */
	jmp	LOOP2_IN
LOOP2_OUT:
	/*tail=t*/
	movl	%edi,%eax /* tail <- t */
	movl	%eax,-12(%ebp)
	incl	-4(%ebp) /* k++ */
	jmp	LOOP1_IN
LOOP1_OUT:
	leave
	ret
