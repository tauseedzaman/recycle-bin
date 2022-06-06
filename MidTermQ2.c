#include <stdio.h>

void main()
{
  int numArray[] = { 5, 6, 12, 17, 19, 45, 67, 48, 24, 31 };
  int length = sizeof(numArray) / sizeof(int);
    for(int i=0 ; i<length ; i++)
{
    if(numArray[i] % 2 ==0)
    {
        printf("\n%d is an even integer", numArray[i]);
    }
    else
    {
        printf("\n%d is an odd integer", numArray[i],"\n\n");
    }
}
} 