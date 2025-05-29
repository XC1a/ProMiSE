#include "rocc.h"
#include "define.h"
#define EVAL  1

int add(int a,int b)
{
	int tmp = 0;
	tmp = + b;
	return tmp;
}
int add_vitim(int a,int b)
{
	int tmp = 0;
	tmp = + b;
	return tmp;
}

int i=0;

int add2(int a,int b)
{
	printf("Danger happens!!\n");
	return 0;
}


int main(void)
{
	printf("Begin test...\n");

	int usr_buf[64];
	memset(usr_buf,0,64*4);


	int a= 1;
	int b=2;
	int d=0;
    d =add(a,b);
	int (*func_p) (int ,int);
	func_p = add;
	int c=0;
	c = (*func_p)(a,b);

	int (*func_v) (int ,int);
	int att_buf[10];
	func_v = add;

	// att_buf[10] = &add_vitim;
	usr_buf[10] = (&add_vitim) + 0x38;
	// memcpy(att_buf,usr_buf,11*4);
	att_buf[10] = usr_buf[10];
	c = (*func_v)(a,b);
	

	printf("d is %d\n",d);
	printf("c is %d\n",c);

	return 0;
}
