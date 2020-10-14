#include <stdio.h>

#define NUM	0x12345678

int main(void)
{
	size_t n = NUM;//2
	size_t rot_left;//0
	size_t rot_right;//1

	__asm__ (
	"mov eax, %2\n"
	"rol eax, 8\n"
	"mov %0, eax\n\t"
	"mov ecx, %2\n"
	"ror ecx, 8\n"
	"mov %1, ecx"
	: "=r" (rot_left), "=p" (rot_right) /* output variable */
	: "r" (n) /* input variable */
	: "eax", "ecx" );

	/* NOTE: Output variables are passed by address, input variables
	 * are passed by value.
	 */

	printf("init: 0x%08x, rot_left: 0x%08x, rot_right: 0x%08x\n",
			n, rot_left, rot_right);

	return 0;
}
