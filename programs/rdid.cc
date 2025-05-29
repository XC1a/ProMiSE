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
	debugspace = (void*)(((char*)vmem)+0x0100*8 + 0x1000 + 1024*1024*16);
	printf("DEBUG: rocc debug area begin\n");
	unsigned short *debug;
	debug=(unsigned short*)debugspace;
	printf("-------\n");
	unsigned long sp;
	scanf("%x",&sp);
	unsigned long rdt = (((sp& 0x7ffffff)>>2));
	printf("rdt entry: %lx\n",rdt);
	for(int i=0; i < 16; i++){
		printf("sp + %lx  ",i*4);
		printf("rdt is: %x\n",debug[rdt+i]);
	}
	for(int i=0; i < 32; i++){
		printf("sp - %lx  ",i*4);
		printf("rdt is: %x\n",debug[rdt-i]);
	}

    return 0;
}