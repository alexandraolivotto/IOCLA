#include <stdio.h>
int main()
{
    int v[10]={0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int to_find = 2;
    int i = 0;
    int length = 10;
    int init_half = length/2;
    int current_len = length/2;
    int ref_length_left = 10;
    int ref_length_right = 10;
    int less = 0;
    int more = 0;
    length = length/2;
    goto testright;
leftside_search:
    length = init_half + more + current_len/2;
    current_len = current_len/2;
    more = current_len;
    goto testright;
rightside_search:
    length = init_half - less - current_len/2;
    current_len = current_len/2;
    less = current_len;
testright:
    if(v[length] > to_find)
        goto rightside_search;
testleft:
    if(v[length] < to_find)
        goto leftside_search;
    if(v[length/2] == to_find)
        goto end;
    if (length > )
end:
    printf("%d\n", to_find);
    return 0;
}