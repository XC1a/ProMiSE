#!/bin/bash

export mode="roccinstr"
export runmode="normal"

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
	elif [ ${var} == "-whlist" ]; then
		export mode="whlist"
	elif [ ${var} == "-dfi" ]; then
		export mode="dfi"
	elif [ ${var} == "-hdfi" ]; then
		export mode="hdfi"
	elif [ ${var} == "-grain" ]; then
		export mode="granin"
	elif [ ${var} == "-soft" ]; then
		export mode="soft"
	elif [ ${var} == "-softtest" ]; then
		export mode="softtest"
	elif [ ${var} == "-analysis" ]; then
		export runmode="analysis"
	elif [ ${var} == "-record" ]; then
		export runmode="record"
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
cp ${PROGPATH}/hdfi_hdfi_att_id ${WORKPATH}/
export content_do_exe="./hdfi_att"

$LLVMPATH/bin/clang -fno-stack-protector -z execstack -emit-llvm -c ${PROGPATH}/hdfi_att.c -o ./hdfi_att.bc

echo "----------benchmark compile done----------"
#exit

$LLVMPATH/bin/clang++ -emit-llvm -c -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/ -D DFI_MAX_CALLCOUNT=${dfi_stop_call_count} -D DFI_CONFIG=${dfi_config} -D DFI_TEST_MODE=${dfi_t_mode} -D DFI_MAX_PC=${dfi_m_pc} -D DFI_TEST_COUNT=${dfi_t_count} ${PROGPATH}/dfi_inst.cc -lstdc++ -o dfi_inst.bc 
$LLVMPATH/bin/llvm-link dfi_inst.bc hdfi_att.bc -o hdfi_att.bc

$LLVMPATH/bin/llvm-dis dfi_inst.bc

echo "----------link initialization done----------"

$SVFPATH/bin/wpa -ander -gen-def-set -print-def-set -print-prog-id hdfi_att.bc > hdfi_att.rd

$LLVMPATH/bin/llvm-dis hdfi_att.wpa
cp hdfi_att.wpa.ll hdfi_att.ll
cp hdfi_att.wpa hdfi_att.bc

echo "----------static analysis done----------"

python ${PROGPATH}/genrds.py hdfi_att -init -sfunc dfi_inst

echo "----------added initialization function----------"

$LLVMPATH/bin/llvm-as hdfi_att.ll -o hdfi_att.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m hdfi_att.bc -o hdfi_att.s
sed -i 's/\.attribute.*//g' hdfi_att.s
echo "changing asm instrumentation"
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/ hdfi_att.s -O0 -L./ -lpthread -lstdc++ -lm -o hdfi_att
${COMPILECHAIN}objdump -d hdfi_att > hdfi_att.od

echo "----------program compile done----------"

python ${PROGPATH}/genrds.py hdfi_att -map -sfunc dfi_inst

echo "----------aux IR generation done----------"

#echo "Generating IR"
$LLVMPATH/bin/llvm-as hdfi_att.ll.aux -o hdfi_att.bc.aux

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m hdfi_att.bc.aux -o hdfi_att.s
sed -i 's/\.attribute.*//g' hdfi_att.s
echo "changing asm instrumentation"
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/ hdfi_att.s -O0 -L./ -lpthread -lstdc++ -lm -o hdfi_att.aux
${COMPILECHAIN}objdump -d hdfi_att.aux > hdfi_att.od.aux

echo "----------aux program compilation done----------"
#clean
rm *.bc

if [ ${mode} == "noinstr" ]; then

python ${PROGPATH}/genrds.py hdfi_att -rds -sfunc dfi_inst

echo "----------no instrumentation mode done----------"

elif [ ${mode} == "dfi" ]; then

python ${PROGPATH}/genrds.py hdfi_att -roccinstr -dfi -sfunc dfi_inst -allfunc -debugdfi

$LLVMPATH/bin/llvm-as hdfi_att.ll -o hdfi_att.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m hdfi_att.bc -o hdfi_att.s
sed -i 's/\.attribute.*//g' hdfi_att.s
echo "changing asm instrumentation"
python ${PROGPATH}/genrds.py hdfi_att -revasm -sfunc dfi_inst
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  hdfi_att.s -O0 -L./ -lpthread -lstdc++ -lm -o hdfi_att
${COMPILECHAIN}objdump -d hdfi_att > hdfi_att.od
sed -i '2,3d' ${PROGPATH}/inst-gen/genCoInst.py
sed -i "2i DFI=1" ${PROGPATH}/inst-gen/genCoInst.py
sed -i "3i CFI=0" ${PROGPATH}/inst-gen/genCoInst.py
python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_dfi_v4.txt
python ${PROGPATH}/srtable_fresh.py dfi_rds_file -key 8 -value 2 
echo "----------dfi mode done----------"



elif [ ${mode} == "lwDIFT" ]; then

python ${PROGPATH}/genrds.py hdfi_att -roccinstr -hdfi_instr -usr_instr hdfi_hdfi_att_id -dfi -sfunc dfi_inst -allfunc -debugdfi

$LLVMPATH/bin/llvm-as hdfi_att.ll -o hdfi_att.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m hdfi_att.bc -o hdfi_att.s
sed -i 's/\.attribute.*//g' hdfi_att.s
echo "changing asm instrumentation"
python ${PROGPATH}/genrds.py hdfi_att -revasm -sfunc dfi_inst
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  hdfi_att.s -O0 -L./ -lpthread -lstdc++ -lm -o hdfi_att
${COMPILECHAIN}objdump -d hdfi_att > hdfi_att.od
sed -i '2,3d' ${PROGPATH}/inst-gen/genCoInst.py
sed -i "2i DFI=1" ${PROGPATH}/inst-gen/genCoInst.py
sed -i "3i CFI=0" ${PROGPATH}/inst-gen/genCoInst.py
python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_hdfi_v2.txt
echo "----------hdfi mode done----------"



elif [ ${mode} == "whlist" ]; then

python ${PROGPATH}/genrds.py hdfi_att -roccinstr -whlist -usr_instr wh_hdfi_att_id -dfi -sfunc dfi_inst -allfunc -debugdfi

$LLVMPATH/bin/llvm-as hdfi_att.ll -o hdfi_att.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m hdfi_att.bc -o hdfi_att.s
sed -i 's/\.attribute.*//g' hdfi_att.s
echo "changing asm instrumentation"
python ${PROGPATH}/genrds.py hdfi_att -revasm -sfunc dfi_inst
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  hdfi_att.s -O0 -L./ -lpthread -lstdc++ -lm -o hdfi_att
${COMPILECHAIN}objdump -d hdfi_att > hdfi_att.od
sed -i '2,3d' ${PROGPATH}/inst-gen/genCoInst.py
sed -i "2i DFI=1" ${PROGPATH}/inst-gen/genCoInst.py
sed -i "3i CFI=0" ${PROGPATH}/inst-gen/genCoInst.py
python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_whlist.txt



echo "----------white list mode done----------"

fi
