#include<stdio.h>
#include<stdlib.h>
#include<time.h>

void wow(void) {
	int i = 0;
	while(i < 10) {
		printf("My main job is to 'wow' you...\n");
		i++;
	}
}


void holy_smokes(void) {
	int i = 100;
	for(; i> 0; i--) {
		srand(time(NULL));
		if(rand()%100==23) {
			exit(-1);
		}
	}
}

float foo(int a1, int a2) {
 if(a1 <= 0) {
	return a2*3.124;
 } else {
 	return foo(a1-a2, a2);
 }
}


float bar(int a1) {

	return 123.00*a1;
}

int square_n(int n) {
	return n*n;
}

int binary_search(float node_val) {
	if (node_val < 20) {
		return 0;
	} else {
		return 1;
	}
}

int main() {
	double time_spent;
	clock_t begin;
	clock_t end;
	begin = clock();
	printf("-- running [%d].\n",12);
	wow();
	end = clock();
	time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	printf("time_spent: %lf\n", time_spent);
	return (1);
}
