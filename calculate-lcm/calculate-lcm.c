/*
Program description: Program to calculate LCM of two positive numbers
*/

#include <stdio.h>
int LCM(int n1, int n2, int gcd);
int main()
{
  int n1, n2, n2Modified;
  int gcd, lcm;
  printf("Enter the first positive integers: ");
  scanf("%d", &n1);
  printf("Enter the second positive integers: ");
  scanf("%d", &n2);
  gcd = n1;
  n2Modified = n2;
  while (gcd != n2Modified)
  {
    if (gcd > n2Modified)
      gcd -= n2Modified;
    else
      n2Modified -= gcd;
  }
  lcm = LCM(n1, n2, gcd);
  printf("The LCM of two numbers %d and %d is %d.", n1, n2, lcm);
  return 0;
}
int LCM(int n1, int n2, int gcd)
{
  int lcm = (n1 * n2) / gcd;
  return lcm;
}