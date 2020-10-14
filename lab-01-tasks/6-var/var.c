#include <stdio.h>

int main(void)
{
    short a = 18446;
    short b = 14000;

    short c = a + b;
    unsigned short d = 3 * a + b;
    short e = a << 1;
    int mask = 128;
printf("a: ");
 	while (mask > 0)
	{
		if (mask & a)
			printf("1");
		else
			printf("0");
		mask = mask >> 1;	
	}
	printf("\n");
    mask = 128;
printf("b: ");
 	while (mask > 0)
	{
		if (mask & b)
			printf("1");
		else
			printf("0");
		mask = mask >> 1;	
	}
	printf("\n");

    printf("c: %hi\n", c);
    printf("d: %hu\n", d);
    printf("e: %hi\n", e);
mask = 128;
printf("c: ");
 	while (mask > 0)
	{
		if (mask & c)
			printf("1");
		else
			printf("0");
		mask = mask >> 1;	
	}
	printf("\n");
mask = 128;
printf("d: ");
 	while (mask > 0)
	{
		if (mask & d)
			printf("1");
		else
			printf("0");
		mask = mask >> 1;	
	}
	printf("\n");
mask = 128;
printf("e: ");
 	while (mask > 0)
	{
		if (mask & e)
			printf("1");
		else
			printf("0");
		mask = mask >> 1;	
	}
	printf("\n");

    return 0;
}
