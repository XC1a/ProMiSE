#include "rocc.h"
#include "define.h"
#include <stdio.h>
#define EVAL  1

static inline void accum_write(int idx, uint64_t data)
{
	ROCC_INSTRUCTION_SS(0, data, idx, 0);
}

static inline uint64_t accum_read(int idx)
{
	uint64_t value;
	ROCC_INSTRUCTION_DSS(0, value, 0, idx, 1);
	return value;
}

static inline void accum_load(int idx, void *ptr)
{
	asm volatile ("fence");
	ROCC_INSTRUCTION_SS(0, (uintptr_t) ptr, idx, 2);
}

static inline void accum_add(int idx, uint64_t addend)
{
	ROCC_INSTRUCTION_SS(0, addend, idx, 3);
}
static inline uint64_t add_test(int a, int b)
{
	//asm volatile ("fence");
	uint64_t x;
	ROCC_INSTRUCTION_DSS(0,x, a,b, 4);
	return x;
}

static inline void add_load(int idx, void *ptr)
{
	asm volatile ("fence");
	ROCC_INSTRUCTION_SS(0,idx, (uintptr_t) ptr,  5);
}
uint64_t data = 0x3421L;


int add(int a,int b)
{
	return a + b;
}
int i;

void DFG_init(uint64_t* RDS,uint64_t* RDT )
{
	for (i = 0; i < 1024; i++)
	{
		RDT[i] = 0;
    }	
	RDS[0] = 0 | 1<<63;
	RDS[1] = 0 | ((uint64_t)(1)<<32) | (uint64_t)(1)<<63;
	RDS[2] = 1 | ((uint64_t)(20)<<32) | (uint64_t)(1)<<63;
	RDS[3] = 21 | ((uint64_t)(1)<<32) | (uint64_t)(1)<<63;
	RDS[4] = 22 | ((uint64_t)(1)<<32) | (uint64_t)(1)<<63;
	RDS[5] = 0x0605000302010000;
	RDS[6] = 0x1413121110090001;
	RDS[7] = 0x2221201918171615;
	RDS[8] = 0x3029282726252423;
	RDS[9] = 0x3837363534333231;
	RDS[10] = 0x0000000200010000;

}






void dfi_v1(uint64_t* instruction,uint64_t RDS_ADDR,uint64_t RDT_ADDR ,uint64_t RES_ADDR)
{



instruction[0]=1097 + (RDS_ADDR<< 12);
instruction[1]=1161 + (RDT_ADDR<< 12);
instruction[2]=1225 + (RES_ADDR<< 12);
instruction[3]=0x80000000ffffe7c2L;
instruction[4]=0x55;
instruction[5]=0x8000000000008fccL;
instruction[6]=0x3dff0f59;
instruction[7]=0x481d10;
instruction[8]=0x8007ffffff000e0fL;
instruction[9]=0x800000000200000eL;
instruction[10]=0x400c50;
instruction[11]=0x70127c3;
instruction[12]=0x1407d0;
instruction[13]=0x60000000007307c5;
instruction[14]=0x514706;
instruction[15]=0x141;
instruction[16]=0xf012c04;
instruction[17]=0x141;
instruction[18]=0x8007ffffff000e4fL;
instruction[19]=0x8007ffffff040e8fL;
instruction[20]=0xc80c50;
instruction[21]=0xb40d90;
instruction[22]=0x8000000003e40e4fL;
instruction[23]=0xefbe46;
instruction[24]=0x8000000003ec0ec6L;
instruction[25]=0x8000000002080eceL;
instruction[26]=0x140090;
instruction[27]=0x940cd0;
instruction[28]=0x80000000020c004eL;
instruction[29]=0x70d27c3;
instruction[30]=0x8407d0;
instruction[31]=0x60000000007307c5;
instruction[32]=0x514706;
instruction[33]=0x8000000001240246L;
instruction[34]=0x282245;
instruction[35]=0x8000000004040046L;
instruction[36]=0x700290;
instruction[37]=0xb40c90;
instruction[38]=0x249;
instruction[39]=0x80000000020c000eL;
instruction[40]=0xf0d2c04;
instruction[41]=0x8000000001240246L;
instruction[42]=0x282245;
instruction[43]=0x8000000004000006L;
instruction[44]=0x80000000509c0290L;
instruction[45]=0x8007ffffff000f0fL;
instruction[46]=0x8000000000c00c06L;
instruction[47]=0x80000000020c000eL;
instruction[48]=0xf0d2c04;
instruction[49]=0x141;
instruction[50]=0x8007ffffff000f0fL;
instruction[51]=0x80000000020c000eL;
instruction[52]=0x70d27c3;
instruction[53]=0x1407d0;
instruction[54]=0x60000000002b07c5;
instruction[55]=0x514286;
instruction[56]=0x141;
}


void reg_clean(uint64_t* instruction,uint64_t RDS_ADDR,uint64_t RDT_ADDR ,uint64_t RES_ADDR){
instruction[0]=1097 + (RDS_ADDR<< 12);
instruction[1]=1161 + (RDT_ADDR<< 12);
instruction[2]=1225 + (RES_ADDR<< 12);
instruction[3]=0x8000000020000382L;
instruction[4]=0x20000000ffffe042;
instruction[5]=0x55;
instruction[6]=0x4015681ca;
instruction[7]=0x17cc;
instruction[8]=0x5007d0;
instruction[9]=0x3f81ffc6307d9;
instruction[10]=0x8007ffffff0007cfL;
instruction[11]=0x440cd0;
instruction[12]=0x100201a;
instruction[13]=0x60127c3;
instruction[14]=0x4007d0;
instruction[15]=0x5c7c1d53456;
instruction[16]=0x8000000070a41210L;
instruction[17]=0x100201a;
instruction[18]=0xe012d44;
instruction[19]=0x8000000070d011d0L;
instruction[20]=0x80000000000007ccL;
instruction[21]=0x8007ffffff000e0fL;
instruction[22]=0x8007ffffff040e4fL;
instruction[23]=0x80000000002c0006L;
instruction[24]=0x3c7f0f19;
instruction[25]=0x80000003d06c1c90L;
instruction[26]=0x701;
instruction[27]=0xe80c50;
instruction[28]=0x8000000003e00e0fL;
instruction[29]=0xeb8e86;
instruction[30]=0x8000000003e80e86L;
instruction[31]=0x8000000002080e8eL;
instruction[32]=0x1c0090;
instruction[33]=0x8000000000000046L;
instruction[34]=0x80000000001c0cc6L;
instruction[35]=0x8000000000200d06L;
instruction[36]=0x8000000000d40c06L;
instruction[37]=0xe80c90;
instruction[38]=0xc00d10;
instruction[39]=0x249;
instruction[40]=0x301;
instruction[41]=0x18;
instruction[42]=0x8000000001240246L;
instruction[43]=0x282245;
instruction[44]=0x8000000004040046L;
instruction[45]=0x8000000000000046L;
instruction[46]=0xc01290;
instruction[47]=0x301;
instruction[48]=0x1c01d0;
instruction[49]=0x249;
instruction[50]=0x80000000000002c6L;
instruction[51]=0x441;
instruction[52]=0x8000000001240246L;
instruction[53]=0x282245;
instruction[54]=0x80000000042c02c6L;
instruction[55]=0x80000000000002c6L;
instruction[56]=0x1c1290;
instruction[57]=0x441;
instruction[58]=0x8007ffffff000ecfL;
instruction[59]=0xffffd49;
instruction[60]=0x441;
instruction[61]=0x8007ffffff000ecfL;
instruction[62]=0x100201a;
instruction[63]=0x60127c3;
instruction[64]=0x1c07d0;
instruction[65]=0xc00000ffff2807c5L;
instruction[66]=0x514286;
instruction[67]=0x1c1;



}

int foo(int b)
{
	int a;
	a = 1;
	a++;
	return a+b;
}

int main(void)
{
	printf("Begin test...\n");
	uint64_t instruction[256];

    //DFI  test
	uint64_t RDT[1024];
	uint64_t RDS[256];

	
	
	//printf("RDS addr is%x...\n",RDS);
	//printf("RDT addr is%x...\n",RDT);
	DFG_init(RDS,RDT);

	dfi_v1(instruction,RDS,RDT,RDS+5);
	// for (i = 0; i < 33; i++)
	// {
	// 	printf("Insturct:   %lx\n",instruction[i]);
	// }
	//rocc_inst_gen(instruction,RDS_ADDR,RDT);
	//initial
	ROCC_INSTRUCTION_SS(0,12345678,0,32);
	ROCC_INSTRUCTION_SS(0,instruction,128,0);
	// asm(".word 0x0000008b");

	int a11[1024]={0};
	int a_char[64]={0};
	int b_char[64]={0};
	int tmp;
	a_char[0]=1;
	asm(".word 0x0000008b");  
	a_char[1]=1;
	asm(".word 0x0000008b");  
	a_char[2]=1;
	asm(".word 0x0000008b");  
	a_char[3]=1;
	asm(".word 0x0000008b");  
	a_char[3]=1;
	asm(".word 0x0000008b");  
	a_char[3]=1;
	asm(".word 0x0000008b");  
	asm(".word 0x0000008b");  
	asm(".word 0x0000008b");  
	asm(".word 0x0400008b"); // check id 1; store 
	asm(".word 0x0400010b"); // check id 2; store 
	// asm(".word 0x0400018a"); // check id 3; store 
	// asm(".word 0x0400020a"); // check id 4; store 
// //	asm(".word 0x0000008b"); //store addr a, id 1
// 	memcpy(b_char,a_char,16);
// 	memcpy(b_char,a_char,16);
	for (i = 0; i < 32; i++)
	{
		
	}
	

	printf("a_char addr is%x...\n",a_char);
	printf("b_char addr is%x...\n",b_char);
	asm(".word 0x6000000b");

	DFG_init(RDS,RDT);
	ROCC_INSTRUCTION_SS(0,12345678,0,32);
	ROCC_INSTRUCTION_SS(0,instruction,128,0);
	// asm(".word 0x0000008b");


	a_char[3]=1;
	asm(".word 0x0000008b");  
	asm(".word 0x0400008b"); // check id 1; store 
	asm(".word 0x0400010b"); // check id 2; store 
	asm(".word 0x0400018b"); // check id 3; store 
	asm(".word 0x0400020b"); // check id 4; store 
	printf("a_char addr is%x...\n",a_char);
	printf("b_char addr is%x...\n",b_char);


//	asm(".word 0x0000008b"); //store addr a, id 1
	memset(a_char,0,31);

	//asm(".word 0x3800018b"); // check id 1;id 3 store, read a,write b(id 3) 
	memcpy(b_char,a_char,31);

	add(1,2);
	asm(".word 0x6000000b");
	
	
	// reg_clean(instruction,RDS,RDT,RDS+5);
	dfi_v1(instruction,RDS,RDT,RDS+5);
	DFG_init(RDS,RDT);
	ROCC_INSTRUCTION_SS(0,12345678,0,32);
	ROCC_INSTRUCTION_SS(0,instruction,128,0);

	asm(".word 0x2022830b");
	printf("Reg clean\n");
	printf("inst18 %lx\n",instruction[18]);
	printf("inst19 %lx\n",instruction[19] );
	printf("inst20 %lx\n",instruction[20]);

	asm(".word 0x2429818b");
	asm(".word 0x6000000b");






}
