#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

struct vuln{
	char data[256];
	int off;
	int size;
}*u0, *u1, *u2;

int main(int argc, char *argv[])
{
	char user0_buffer[256];
	char user1_buffer[256];
	char user2_buffer[256];
	int i;
	for (i = 0; i < 256; i++)
	{
		user0_buffer[i] = 0;
	}
	for (i = 0; i < 256; i++)
	{
		user1_buffer[i] = 0;
	}
	for (i = 0; i < 256; i++)
	{
		user2_buffer[i] = 0;
	}
	
	
	printf("%lx,%lx,%lx\n",(unsigned long)user0_buffer,(unsigned long)user1_buffer,(unsigned long)user2_buffer);
	
	u0=(struct vuln*)malloc(sizeof(struct vuln));
	u1=(struct vuln*)malloc(sizeof(struct vuln));
	u2=(struct vuln*)malloc(sizeof(struct vuln));
	
	u0->off=10;
	u0->size=32;
	u1->off=20;
	u1->size=32;
	u2->off=30;
	u2->size=32;
	
	for(i=0;i<atoi(argv[2]);i++){
		u0->data[i]=atoi(argv[1]);
	}
	for(i=0;i<atoi(argv[4]);i++){
		u1->data[i]=atoi(argv[3]);
	}
	for(i=0;i<atoi(argv[6]);i++){
		u2->data[i]=atoi(argv[5]);
	}
	
	memcpy(user0_buffer+u0->off,u0->data,u0->size);
	memcpy(user1_buffer+u1->off,u1->data,u1->size);
	memcpy(user2_buffer+u2->off,u2->data,u2->size);
	
	for(i=0;i<256;i++){
		printf("[0,%d]->%d, ",i,(unsigned int)(user0_buffer[i]));
		printf("[1,%d]->%d, ",i,(unsigned int)(user1_buffer[i]));
		printf("[2,%d]->%d, ",i,(unsigned int)(user2_buffer[i]));
		printf("\n");
	}
	
	return 0;
}
