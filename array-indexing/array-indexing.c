/*
Program description: Access Array Elements Using array index
*/

#include <stdio.h>
int main()
{
  int data[] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
  printf("The array elements are: \n");
  for (int i = 0; i < 10; ++i)
    printf("%d\n", data[i]);
  return 0;
}
