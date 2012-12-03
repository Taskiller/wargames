#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> 

int main(){
	//int euid = geteuid();
	int euid = getuid();
	printf("AAAAA\n");
	printf("%d",euid);
	return 0;
}