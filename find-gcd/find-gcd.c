/*
Program description: Find GCD of two whole numbers
*/

#include <stdio.h>
int main()
{
  int n1, n2, i;
  int gcd;
  printf("Enter two whole numbers greater than 0: ");
  scanf("%d %d", &n1, &n2);
  for (i = 1; i <= n1 && i <= n2; ++i)
  { // [3.5 mark]
    // ensure if i is a factor of both integers
    if (n1 % i == 0 && n2 % i == 0)
      gcd = i;
  }
  printf("G.C.D of %d and %d is %d", n1, n2, gcd);
  return 0;
}