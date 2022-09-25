/*
Program description: Print ASCII characters between the given range
*/

#include <stdio.h>
int main()
{
  char lowerRange, upperRange, c;
  printf("Please enter the first character: ");
  scanf(" %c", &lowerRange);
  printf("Please enter the last character: ");
  scanf(" %c", &upperRange);
  printf("The alphabets between %c and %c are: ", lowerRange, upperRange);
  for (c = lowerRange + 1; c < upperRange; ++c)
    printf("%c ", c);
  return 0;
}
