#include <stdio.h>
#include <iostream>
#include <unistd.h>
#include <cstring>
#include <iomanip>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <pthread.h> 

int main(){
 	std::cout<<"init regions"<<std::endl;
	int fp0=open("/dev/mem",O_RDWR|O_SYNC);
	if(fp0<0){
		std::cout<<"cannot open /dev/mem"<<std::endl;
		exit(0);
	}
    void *vmem;
	vmem=mmap(NULL,0x6000000,PROT_READ|PROT_WRITE,MAP_SHARED,fp0,0xb5004000);
	if(vmem==NULL){
		std::cout<<"cannot map physical address"<<std::endl;
		exit(0);
	}   

    void* debugspace;
	debugspace = (void*)(((char*)vmem));
	printf("DEBUG: rocc debug area begin\n");
	unsigned long *debug;
	debug=(unsigned long*)debugspace;
	printf("-------\n");
	for(int i=0;i<100;i++)
	printf("%d -> %lx\n",i,debug[i]);
	exit(0);

    return 0;
}