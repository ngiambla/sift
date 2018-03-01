#include<stdio.h>


float pickle_me() {

	return 1234.00;
} 

int main() {
	int i 		= 0;
	int count 	= 0;	
	printf("~ Testing compilation with clang.\n");
	for(i=0; i < count+100; ++i) {
		count = -i;
		printf("[%d]\n", i);
		pickle_me();
	}
	return (1);
}