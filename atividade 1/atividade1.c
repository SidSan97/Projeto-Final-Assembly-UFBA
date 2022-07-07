#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  int aux = -1;
  int aux2 = 0;
  char auxLetra;
  char stringRemovida[33];
  char nome[65];
  char alfabeto[26] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};

  for(int i=0; i<65; i++)
  {
      scanf("%c", &nome[i]);
  }

  for(int i=0; i<=65; i++)
  {
    if(i > 17 && i < 51)
    {
      aux++;
      stringRemovida[aux] = nome[i];
    }
  }

  printf("A) ");
  for(int i=0; i < 33; i++)
  {
    printf("%c",stringRemovida[i]);
  }

  printf("\n");

  printf("B) ");
  for(int i=31; i >=0; i--)
  {
    printf("%c", stringRemovida[i]);
  }

  printf("\n");

  printf("C) ");
  for(int i=0; i< 32; i++)
  {
    if(stringRemovida[i] != ' ')
    {
      printf("%c", stringRemovida[i]);
    }
  }

  printf("\n");

  printf("D) ");
  for(int i=0; i<32; i++)
  {
    aux2 = stringRemovida[i];
    if(i % 2 == 0)
    {
      aux2 = aux2 - 32;
      printf("%c", aux2);
    }
    else
    {
      printf("%c", stringRemovida[i]);
    }
  }

  printf("\n");

  printf("E) \n");
  for(int i=0; i<32; i++)
  {
    auxLetra = stringRemovida[i];

    for(int i=0; i<=26; i++)
    {
      if(auxLetra == alfabeto[i])
      {
        printf("%c -> %d", auxLetra, i+1);
        //printf("\n");
        //break;
      }
    }
  }

  return 0;
}
