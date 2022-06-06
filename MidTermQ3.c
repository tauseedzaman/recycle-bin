#include <stdio.h>

void main() {

    char vowelArray[] = "aeiouAEIOU";

    char testArray[] = "testalostREADY"; {
      int i;
      for (i = 0; testArray[i] != '\0'; i++) {

        if (testArray[i] == 'a' || testArray[i] == 'e' || testArray[i] == 'i' || testArray[i] == 'o' || testArray[i] == 'u' || testArray[i] == 'A' || testArray[i] == 'E' || testArray[i] == 'I' || testArray[i] == 'O' || testArray[i] == 'U') {
          printf("\n%c is vowel ", testArray[i]);

        } else {
          printf("\n%c is consonant ", testArray[i]);
        }
      }

    }
}