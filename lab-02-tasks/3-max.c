#include <stdio.h>
int main()
{
    int v[10]={0, 13, 2, 23, 34, 5, 16, 7, 8, 9};
    int max = -1;
    int i = 0;
    int length = 10;
assign_max:
    max = v[i];
i_is_less_than_length:
    if(v[i] > max)
        goto assign_max;
//inc_i:
    i++;
    if( i < length )
        goto i_is_less_than_length;

    if(i >= length)
        printf("%d\n", max);
    
    return 0;
    
}