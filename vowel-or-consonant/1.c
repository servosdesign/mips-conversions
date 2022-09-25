/*
Program description: Check whether a character is a vowel or a consonant
*/

#include <stdio.h>
int main()
{
  char c;
  int lowercase_vowel = 0, uppercase_vowel = 0;
  printf("Enter an alphabet: ");
  scanf("%c", &c);
  // check if variable c is a lowercase vowel
  if (c == 97 || c == 101 || c == 105 || c == 111 || c == 117)
    lowercase_vowel = 1;
  // check if variable c is a uppercase vowel
  if (c == 65 || c == 69 || c == 73 || c == 79 || c == 85) // [5.5 mark]
    uppercase_vowel = 1;
  // evaluates to 1 (true) if c is a vowel
  if (lowercase_vowel || uppercase_vowel)
    printf("%c is a vowel.", c);
  else
    printf("%c is a consonant.", c);
  return 0;
}
