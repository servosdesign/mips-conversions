/*
Program description: Program to concatenate two strings and count vowels and consonents
*/

#include <stdio.h>
void countVowelConsotant(char str[100])
{
  int i = 0;
  int vCount = 0, cCount = 0;
  printf("String with just alphabets: ");
  puts(str);
  while (str[i] != '\0')
  {
    if (str[i] == 'A' || str[i] == 'E' || str[i] == 'I' || str[i] == 'O' || str[i] == 'U' || str[i] == 'a' || str[i] == 'e' || str[i] == 'i' || str[i] == 'o' || str[i] == 'u') // [5 mark]
      vCount++;
    else
      cCount++;
    i++;
  }
  printf("Number of Vowels in String: %d\n", vCount);
  printf("Number of Consonants in String: %d", cCount);
}
void removeNonAlphaCharacters(char line[100])
{
  printf("Combined String: ");
  puts(line);
  for (int i = 0, j; line[i] != '\0'; ++i)
  {
    while (!(line[i] >= 'a' && line[i] <= 'z') && !(line[i] >= 'A' && line[i] <= 'Z') &&
           !(line[i] == '\0'))
    {
      for (j = i; line[j] != '\0'; ++j)
      {

        line[j] = line[j + 1];
      }
      line[j] = '\0';
    }
  }
  countVowelConsotant(line);
}
void concatenate(char str1[50], char str2[50])
{
  int i, j, len;
  for (i = 0; str1[i] != '\0'; ++i)
    for (j = 0; str2[j] != '\0'; ++j, ++i)
      str1[i] = str2[j];

  str1[i] = '\0';
  removeNonAlphaCharacters(str1);
}
int main()
{
  char str1[50], str2[50];
  printf("Enter the first string: ");
  fgets(str1, 50, stdin);
  printf("Enter the second string: ");
  fgets(str2, 50, stdin);
  concatenate(str1, str2);
  return 0;
}
