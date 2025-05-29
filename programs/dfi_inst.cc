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
#include "rocc.h"
// #include <time.h>

#define FEQ 50000000
// std::clock_t start_c,end_c;

void **dfi_reg;
unsigned short *dfi_reg_s;
unsigned int *dfi_reg_t;//for testing cycles
unsigned int *dfi_reg_0;
unsigned int *dfi_reg_1;
unsigned int *dfi_reg_2;
unsigned int *dfi_reg_3;
unsigned int *dfi_reg_4;
unsigned int *dfi_reg_5;
unsigned int *dfi_reg_6;
unsigned int *dfi_reg_7;
unsigned int *dfi_p;
unsigned long inst_buffer[128];
int dfi_start;
int dfi_vio;
volatile unsigned int dfi_reg_signal;

void *vmem;

volatile unsigned int dfi_user_start;

pthread_t dfi_thread_id; 

unsigned int dfi_2core_round;
unsigned int dfi_2core_pointer;

#define DFI_LATENCY_CHECK 0



unsigned long *instruction;
void* graph;
void* debugspace;
void* debug_T;
void cfi_init(){

	std::cout<<"init regions"<<std::endl;
	int fp0=open("/dev/mem",O_RDWR|O_SYNC);
	if(fp0<0){
		std::cout<<"cannot open /dev/mem"<<std::endl;
		exit(0);
	}
	vmem=mmap(NULL,0x6000000,PROT_READ|PROT_WRITE,MAP_SHARED,fp0,0xb5004000);
	memset(vmem,0,0x6000000);
	if(vmem==NULL){
		std::cout<<"cannot map physical address"<<std::endl;
		exit(0);
	}
	
	std::cout<<"-------------->>>>>Read the CFG..."<<std::endl;
	//0-0x100000*8 is debug space
	debugspace = (void*)(((char*)vmem));
	instruction = (unsigned long*)(((char*)vmem)+0x100000*4);
	graph = (void*)(((char*)vmem)+0x0100*8 + 0x100000*4);
	//reset instruction
	for (int i = 0; i < 256; i++)
	{
		((unsigned long*)instruction)[i] = 0;
	}
	
	FILE *fp1;
	fp1 = fopen("cfitable","r");
	if(fp1 == NULL){
		std::cout<<"Cannot open cfitable..."<<std::endl;
		exit(0);
	}
	char ch;
	//ch = fgetc(fp1);
	int i=0;
	unsigned long res_addr = 0;
	unsigned long all_addr = 0;
	while (i<8){
		ch = fgetc(fp1);
		all_addr = all_addr | (ch<<(i*8));
		i++;
	}
	i = 0;
	all_addr = all_addr; //the entry is 64bits, so the addr is 8 each
	std::cout<<"Table addr size is..."<<std::hex<<all_addr<<std::endl;

	//ch = fgetc(fp1);
	while (i<8){
		ch = fgetc(fp1);
		res_addr = res_addr | (ch<<(i*8));
		i++;
	}
	std::cout<<"Res addr size is..."<<std::hex<<res_addr<<std::endl;

	i = 0;
	while(i<all_addr){
		ch = fgetc(fp1);
		((char*)graph)[i] = ch;
		i++;
	}
	std::cout<<"------------------<<<The CFI graph init done,total size is"<<i<<"bytes"<<std::endl;


	std::cout<<"------------------>>>Read the Rocc instructions..."<<std::endl;
	FILE *fp2;
	fp2 = fopen("inst_bin.txt","r");
	if(fp2 == NULL){
		std::cout<<"Cannot open inst_bin..."<<std::endl;
		exit(0);
	}
	i=0;
	int j=0;
	char tmp[100];
	char tmp_sign[1];
	while(fscanf(fp2,"%s",tmp) != EOF){
		if(strcmp(tmp, "CFG_ADDR") == 0){
			((unsigned long*)instruction)[i] = 9 | (17<<6) | (unsigned long)(((unsigned long)(0xb5004000 + +0x0100*8 + 0x100000*4)) << 12);
		}
		else if(strcmp(tmp, "RES_ADDR")==0){
			((unsigned long*)instruction)[i] = 9 | (18<<6) | (unsigned long)(((unsigned long)(0xb5004000 + +0x0100*8 + 0x100000*4) + res_addr) << 12);
		}
		else{
			if(tmp[2] >= '8' && tmp[18]=='L'){
				tmp_sign[0] = tmp[2];
				tmp_sign[1] = '~';
				((unsigned long*)instruction)[i] = (unsigned long)(strtol(tmp+3,NULL,16)) + (unsigned long)(strtol(tmp_sign,NULL,16) <<60 );
			}
			else{
				((unsigned long*)instruction)[i] = (unsigned long)(strtol(tmp,NULL,16));
			}
		}
		tmp[18] = ' ';
		i++;
	}
	std::cout<<"------------Instruction is below-----------"<<std::endl;
	for(j=0;j<i;j++){
		std::cout<<((unsigned long*)instruction)[j]<<std::endl;
	}	

	std::cout<<"------------Begin analyzing ||pc||----------->>>"<<std::endl;
    FILE *fp3 = fopen("obj.od", "r");
    if(fp3 == NULL){ 
        printf("Error\n");
        exit(0);
    }
    int total_line =0;
	char tmp1[200];
	char pc1[200];
	char pc2[200];
    while(!feof(fp3)){
        fgets(tmp1,200,fp3);
        total_line ++;
    }
    printf("Total Line:%d\n",total_line);
    rewind(fp3);
    i = 0;
    while(!feof(fp3)){
        if(i==6){
            fgets(pc1,200,fp3);
        }
        else if(i==total_line-3){
            fgets(pc2,200,fp3);
        }
        else{
            fgets(tmp1,200,fp3);
        }
        i++;
    }
	unsigned long pc_min = (unsigned long)(strtol(pc1,NULL,16));
	unsigned long pc_max = (unsigned long)(strtol(pc2,NULL,16));
	std::cout<<"PC min is "<<pc_min<<std::endl;
	std::cout<<"PC max is "<<pc_max<<std::endl;
	std::cout<<"------------||PC|| is gotten-----------"<<std::endl;



	std::cout<<"------------Instruction is over-----------"<<std::endl;
	std::cout<<"------------------<<<Read instruction done"<<std::endl;


	//reset tocc
	std::cout<<"-------------------------->>>Begin to reset rocc...."<<std::endl;
	//asm(".word 0x4000000b"); 0100 000 funct===32.U
	std::cout<<"FUNC MAx is ... "<<DFI_MAX_CALLCOUNT<<std::endl;
	unsigned long funcmax = (DFI_MAX_CALLCOUNT);
	ROCC_INSTRUCTION_SS(0,funcmax,0,32);
	std::cout<<"--------------------------<<<Rocc init done!!!"<<std::endl;

	//give the signal to the rocc to init the instruction 
	//**NOTICE** this inst should put in last of the function(debug info need before inst)
	unsigned long inst_phy_addr = 0xb5004000+0x100000*4;
	ROCC_INSTRUCTION_SS(0,inst_phy_addr,128,0);
	// start_c = std::clock();

	//std::cout<<"-------------------------->>>enable cfi<<<<<<-------"<<std::endl;
	asm(".word 0x0200000b");
	ROCC_INSTRUCTION_SS(0,pc_min,pc_max,4);
	//asm(".word 0x0800000b"); //enable the cfi
	//exit(0);
}
void cfi_rocc_debug(){
	asm(".word 0x0400000b"); //disable cif
	asm(".word 0x6000000b"); //main tail
	// end_c = std::clock();
	//exit(0);
	printf("DEBUG: cfi rocc debug begin\n");
	// std::cout<<"The system time cosume is "<<((double)((double)end_c-start_c)/1000.0) <<" ms"<<std::endl;
	int i;
	for(i=0;i<100000;i++);
	unsigned long *debug;
	debug=(unsigned long*)debugspace;
	printf("-------\n");
	for(i=0;i<60;i++){
		if(i==0){
			printf("The hardware cycle count time is-> %d ms\n",debug[0]/(FEQ/1000));
		}
		else
			printf("%d -> %lx\n",i,debug[i]);
	}
	exit(0);
}

void none_sec_init(){
	int i=0;
	std::cout<<"init regions"<<std::endl;
	int fp0=open("/dev/mem",O_RDWR|O_SYNC);
	if(fp0<0){
		std::cout<<"cannot open /dev/mem"<<std::endl;
		exit(0);
	}
	vmem=mmap(NULL,0x6000000,PROT_READ|PROT_WRITE,MAP_SHARED,fp0,0xb5004000);
	if(vmem==NULL){
		std::cout<<"cannot map physical address"<<std::endl;
		exit(0);
	}
	debugspace = (void*)(((char*)vmem));
	instruction = (unsigned long*)(((char*)vmem)+0x100000*4);

	std::cout<<"------------------>>>Init the Rocc instructions..."<<std::endl;
	for(i=0;i<256;i++){
		((unsigned long*)instruction)[i] = 0x55; //begin the core
	}	

	//reset tocc
	std::cout<<"-------------------------->>>Begin to reset rocc...."<<std::endl;
	//asm(".word 0x4000000b"); 0100 000 funct===32.U
	std::cout<<"FUNC MAx is ... "<<DFI_MAX_CALLCOUNT<<std::endl;
	unsigned long funcmax = (DFI_MAX_CALLCOUNT);
	ROCC_INSTRUCTION_SS(0,funcmax,0,32);
	std::cout<<"--------------------------<<<Rocc init done!!!"<<std::endl;

	//give the signal to the rocc to init the instruction 
	//**NOTICE** this inst should put in last of the function(debug info need before inst)
	unsigned long inst_phy_addr = 0xb5004000+0x100000*4;
	ROCC_INSTRUCTION_SS(0,inst_phy_addr,128,0);
}




void dfi_new_init(){

	std::cout<<"init regions"<<std::endl;
	int fp0=open("/dev/mem",O_RDWR|O_SYNC);
	if(fp0<0){
		std::cout<<"cannot open /dev/mem"<<std::endl;
		exit(0);
	}
	vmem=mmap(NULL,0x6000000,PROT_READ|PROT_WRITE,MAP_SHARED,fp0,0xb5004000);
	memset(vmem,0,0x6000000);
	if(vmem==NULL){
		std::cout<<"cannot map physical address"<<std::endl;
		exit(0);
	}
	
	std::cout<<"-------------->>>>>Read the RDS..."<<std::endl;
	//0-0x100000*8 is debug space
	debugspace = (void*)(((char*)vmem));
	instruction = (unsigned long*)(((char*)vmem)+0x1000);
	graph = (void*)(((char*)vmem)+0x0100*8 + 0x1000);
	debug_T = (void*)(((char*)vmem)+(0xb500a4c0-0xb5004000));
	//reset instruction
	for (int i = 0; i < 256; i++)
	{
		((unsigned long*)instruction)[i] = 0;
	}
	
	FILE *fp1;
	fp1 = fopen("dfi_rds_file","r");
	if(fp1 == NULL){
		std::cout<<"Cannot open rds..."<<std::endl;
		exit(0);
	}
	char ch;
	//ch = fgetc(fp1);
	int i=0;
	unsigned long res_addr = 0;
	unsigned long all_addr = 0;
	while (i<8){
		ch = fgetc(fp1);
		all_addr = all_addr | (ch<<(i*8));
		i++;
	}
	i = 0;
	std::cout<<"Table addr size is...0x"<<std::hex<<all_addr<<std::endl;
	while (i<8){
		ch = fgetc(fp1);
		res_addr = res_addr | (ch<<(i*8));
		i++;
	}
	std::cout<<"Res addr size is...0x"<<std::hex<<res_addr<<std::endl;
	i=0; 

	while(i<all_addr){
		ch = fgetc(fp1);
		((char*)graph)[i] = ch;
		i++;
	}
	std::cout<<"------------------<<<The DFG init done,total size is...0x"<<std::hex<<i<<"bytes"<<std::endl;
	std::cout<<"------------------<<<RDS is ...0x"<<std::hex<<(unsigned long)((unsigned long*)debug_T)[0]<<std::endl;
	std::cout<<"------------------<<<RDS is ...0x"<<std::hex<<(unsigned long)((unsigned long*)debug_T)[1]<<std::endl;


	std::cout<<"------------------>>>Read the Rocc instructions..."<<std::endl;
	FILE *fp2;
	fp2 = fopen("inst_bin.txt","r");
	if(fp2 == NULL){
		std::cout<<"Cannot open inst_bin..."<<std::endl;
		exit(0);
	}
	i=0;
	int j=0;
	char tmp[100];
	char tmp_sign[1];
	while(fscanf(fp2,"%s",tmp) != EOF){
		if(strcmp(tmp, "RDS_ADDR") == 0){
			((unsigned long*)instruction)[i] = 9 | (17<<6) | (unsigned long)(((unsigned long)(0xb5004000 +0x0100*8 + 0x1000)) << 12); //RDS 16MB
		}
		else if(strcmp(tmp, "RES_ADDR")==0){
			((unsigned long*)instruction)[i] = 9 | (19<<6) | (unsigned long)(((unsigned long)(0xb5004000 +0x0100*8 + 0x1000) + res_addr) << 12);
		}
		else if(strcmp(tmp, "RDT_ADDR")==0){
			((unsigned long*)instruction)[i] = 9 | (18<<6) | (unsigned long)(((unsigned long)(0xb5004000 +0x0100*8 + 0x1000 + 1024*1024*16)) << 12); //RDT 64MB
		}
		else{
			if(tmp[2] >= '8' && tmp[18]=='L'){
				tmp_sign[0] = tmp[2];
				tmp_sign[1] = '~';
				((unsigned long*)instruction)[i] = (unsigned long)(strtol(tmp+3,NULL,16)) + (unsigned long)(strtol(tmp_sign,NULL,16) <<60 );
			}
			else{
				((unsigned long*)instruction)[i] = (unsigned long)(strtol(tmp,NULL,16));
			}
		}
		tmp[18] = ' ';
		i++;
	}
	std::cout<<"------------Instruction is below-----------"<<std::endl;
	for(j=0;j<i;j++){
		std::cout<<((unsigned long*)instruction)[j]<<std::endl;
	}	

	std::cout<<"------------Instruction is over-----------"<<std::endl;


	//reset tocc
	std::cout<<"-------------------------->>>Begin to reset rocc funcmax is...."<<DFI_MAX_CALLCOUNT<<std::endl;
	unsigned long funcmax = (DFI_MAX_CALLCOUNT);
	ROCC_INSTRUCTION_SS(0,funcmax,0,32);
	std::cout<<"--------------------------<<<Rocc init done!!!"<<std::endl;

	unsigned long inst_phy_addr = 0xb5004000+0x1000;
	ROCC_INSTRUCTION_SS(0,inst_phy_addr,128,0);
}

void dfi_new_rocc_debug(){
	asm(".word 0x6000000b"); //main tail
	printf("DEBUG: dfi rocc debug begin\n");
	int i;
	for(i=0;i<100000;i++);
	unsigned long *debug;
	unsigned long *debug1;
	debug=(unsigned long*)debugspace;
	debug1=(unsigned long*)debug_T;
	printf("-------\n");
	for(i=0;i<85;i++){
		if(i==0){
			printf("The hardware cycle count time is-> %d ms\n",debug[0]/(FEQ/1000));
		}
		else
			printf("%d -> %lx\n",i,debug[i]);
	}
	printf("RDS value -> %lx\n",debug1[0]);
	printf("RDS value -> %lx\n",debug1[1]);
	exit(0);
}



void dfi_func_signal(){
	dfi_reg_3[2]=22332233;
}

void init_roccinstr_dfi(){
	std::cout<<"init regions"<<std::endl;
	int fp=open("/dev/mem",O_RDWR|O_SYNC);
	if(fp<0){
		std::cout<<"cannot open /dev/mem"<<std::endl;
		exit(0);
	}
	vmem=mmap(NULL,0x6000000,PROT_READ|PROT_WRITE,MAP_SHARED,fp,0xf4084000);
	if(vmem==NULL){
		std::cout<<"cannot map physical address"<<std::endl;
		exit(0);
	}
	
	int i;
	dfi_reg=(void**)malloc(8*sizeof(void*));
	dfi_reg[0]=vmem;
	dfi_reg[1]=(void*)(((char*)vmem)+0x100000*4);
	dfi_reg[2]=(void*)(((char*)vmem)+0x100000*(64+4));
	/*dfi_reg[0]=(void*)malloc(1024*1024*sizeof(unsigned int));//for trace
	dfi_reg[1]=(void*)malloc(1024*1024*64);//for reaching definition table
	dfi_reg[2]=(void*)malloc(1024*1024*4*sizeof(unsigned int));//for reaching definition set
	dfi_reg[3]=(void*)malloc(1024*sizeof(unsigned int));//for info
	dfi_reg[4]=(void*)malloc(1024*sizeof(unsigned int));//for output*/
	dfi_reg_0=(unsigned int*)(dfi_reg[0]);
	dfi_reg_1=(unsigned int*)(dfi_reg[1]);
	dfi_reg_2=(unsigned int*)(dfi_reg[2]);
	dfi_reg_3=(unsigned int*)(dfi_reg[3]);
	dfi_reg_4=(unsigned int*)(dfi_reg[4]);
	dfi_reg_s=(unsigned short*)(dfi_reg[1]);
	
	memset(vmem,0,0x6000000);
	
	std::cout<<std::hex<<"regions init done"<<std::endl;
	
	FILE *fptr;
	char ch;
    fptr = fopen("dfi_rds_file", "r");
	if (fptr == NULL){
		printf("Cannot open reachine definition set file\n");
		exit(0);
	}
	i=0;
	unsigned int max_file_p=0;
	ch = fgetc(fptr);
	while (i<4){
		((char*)dfi_reg[2])[i]=ch;
		ch = fgetc(fptr);
		i++;
	}
	max_file_p=((unsigned int*)dfi_reg[2])[0];
	max_file_p=2*max_file_p;
    while (i<max_file_p){
        ((char*)dfi_reg[2])[i]=ch;
        ch = fgetc(fptr);
        i++;
    }
    max_file_p=2*(((unsigned int*)dfi_reg[2])[i/4-1]);
    while (i<max_file_p){
        ((char*)dfi_reg[2])[i]=ch;
        ch = fgetc(fptr);
        i++;
    }
    fclose(fptr);
	
	std::cout<<std::hex<<"rds load done, total "<<i<<" bytes"<<std::endl;
	//rocc_inst_gen(inst_buffer,(unsigned long)dfi_reg_2,(unsigned long)dfi_reg_1);	

	
	dfi_reg_1[0]=12345678;//rdt
	asm(".word 0x4000000b");
	dfi_reg_2[0]=23456789;//rds
	asm(".word 0x8000000b");
	((unsigned long*)dfi_reg_0)[0]=DFI_MAX_CALLCOUNT;
	for(i=0;i<100000;i++);
	#if DFI_CONFIG
	asm(".word 0xe000000b");
	#else
	asm(".word 0xc000000b");
	#endif
	std::cout<<std::hex<<"max call count "<<((unsigned long*)dfi_reg_0)[0]<<std::endl;
	std::cout<<std::hex<<"pointers indication done"<<std::endl;
	
	std::cout<<"-----------Give the inst_buffer head addr to ROCC-----------"<<std::endl;
	ROCC_INSTRUCTION_SS(0,inst_buffer,128,0);
	
	/*
	dfi_reg_3[2]=22332233;
	dfi_reg_3[2]=DFI_MAX_PC;
	dfi_reg_3[2]=DFI_TEST_MODE;
	dfi_reg_3[2]=DFI_TEST_COUNT;
	*/
	std::cout<<std::hex<<"reg rdt vaddr "<<(unsigned long)(dfi_reg_1)<<" to "<<(unsigned long)(&(((char *)dfi_reg[1])[1024*1024*64-1]))<<std::endl;
	std::cout<<std::hex<<"reg rds vaddr "<<(unsigned long)(dfi_reg_2)<<" to "<<(unsigned long)(&(((char *)dfi_reg[2])[1024*1024*4*sizeof(unsigned int)-1]))<<std::endl;
	std::cout<<std::hex<<"debug buffer vaddr "<<(unsigned long)(dfi_reg_0)<<" to "<<(unsigned long)(&(((char *)dfi_reg[0])[1024*1024*sizeof(unsigned int)-1]))<<std::endl;
	std::cout<<"init dfi end"<<std::endl;
}

void init_noinstrument_dfi(){
	int i=0;
	std::cout<<"init regions"<<std::endl;
	int fp0=open("/dev/mem",O_RDWR|O_SYNC);
	if(fp0<0){
		std::cout<<"cannot open /dev/mem"<<std::endl;
		exit(0);
	}
	vmem=mmap(NULL,0x6000000,PROT_READ|PROT_WRITE,MAP_SHARED,fp0,0xb5004000);
	if(vmem==NULL){
		std::cout<<"cannot map physical address"<<std::endl;
		exit(0);
	}
	debugspace = (void*)(((char*)vmem));
	instruction = (unsigned long*)(((char*)vmem)+0x100000*4);

	std::cout<<"------------------>>>Init the Rocc instructions..."<<std::endl;
	for(i=0;i<256;i++){
		((unsigned long*)instruction)[i] = 0;
	}	
	((unsigned long*)instruction)[0] = 0x55; //begin core
	((unsigned long*)instruction)[1] = 0xc;   //read fifo stall core

	//reset tocc
	std::cout<<"-------------------------->>>Begin to reset rocc...."<<std::endl;
	//asm(".word 0x4000000b"); 0100 000 funct===32.U
	std::cout<<"FUNC MAx is ... "<<DFI_MAX_CALLCOUNT<<std::endl;
	unsigned long funcmax = (DFI_MAX_CALLCOUNT);
	ROCC_INSTRUCTION_SS(0,funcmax,0,32);
	std::cout<<"--------------------------<<<Rocc init done!!!"<<std::endl;

	//give the signal to the rocc to init the instruction 
	//**NOTICE** this inst should put in last of the function(debug info need before inst)
	unsigned long inst_phy_addr = 0xb5004000+0x100000*4;
	ROCC_INSTRUCTION_SS(0,inst_phy_addr,128,0);
}

void *execute_dficheck(void *vargp)
{
	std::cout<<"set cpu to 1"<<std::endl;
	cpu_set_t cpuset;
	CPU_ZERO(&cpuset);
	CPU_SET(1, &cpuset);
	pthread_t current_thread = pthread_self();    
	pthread_setaffinity_np(current_thread, sizeof(cpu_set_t), &cpuset);
	std::cout<<"set cpu to 1 end"<<std::endl;
	//pim_print_msg("in the kernel\n");
	unsigned int *trace = (unsigned int*) dfi_reg_0;
	unsigned short *rdt = (unsigned short*) dfi_reg_1;
	unsigned int *rds = (unsigned int*) dfi_reg_2;
	unsigned int *output = (unsigned int*) dfi_reg_4;
	unsigned int trace_p=0;
	unsigned int round=0;
	unsigned int addr=0;
	unsigned int prev_addr=0;
	unsigned int rw=0;
	unsigned short id=0,prev_id=0,check_id=0;//id starts from 1 not 0
	//unsigned int curr_round;
	//unsigned int overflow=0;
	unsigned int i=0;
	unsigned int il0=0,il1=0;
	unsigned int found=0;
	unsigned int verify=0;//0: none, 1: normal, 2: compress, 3: lib 32len, 4: lib 64len
	//unsigned int change_round;
	unsigned int cp_state=0;
	unsigned int lib_len0=0, lib_len1=0;
	unsigned int lib_state=0,lib_p=0,lib_l_p=0,lib_s_p=0,lib_len_p=0;
	cp_state=0;
	lib_state=0;
	lib_p=0;
	lib_l_p=0;
	lib_s_p=0;
	lib_len_p=0;
	lib_len0=0;
	lib_len1=0;
	prev_addr=0;
	prev_id=0;
	output[0]=12123;//for testing
	output[1]=0;//vio
	unsigned int max_p;
	max_p=0;
	
	#if DFI_LATENCY_CHECK
	dfi_pim->record_time_stamp(5);//5 is special
	dfi_pim->record_time_stamp(5);//5 is special
	#endif
	
	//normal: word 1: [round:1bit][0:14bit][rw:1bit][id:16bit], word 2:[round:1bit][0:1bit][addr>>2:30bit]
	//compress: [round:1bit][1:1bit]([rw:1bit][id sign:1bit][id off:5bit][addr sign:1bit][addr off: 4bit][addr exp:3bit])
	//lib: [round:1bit][0:1bit][1:1bit][0:9bit][is w:1bit][is r:1bit][# of len words:2bit][id:16bit]||[round:1bit][0:1bit][addrr>>2:30bit]?||[round:1bit][0:1bit][addrw>>2:30bit]?||([round:1bit][len:31bit])(1-3)
	//previou id and addr won't update by lib trace
	dfi_user_start=1;
	
	//unsigned int test_flag=0;
	
	
	while(1){
		/*if(test_flag==0)
		dfi_pim->record_time_stamp(3);*/
		verify=0;
		//sanity checks
		if(trace_p>=1024*1024){
			trace_p=0;
			if(round==0){
				round=1;
			}else{
				round=0;
			}
			continue;
		}
		if(trace[trace_p]==0){
			if(trace[0]!=0&&trace[0]>>31!=round){
				trace_p=0;
				if(round==0){
					round=1;
				}else{
					round=0;
				}
				continue;
			}else{
				continue;
			}
		}
		if(trace[trace_p]>>31!=round){
			if(trace[0]>>31!=round){
				if(trace_p>0 && trace[trace_p-1]>>31!=round){
					output[5]++;
				}
				trace_p=0;
				if(round==0){
					round=1;
				}else{
					round=0;
				}
				continue;
			}else{
				continue;
			}
		}
		
		if((trace[trace_p]>>30)&1){//compress
			if(cp_state==0){
				cp_state=2;
			}
			i=2-cp_state;
			if((trace[trace_p]>>(7+15*i))&1){
				addr=prev_addr-(((trace[trace_p]>>(3+15*i))&0xf)<<(((trace[trace_p]>>(15*i))&0x7)*4));
			}else{
				addr=prev_addr+(((trace[trace_p]>>(3+15*i))&0xf)<<(((trace[trace_p]>>(15*i))&0x7)*4));
			}
			if((trace[trace_p]>>(13+15*i))&1){
				id=prev_id-((trace[trace_p]>>(8+15*i))&0x1f);
			}else{
				id=prev_id+((trace[trace_p]>>(8+15*i))&0x1f);
			}
			rw=(trace[trace_p]>>(14+15*i))&0x1;
			cp_state--;
			verify=2;
		}else if((trace[trace_p]>>29)==0){//normal
			addr=trace[trace_p+1]&0x7fffffff;
			rw=(trace[trace_p]>>16)&0x1;
			id=trace[trace_p]&0xffff;
			verify=1;
		}else{//lib
			lib_p=trace_p;
			lib_p++;
			if((trace[trace_p]>>18)&1){
				lib_l_p=lib_p;
				lib_p++;
			}
			if((trace[trace_p]>>19)&1){
				lib_s_p=lib_p;
				lib_p++;
			}
			lib_len_p=lib_p;
			lib_p+=((trace[trace_p]>>16)&3);
			if(lib_state==0){
				if(lib_l_p)
				lib_state++;
				if(lib_s_p)
				lib_state++;
			}
			id=trace[trace_p]&0xffff;
			if(lib_l_p&&(lib_state==2||(lib_state==1&&(!lib_s_p)))){
				rw=1;
				addr=trace[lib_l_p]&0x7fffffff;
			}
			if(lib_s_p&&lib_state==1){
				rw=0;
				addr=trace[lib_s_p]&0x7fffffff;
			}
			lib_len0=0;
			lib_len1=0;
			if(((trace[trace_p]>>16)&3)==1){
				lib_len0=(trace[lib_len_p]&0x7fffffff);
				lib_len1=0;
			}else if(((trace[trace_p]>>16)&3)==2){
				lib_len0=(trace[lib_len_p]&0x7fffffff)|((trace[lib_len_p+1]&1)<<31);
				lib_len1=(trace[lib_len_p+1]&0x7fffffff)>>1;
			}else{
				lib_len0=(trace[lib_len_p]&0x7fffffff)|((trace[lib_len_p+1]&1)<<31);
				lib_len1=((trace[lib_len_p+1]&0x7fffffff)>>1)|((trace[lib_len_p+2]&3)<<30);
			}
			output[16]=lib_len0;
			output[17]=lib_len1;
			if(lib_state>0){
				lib_state--;
				verify=3;
			}
		}
		if(verify){
			output[18]=verify;
			if(rw){//read
				if(verify==3){
					il0=0;
					il1=0;
					while(1){
						if((il0>=lib_len0&&il1==lib_len1)||il1>lib_len1){
							break;
						}
						check_id=rdt[addr&0x1ffffff];
						found=1;
						output[20]=rds[id];
						for(i=rds[id]&0xffff;i<(rds[id]>>16);i++){
							found=0;
							output[19]=rds[i];
							if(check_id==rds[i]){
								found=1;
								break;
							}
						}
						if(check_id==0){
							found=1;
						}
						output[8]=found;
						if(found==0){
							//std::cout<<"found vio"<<std::endl;
							output[1]++;
							output[13]=id;
							output[14]=addr;
							output[15]=check_id;
						}
						addr+=1;
						if(il0<0xfffffffc){
							il0+=4;
						}else{
							il0=0;
							il1++;
						}
						#if DFI_LATENCY_CHECK
						dfi_pim->record_time_stamp(5);//5 is special
						#endif
					}
				}else{
					check_id=rdt[addr&0x1ffffff];
					found=1;
					for(i=rds[id]&0xffff;i<(rds[id]>>16);i++){
						found=0;
						if(check_id==rds[i]){
							found=1;
							break;
						}
					}
					if(check_id==0){
						found=1;
					}
					output[8]=found;
					if(found==0){
						//std::cout<<"found vio, "<<std::dec<<id<<" "<<std::hex<<(addr<<2)<<" "<<std::dec<<check_id<<std::endl;
						output[1]++;
						output[10]=id;
						output[11]=addr;
						output[12]=check_id;
					}
					#if DFI_LATENCY_CHECK
					dfi_pim->record_time_stamp(5);//5 is special
					#endif
				}
			}else{
				if(verify==3){
					il0=0;
					il1=0;
					while(1){
						if((il0>=lib_len0&&il1==lib_len1)||il1>lib_len1){
							break;
						}
						rdt[addr&0x1ffffff]=id;
						output[16]=rdt[addr&0x1ffffff];
						addr+=1;
						if(il0<0xfffffffc){
							il0+=4;
						}else{
							il0=0;
							il1++;
						}
					}
				}else{
					rdt[addr&0x1ffffff]=id;
					output[16]=rdt[addr&0x1ffffff];
				}
			}
			if(verify==1||verify==2){
				prev_id=id;
				prev_addr=addr;
			}
			if(verify==1)
			trace_p+=2;
			else if(verify==2){
				if(cp_state==0){
					trace_p+=1;
				}
			}else if(verify==3){
				if(lib_state==0){
					trace_p=lib_p;
					lib_p=0;
					lib_l_p=0;
					lib_s_p=0;
					lib_len_p=0;
				}
			}
		}
		if(trace_p>max_p)
		max_p=trace_p;
		output[2]=rds[i];
		output[3]=check_id;
		output[4]=trace_p;
		//output[5]=curr_round;
		output[6]=round;
		output[7]=max_p;
		if(dfi_reg_4[1023]==1234){//it won't
			return NULL;
		}
	}
	return NULL; 
}

void init_2core_dfi(){
	std::cout<<"set cpu to 0"<<std::endl;
	cpu_set_t cpuset;
	CPU_ZERO(&cpuset);
	CPU_SET(0, &cpuset);
	pthread_t current_thread = pthread_self();    
	pthread_setaffinity_np(current_thread, sizeof(cpu_set_t), &cpuset);
	
	dfi_reg=(void**)malloc(8*sizeof(void*));
	unsigned int i,j;
	
	dfi_reg[0]=(void*)malloc(1024*1024*sizeof(unsigned int));//for trace
	dfi_reg[1]=(void*)malloc(1024*1024*64);//for reaching definition table
	dfi_reg[2]=(void*)malloc(1024*1024*sizeof(unsigned int));//for reaching definition set
	dfi_reg[3]=(void*)malloc(1024*sizeof(unsigned int));//for info
	dfi_reg[4]=(void*)malloc(1024*sizeof(unsigned int));//for output
	dfi_reg_0=(unsigned int*)(dfi_reg[0]);
	dfi_reg_1=(unsigned int*)(dfi_reg[1]);
	dfi_reg_2=(unsigned int*)(dfi_reg[2]);
	dfi_reg_3=(unsigned int*)(dfi_reg[3]);
	dfi_reg_4=(unsigned int*)(dfi_reg[4]);
	
	FILE *fptr;
	char ch;
    fptr = fopen("dfi_rds_file", "r");
	if (fptr == NULL){
		printf("Cannot open reachine definition set file\n");
		exit(0);
	}
	i=0;
	unsigned int max_file_p=0;
	ch = fgetc(fptr);
	while (i<4){
		((char*)dfi_reg[2])[i]=ch;
		ch = fgetc(fptr);
		i++;
	}
	max_file_p=((unsigned int*)dfi_reg[2])[0];
	max_file_p=4*(max_file_p&0xffff);
    while (i<max_file_p){
        ((char*)dfi_reg[2])[i]=ch;
        ch = fgetc(fptr);
        i++;
    }
    max_file_p=4*(((unsigned int*)dfi_reg[2])[i/4-1]>>16);
    while (i<max_file_p){
        ((char*)dfi_reg[2])[i]=ch;
        ch = fgetc(fptr);
        i++;
    }
    fclose(fptr);
	
	dfi_user_start=0;
    printf("Create Thread\n"); 
    dfi_thread_id=0;
    pthread_create(&dfi_thread_id, NULL, execute_dficheck, NULL); 
    //pthread_join(dfi_thread_id, NULL); 
	
	dfi_reg_0[0]=12345678;
	//dfi_reg_0[0]=12345678;
	dfi_reg_signal=12312312;
	//dfi_reg_signal=12312312;
	dfi_reg_3[2]=22332233;
	
	std::cout<<std::hex<<"reg signal vaddr "<<(unsigned long)(&dfi_reg_signal)<<std::endl;
	std::cout<<std::hex<<"reg 0 vaddr "<<(unsigned long)dfi_reg_0<<std::endl;
	std::cout<<std::hex<<"reg func signal vaddr "<<(unsigned long)(dfi_reg_3+2)<<std::endl;
	printf("%x\n",(unsigned long)__builtin_frame_address(0));
	
	while(dfi_user_start==0);
	std::cout<<"init 2core dfi end"<<std::endl;
}

void init_soft_dfi(){
	std::cout<<"init soft dfi"<<std::endl;
	int fp=open("/dev/mem",O_RDWR|O_SYNC);
	if(fp<0){
		std::cout<<"cannot open /dev/mem"<<std::endl;
		exit(0);
	}
	vmem=mmap(NULL,0x6000000,PROT_READ|PROT_WRITE,MAP_SHARED,fp,0xf4084000);
	if(vmem==NULL){
		std::cout<<"cannot map physical address"<<std::endl;
		exit(0);
	}
	
	//dfi_reg=(void**)malloc(8*sizeof(void*));
	unsigned long i,j;
	std::cout<<"init ready to allocate registers"<<std::endl;
	//dfi_reg[0]=(void *)malloc(128*1024*1024*2);
	//dfi_reg_s=(unsigned short*)(dfi_reg[0]);
	dfi_reg_s=(unsigned short*)vmem;
	dfi_vio=0;
	asm(".word 0x4000000b");
	asm(".word 0x8000000b");
	((unsigned long*)dfi_reg_s)[0]=DFI_MAX_CALLCOUNT;
	for(i=0;i<100000;i++);
	#if DFI_CONFIG
	asm(".word 0xe000000b");
	#else
	asm(".word 0xc000000b");
	#endif
	std::cout<<std::hex<<"max call count "<<((unsigned long*)dfi_reg_s)[0]<<std::endl;
	std::cout<<"init dfi end"<<std::endl;
}

void init_ori_dfi(){
	int i=0;
	std::cout<<"init regions"<<std::endl;
	int fp0=open("/dev/mem",O_RDWR|O_SYNC);
	if(fp0<0){
		std::cout<<"cannot open /dev/mem"<<std::endl;
		exit(0);
	}
	vmem=mmap(NULL,0x6000000,PROT_READ|PROT_WRITE,MAP_SHARED,fp0,0xb5004000);
	if(vmem==NULL){
		std::cout<<"cannot map physical address"<<std::endl;
		exit(0);
	}
	debugspace = (void*)(((char*)vmem));
	instruction = (unsigned long*)(((char*)vmem)+0x100000*4);

	std::cout<<"------------------>>>Init the Rocc instructions..."<<std::endl;
	for(i=0;i<256;i++){
		((unsigned long*)instruction)[i] = 0x55; //begin the core
	}	
	((unsigned long*)instruction)[0] = 0x55; //begin core
	((unsigned long*)instruction)[1] = 0xc;   //read fifo stall core

	//reset tocc
	std::cout<<"-------------------------->>>Begin to reset rocc...."<<std::endl;
	//asm(".word 0x4000000b"); 0100 000 funct===32.U
	std::cout<<"FUNC MAx is ... "<<DFI_MAX_CALLCOUNT<<std::endl;
	unsigned long funcmax = (DFI_MAX_CALLCOUNT);
	ROCC_INSTRUCTION_SS(0,funcmax,0,32);
	std::cout<<"--------------------------<<<Rocc init done!!!"<<std::endl;

	//give the signal to the rocc to init the instruction 
	//**NOTICE** this inst should put in last of the function(debug info need before inst)
	unsigned long inst_phy_addr = 0xb5004000+0x100000*4;
	ROCC_INSTRUCTION_SS(0,inst_phy_addr,128,0);
}

void dfi_rocc_debug(){
	printf("DEBUG: rocc debug begin\n");
	asm(".word 0xd000000b");
	int i;
	for(i=0;i<100000;i++);
	/*
    for(i=0;i<4*300;i++){
		if(i%4==0)
		printf("+++ %d\n",i/4);
		printf("%x\n",dfi_reg_0[i]);
	}
	for(i=4*150000;i<4*150100;i++){
		if(i%4==0)
		printf("+++ %d\n",i/4);
		printf("%x\n",dfi_reg_0[i]);
	}
	*/
	unsigned long *debug;
	debug=(unsigned long*)dfi_reg_0;
	printf("-------\n");
	for(i=0;i<60;i++)
	printf("%lx -> %lx\n",i,debug[i]);
	exit(0);
	/*
	printf(">>>>>>\n");
	for(i=0;i<0x200/2;i++){
		printf("%x -> %x\n",i,dfi_reg_1[i]);
	}*/
	/*
	printf("-------ld taraddrs\n");
	for(i=0;i<0x7ff00;i++)
	printf("%lx -> %lx\n",i,debug[i+100]);
	*/
}

void dfi_debug(){
	std::cout<<"DFI DEBUG INFO"<<std::endl;
	//dfi_pim->wait_for_completion();
	for(int i=0;i<100000;i++)
	for(int j=0;j<500;j++);
	for(int i=0;i<100000;i++);
	for(int i=0;i<100000;i++);
	std::cout<<"trace---------"<<std::endl;
	unsigned int prev_id,prev_addr,dfi_p,addr,id;
	dfi_p=0;
	prev_id=0;
	prev_addr=0;
	for(int i=0;i<20;i++){
		std::cout<<std::hex<<"t "<<dfi_reg_0[i]<<std::endl;
	}
	for(int i=0;i<40000;i++){
		//std::cout<<std::hex<<dfi_reg_0[i]<<std::endl;
		std::cout<<std::dec<<dfi_p<<": ";
		if((dfi_reg_0[dfi_p]>>30)&1){
			for(int j=0;j<2;j++){
				std::cout<<std::hex<<"c "<<dfi_reg_0[dfi_p];
				if(dfi_reg_0[dfi_p]>>(14+15*j)&0x1){
					std::cout<<" read ";
				}else{
					std::cout<<" write ";
				}
				if((dfi_reg_0[dfi_p]>>(13+15*j))&1){
					id=prev_id-((dfi_reg_0[dfi_p]>>(8+15*j))&0x1f);
				}else{
					id=prev_id+((dfi_reg_0[dfi_p]>>(8+15*j))&0x1f);
				}
				std::cout<<std::dec<<"id: "<<id;
				prev_id=id;
				if((dfi_reg_0[dfi_p]>>(7+15*j))&1){
					addr=prev_addr-(((dfi_reg_0[dfi_p]>>(3+15*j))&0xf)<<(((dfi_reg_0[dfi_p]>>(15*j))&0x7)*4));
				}else{
					addr=prev_addr+(((dfi_reg_0[dfi_p]>>(3+15*j))&0xf)<<(((dfi_reg_0[dfi_p]>>(15*j))&0x7)*4));
				}
				std::cout<<std::hex<<" addr: "<<(addr<<2);
				prev_addr=addr;
				std::cout<<std::dec<<" last write: "<<((short*)dfi_reg[1])[addr&0x1ffffff]<<std::endl;
			}
			dfi_p++;
		}else if(((dfi_reg_0[dfi_p]>>29)&3)==0){
			std::cout<<std::hex<<"n "<<dfi_reg_0[dfi_p];
			if((dfi_reg_0[dfi_p]>>16)&1){
				std::cout<<" read ";
			}else{
				std::cout<<" write ";
			}
			std::cout<<std::dec<<"id: "<<(dfi_reg_0[dfi_p]&0xffff);
			std::cout<<std::hex<<" addr: "<<((dfi_reg_0[dfi_p+1]&0x7fffffff)<<2);
			std::cout<<std::dec<<" last write: "<<((short*)dfi_reg[1])[dfi_reg_0[dfi_p+1]&0x1ffffff]<<std::endl;
			prev_id=(dfi_reg_0[dfi_p]&0xffff);
			prev_addr=dfi_reg_0[dfi_p+1];
			dfi_p+=2;
		}else{
			std::cout<<std::hex<<"l ";
			unsigned int dfi_lib_p=0;
			unsigned long dfi_lib_len=0;
			std::cout<<std::dec<<"id: "<<(dfi_reg_0[dfi_p]&0xffff);
			dfi_lib_p++;
			if((dfi_reg_0[dfi_p]>>18)&1){
				std::cout<<std::hex<<" read addr: "<<((dfi_reg_0[dfi_p+dfi_lib_p]&0x7fffffff)<<2);
				std::cout<<std::dec<<" last write: "<<((short*)dfi_reg[1])[dfi_reg_0[dfi_p+dfi_lib_p]&0x1ffffff];
				dfi_lib_p++;
			}
			if((dfi_reg_0[dfi_p]>>19)&1){
				std::cout<<std::hex<<" write addr: "<<((dfi_reg_0[dfi_p+dfi_lib_p]&0x7fffffff)<<2);
				std::cout<<std::dec<<" last write: "<<((short*)dfi_reg[1])[dfi_reg_0[dfi_p+dfi_lib_p]&0x1ffffff];
				dfi_lib_p++;
			}
			if(((dfi_reg_0[dfi_p]>>16)&3)==1){
				dfi_lib_len=(dfi_reg_0[dfi_p+dfi_lib_p]&0x7fffffff);
				dfi_lib_p+=1;
			}else if(((dfi_reg_0[dfi_p]>>16)&3)==2){
				dfi_lib_len=(dfi_reg_0[dfi_p+dfi_lib_p]&0x7fffffff)|((dfi_reg_0[dfi_p+dfi_lib_p+1]&1)<<31);
				dfi_lib_len|=((dfi_reg_0[dfi_p+dfi_lib_p+1]&0x7fffffff)>>1)<<32;
				dfi_lib_p+=2;
			}else{
				dfi_lib_len=(dfi_reg_0[dfi_p+dfi_lib_p]&0x7fffffff)|((dfi_reg_0[dfi_p+dfi_lib_p+1]&1)<<31);
				dfi_lib_len|=(((dfi_reg_0[dfi_p+dfi_lib_p+1]&0x7fffffff)>>1)|((dfi_reg_0[dfi_p+dfi_lib_p+2]&3)<<30))<<32;
				dfi_lib_p+=3;
			}
			std::cout<<std::hex<<" length: "<<dfi_lib_len<<std::endl;
			dfi_p+=dfi_lib_p;
		}
	}
	
	std::cout<<"rds---------"<<std::endl;
	int rdt_len=((int*)dfi_reg[2])[0]&0xffff;
	for(int i=0;i<rdt_len;i++){
		std::cout<<i<<": ";
		for(int j=((int*)dfi_reg[2])[i]&0xffff;j<(((int*)dfi_reg[2])[i]>>16);j++){
			std::cout<<((int*)dfi_reg[2])[j]<<" ";
		}
		std::cout<<std::endl;
	}
	std::cout<<"reg 4---------"<<std::endl;
	for(int i=0;i<25;i++){
		std::cout<<std::dec<<i<<": "<<dfi_reg_4[i]<<std::endl;
	}
	
}

void dfi_rocc_stlddebug(unsigned int info){
	std::cout<<"rocc: now processing "<<std::hex<<info<<std::endl;
	int i;
	for(i=0;i<100000;i++);
}
