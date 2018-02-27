#include<stdio.h>


int main() {
	int i 		= 0;
	int count 	= 0;	
	printf("~ Testing compilation with clang.\n");
	for(i=0; i < count+100; ++i) {
		count = -i;
		printf("[%d]\n", i);
	}

	return (0);
}