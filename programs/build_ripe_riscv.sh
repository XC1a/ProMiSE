#!/bin/bash

export mode="roccinstr"
export runmode="normal"
export debug_mode="perform_attack"

for var in "$@"
do
	if [ ${var} == "-ori" ]; then
		export mode="ori"
	elif [ ${var} == "-oriexit" ]; then
		export mode="oriexit"
	elif [ ${var} == "-noinstr" ]; then
		export mode="noinstr"
    elif [ ${var} == "-core2" ]; then
		export mode="core2"
	elif [ ${var} == "-roccinstr" ]; then
		export mode="roccinstr"
	elif [ ${var} == "-cfi" ]; then
		export mode="cfi"
	elif [ ${var} == "-dfi" ]; then
		export mode="dfi"
	elif [ ${var} == "-hdfi" ]; then
		export mode="hdfi"
	elif [ ${var} == "-soft" ]; then
		export mode="soft"
	elif [ ${var} == "-softtest" ]; then
		export mode="softtest"
	elif [ ${var} == "-analysis" ]; then
		export runmode="analysis"
	elif [ ${var} == "-record" ]; then
		export runmode="record"
	elif [ ${var} == "-ret" ]; then
		export debug_mode="main"
	elif [ ${var} == "-att" ]; then
		export debug_mode="perform_attack"
	fi
done

#LLVMPATH is for clang
#LLVMPATH2 is for llc
export COMPILECHAIN=/home/wxrqw/rocket/riscv-software/linux-cross/bin/riscv64-unknown-linux-gnu-
export RISCVCXXLIBPATH=/home/wxrqw/rocket/riscv-software/linux-cross/riscv64-unknown-linux-gnu/include/c++/7.2.0
export LLVMPATH=/home/wxrqw/rocket/llvm-7.0.0/Realse-build
export LLVMPATH2=/home/wxrqw/rocket/riscv-software/llvm
export SVFPATH=/home/wxrqw/rocket/SVF/Release-build
export SPECPATH=/opt/speccpu/benchspec/CPU2006
export ROOTPATH=/home/wxrqw/rocket/freedom-configsty
export PROGPATH=/home/wxrqw/rocket/freedom-configsty/programs
export WORKPATH=/home/wxrqw/rocket/freedom-configsty/run_${1}

export dfi_t_mode=43214321
export dfi_t_count=1000000000
export dfi_m_pc=0x410000
export dfi_config=0
export dfi_stop_call_count=0xffffffffffffffff


mkdir ${WORKPATH}
cd ${WORKPATH}

cp ${PROGPATH}/usr_rds_* ${WORKPATH}/
cp ${PROGPATH}/*_ripe_id ${WORKPATH}/


$LLVMPATH/bin/clang -fno-stack-protector -z execstack -emit-llvm -c ${PROGPATH}/ripe_riscv/ripe_attack_generator.c -o ./ripe_attack_generator.bc

echo "----------benchmark compile done----------"
#exit

$LLVMPATH/bin/clang++ -emit-llvm -c -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/ -D DFI_MAX_CALLCOUNT=${dfi_stop_call_count} -D DFI_CONFIG=${dfi_config} -D DFI_TEST_MODE=${dfi_t_mode} -D DFI_MAX_PC=${dfi_m_pc} -D DFI_TEST_COUNT=${dfi_t_count} ${PROGPATH}/dfi_inst.cc -lstdc++ -o dfi_inst.bc 
$LLVMPATH/bin/llvm-link dfi_inst.bc ripe_attack_generator.bc -o ripe_attack_generator.bc

$LLVMPATH/bin/llvm-dis dfi_inst.bc

echo "----------link initialization done----------"

$SVFPATH/bin/wpa -ander -gen-def-set -print-def-set -print-prog-id ripe_attack_generator.bc > ripe_attack_generator.rd

$LLVMPATH/bin/llvm-dis ripe_attack_generator.wpa
cp ripe_attack_generator.wpa.ll ripe_attack_generator.ll
cp ripe_attack_generator.wpa ripe_attack_generator.bc

echo "----------static analysis done----------"

if [ ${mode} != "ori" ]; then
python ${PROGPATH}/genrds.py ripe_attack_generator -init -sfunc dfi_inst
echo "----------added initialization function----------"
fi

$LLVMPATH/bin/llvm-as ripe_attack_generator.ll -o ripe_attack_generator.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ripe_attack_generator.bc -o ripe_attack_generator.s
sed -i 's/\.attribute.*//g' ripe_attack_generator.s
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/ ripe_attack_generator.s -O0 -L./ -lpthread -lstdc++ -lm -o ripe_attack_generator
${COMPILECHAIN}objdump -d ripe_attack_generator > ripe_attack_generator.od

echo "----------program compile done----------"

if [ ${mode} != "ori" ]; then
python ${PROGPATH}/genrds.py ripe_attack_generator -map -sfunc dfi_inst

echo "----------aux IR generation done----------"
fi

#echo "Generating IR"
$LLVMPATH/bin/llvm-as ripe_attack_generator.ll.aux -o ripe_attack_generator.bc.aux

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ripe_attack_generator.bc.aux -o ripe_attack_generator.s
sed -i 's/\.attribute.*//g' ripe_attack_generator.s
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/ ripe_attack_generator.s -O0 -L./ -lpthread -lstdc++ -lm -o ripe_attack_generator.aux
${COMPILECHAIN}objdump -d ripe_attack_generator.aux > ripe_attack_generator.od.aux

echo "----------aux program compilation done----------"
#clean
rm *.bc

if [ ${mode} == "noinstr" ]; then

python ${PROGPATH}/genrds.py ripe_attack_generator -rds -usrrds usr_rds_ripe -sfunc dfi_inst

echo "----------no instrumentation mode done----------"

elif [ ${mode} == "cfi" ]; then

python ${PROGPATH}/genrds.py ripe_attack_generator -cfi -sfunc dfi_inst -allfunc -timestampfunc ${debug_mode} -debugcfi #-nofunc #-usrrds usr_rds_test #-stldroccdebug

$LLVMPATH/bin/llvm-as ripe_attack_generator.ll -o ripe_attack_generator.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ripe_attack_generator.bc -o ripe_attack_generator.s
sed -i 's/\.attribute.*//g' ripe_attack_generator.s
echo "changing asm instrumentation"
python ${PROGPATH}/genrds.py ripe_attack_generator -revasm -sfunc dfi_inst
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ripe_attack_generator.s -O0 -L./ -lpthread -lstdc++ -lm -fno-stack-protector -z execstack -o ripe_attack_generator
${COMPILECHAIN}objdump -d ripe_attack_generator > obj.od
python ${PROGPATH}/cfitable.py obj.od
echo "generate rocc instruction--->>>"
sed -i '2,3d' ${PROGPATH}/inst-gen/genCoInst.py
sed -i "2i DFI=0" ${PROGPATH}/inst-gen/genCoInst.py
sed -i "3i CFI=1" ${PROGPATH}/inst-gen/genCoInst.py
python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_cfi_v3.txt
python ${PROGPATH}/srtable_fresh.py cfitable -key 8 -value 8 
#python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_cfi_read_jalr.txt
#python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_cfi_test_pc.txt
#python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/_clean.txt
echo "----------cfi mode done----------"

elif [ ${mode} == "dfi" ]; then


python ${PROGPATH}/genrds.py ripe_attack_generator -roccinstr -dfi -usrrds usr_rds_ripe -sfunc dfi_inst -allfunc -timestampfunc ${debug_mode} -debugdfi #-nofunc #-usrrds usr_rds_test #-stldroccdebug

$LLVMPATH/bin/llvm-as ripe_attack_generator.ll -o ripe_attack_generator.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ripe_attack_generator.bc -o ripe_attack_generator.s
sed -i 's/\.attribute.*//g' ripe_attack_generator.s
echo "changing asm instrumentation"
python ${PROGPATH}/genrds.py ripe_attack_generator -revasm -sfunc dfi_inst
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ripe_attack_generator.s -O0 -L./ -lpthread -lstdc++ -lm -o ripe_attack_generator
${COMPILECHAIN}objdump -d ripe_attack_generator > ripe_attack_generator.od
echo "generate rocc instruction--->>>"
sed -i '2,3d' ${PROGPATH}/inst-gen/genCoInst.py
sed -i "2i DFI=1" ${PROGPATH}/inst-gen/genCoInst.py
sed -i "3i CFI=0" ${PROGPATH}/inst-gen/genCoInst.py
python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_dfi_v4.txt
python ${PROGPATH}/srtable_fresh.py dfi_rds_file -key 8 -value 2 
#python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/register_clean.txt
#python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_dfi_test_pc.txt


echo "----------dfiinst mode done----------"

elif [ ${mode} == "lwDIFT" ]; then


python ${PROGPATH}/genrds.py ripe_attack_generator -roccinstr -hdfi_instr -usr_instr hdfi_ripe_id -dfi -sfunc dfi_inst -allfunc -timestampfunc ${debug_mode} -debugdfi #-nofunc #-usrrds usr_rds_test #-stldroccdebug

$LLVMPATH/bin/llvm-as ripe_attack_generator.ll -o ripe_attack_generator.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ripe_attack_generator.bc -o ripe_attack_generator.s
sed -i 's/\.attribute.*//g' ripe_attack_generator.s
echo "changing asm instrumentation"
python ${PROGPATH}/genrds.py ripe_attack_generator -revasm -sfunc dfi_inst
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ripe_attack_generator.s -O0 -L./ -lpthread -lstdc++ -lm -o ripe_attack_generator
${COMPILECHAIN}objdump -d ripe_attack_generator > ripe_attack_generator.od
echo "generate rocc instruction--->>>"
sed -i '2,3d' ${PROGPATH}/inst-gen/genCoInst.py
sed -i "2i DFI=1" ${PROGPATH}/inst-gen/genCoInst.py
sed -i "3i CFI=0" ${PROGPATH}/inst-gen/genCoInst.py
python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_hdfi_ripe.txt


echo "----------hardware dfiinst mode done----------"
fi