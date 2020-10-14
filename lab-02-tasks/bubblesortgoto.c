#include <stdio.h>
int main()
{
    int v[10]={0, 13, 2, 23, 34, 5, 16, 7, 8, 9};
    int length = 10;
    int i = 1;
    int aux = 0;
    goto test;
swapp:
    aux = v[i];
    v[i] = v[i-1];
    v[i-1] = aux;
    i++;
test:
    if(v[i] > v[i-1])
        goto inc_i;
    if(v[i] < v[i-1])
        goto swapp;
inc_i:
    i++;
    if(i >= length)
        goto end;
    goto test;
end:
    for(int j = 0; j < 10; j++)
        printf("%d ", v[i]);
    printf("\n");

    return 0;
}