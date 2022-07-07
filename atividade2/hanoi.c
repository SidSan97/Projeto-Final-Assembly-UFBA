#include <stdio.h>

void hanoi(int n,char origem,char destino,char auxiliar){
	if(n==1){
		printf("\nMova o disco 1 da base %c para a base %c",origem ,destino);
		return;
	}
	hanoi(n-1,origem,auxiliar,destino);

	printf("\nMova o disco %d da base %c para a base %c",n,origem,destino);

	hanoi(n-1,auxiliar,destino,origem);
}

int main(){
	int n = 4;
  	printf("OBS: Quanto maior o numero, maior o disco \n");
	hanoi(n,'A','C','B');
	printf("\n");
	return 0;
}
