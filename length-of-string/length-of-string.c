/*
Program description: Find the length of a String and the array starting address
*/

#include <stdio.h>
int main()
{
  // Char array of size 100 can hold a string of 100 chars
  char str[100];
  char i;
  printf("Please enter a string: \n");
  fgets(str, 100, stdin);
  // '\0' represents the end of String in C
  for (i = 0; str[i] != '\0'; ++i)
    ;
  printf("\nLength of input string: %d", i);
  printf("\nThe array starts at the memory location: %p", &str);
  return 0;
}