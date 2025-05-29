#include "rocc.h"
#include "define.h"
#define EVAL  1

int vic();
void danger_happen(){
	printf("dange happens!!\n");
}
int func0()
{
	vic();
	printf("func0\n");
	return 0;
}
int func1()
{
	vic();
	printf("func1\n");
	return 0;
}

int i=0;

int vic()
{
	int val[16];
	// val[18] = &func1 + 0x10;
	return 0;
}


int main(void)
{
	printf("Begin test...\n");
	func0();
	return 0;
}
