#!/bin/bash

export target=${1}

export mode="inst"
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
	elif [ ${var} == "-cfi" ]; then
		export mode="cfi"
	elif [ ${var} == "-dfi" ]; then
		export mode="dfi"
	elif [ ${var} == "-hdfi" ]; then
		export mode="hdfi"
	elif [ ${var} == "-whlist" ]; then
		export mode="whlist"
	elif [ ${var} == "-sstack" ]; then
		export mode="sstack"
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
export COMPILECHAIN=YOUR_PATH/rocket/riscv-software/linux-cross/bin/riscv64-unknown-linux-gnu-
export RISCVCXXLIBPATH=YOUR_PATH/rocket/riscv-software/linux-cross/riscv64-unknown-linux-gnu/include/c++/7.2.0
export LLVMPATH=YOUR_PATH/rocket/llvm-7.0.0/Realse-build
export LLVMPATH2=YOUR_PATH/rocket/riscv-software/llvm
export SVFPATH=YOUR_PATH/rocket/SVF/Release-build
export SPECPATH=SPEC_PATH/speccpu/benchspec/CPU2006
export ROOTPATH=YOUR_PATH/rocket/freedom-configsty
export PROGPATH=YOUR_PATH/rocket/freedom-configsty/programs
export WORKPATH=YOUR_PATH/rocket/freedom-configsty/run_${2}
export COREMARKPATH=YOUR_PATH/rocket/freedom-configsty/programs/coremark


mkdir ${WORKPATH}
cd ${WORKPATH}

if [ ${target} == "400" ]; then
export target="perlbench"
export content_do_exe="./perlbench -I./lib ./splitmail.pl 64 12 26 16 4500"
export spec_file="${SPECPATH}/400.perlbench/data/all/input/lib ${SPECPATH}/400.perlbench/data/all/input/splitmail.pl"
elif [ ${target} == "401" ]; then
export target="bzip2"
export content_do_exe="./bzip2 control"
export spec_file="${SPECPATH}/401.bzip2/data/test/input/control"
elif [ ${target} == "429" ]; then
export target="mcf"
export content_do_exe="./mcf ./inp.in"
export spec_file="${SPECPATH}/429.mcf/data/test/input/inp.in"
elif [ ${target} == "433" ]; then
export target="milc"
export content_do_exe="./run_433"
export spec_file="${PROGPATH}/run_433"
elif [ ${target} == "444" ]; then
export target="namd"
export content_do_exe="./namd --input namd.input --iterations 38"
export spec_file="${SPECPATH}/444.namd/data/all/input/namd.input"
elif [ ${target} == "445" ]; then
export target="gobmk"
export content_do_exe="./gobmk ./connection1.sgf"
export spec_file="${SPECPATH}/445.gobmk/data/all/input/games/connection1.sgf"
elif [ ${target} == "447" ]; then
export target="dealII"
export content_do_exe="./dealII 23"
export spec_file=""
elif [ ${target} == "450" ]; then
export target="soplex"
export content_do_exe="./soplex -m3500 pds-20.mps"
export spec_file="${SPECPATH}/450.soplex/data/train/input/pds-20.mps"
elif [ ${target} == "456" ]; then
export target="hmmer"
export content_do_exe="./hmmer --fixed 0 --mean 500 --num 5000 --sd 350 --seed 0 ./retro.hmm"
export spec_file="${SPECPATH}/456.hmmer/data/ref/input/retro.hmm"
elif [ ${target} == "458" ]; then
export target="sjeng"
export content_do_exe="./sjeng ./test.txt"
export spec_file="${SPECPATH}/458.sjeng/data/test/input/test.txt "
elif [ ${target} == "462" ]; then
export target="libquantum"
export content_do_exe="./libquantum 100 33"
export spec_file=""
elif [ ${target} == "464" ]; then
export target="h264ref"
export content_do_exe="./h264ref"
export spec_file="${PROGPATH}/encoder.cfg ${SPECPATH}/464.h264ref/data/all/input/foreman_qcif.yuv"
elif [ ${target} == "470" ]; then
export target="lbm"
export content_do_exe="./lbm 3000 reference.dat 0 0 ./100_100_130_cf_a.of"
export spec_file="${SPECPATH}/470.lbm/data/test/input/100_100_130_cf_a.of"
elif [ ${target} == "471" ]; then
export target="omnetpp"
export content_do_exe="./omnetpp"
export spec_file="${SPECPATH}/471.omnetpp/data/test/input/omnetpp.ini"
elif [ ${target} == "473" ]; then
export target="astar"
export content_do_exe="./astar ./rivers.cfg"
export spec_file="${SPECPATH}/473.astar/data/ref/input/rivers.cfg ${SPECPATH}/473.astar/data/ref/input/rivers.bin"

elif [ ${target} == "coremark" ]; then
export target="coremark"

elif [ ${target} == "482" ]; then
export target="sphinx3"
export content_do_exe="./sphinx3 ctlfile . args.an4"
export spec_file="${PROGPATH}/data_482/*"
else
export target="test"
export content_do_exe="./test"
export spec_file=""
fi

for sfile in $spec_file; do
    cp -r ${sfile} ./
done

cp ${PROGPATH}/usr_rds_* ${WORKPATH}/

echo "target is" ${target}

export dfi_t_mode=43214321
export dfi_t_count=1000000
export dfi_m_pc=0x600000
export dfi_config=0
export dfi_stop_call_count=0xffffffffffffffff
#export dfi_stop_call_count=0x0

source ${PROGPATH}/compile_${1}.sh

if [ ${mode} == "ori" ]; then
	$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ${target}.bc -o ${target}.s
	sed -i 's/\.attribute.*//g' ${target}.s
	${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ${target}.s -O0 -L./ -lpthread -lstdc++ -lm -o ${target}
	${COMPILECHAIN}objdump -d ${target} > ${target}.od
	echo "----------original running, benchmark compile done----------"
	exit
fi

echo "----------benchmark compile done----------"

$LLVMPATH/bin/clang++ -emit-llvm -c -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/ -D DFI_MAX_CALLCOUNT=${dfi_stop_call_count} -D DFI_CONFIG=${dfi_config} -D DFI_TEST_MODE=${dfi_t_mode} -D DFI_MAX_PC=${dfi_m_pc} -D DFI_TEST_COUNT=${dfi_t_count} ${PROGPATH}/dfi_inst.cc -lstdc++ -o dfi_inst.bc 
$LLVMPATH/bin/llvm-link ${target}.bc dfi_inst.bc  -o ${target}.bc

$LLVMPATH/bin/llvm-dis dfi_inst.bc

echo "----------link initialization done----------"

if [ ${runmode} != "record" ]; then

$SVFPATH/bin/wpa -ander -gen-def-set -print-def-set -print-prog-id ${target}.bc > ${target}.rd

echo "----------static analysis done----------"

else

echo "COPY RECORD"

cp ${PROGPATH}/record/${target}.rd ${target}.rd
cp ${PROGPATH}/record/${target}.wpa ${target}.wpa

echo "----------load static analysis done----------"

fi

if [ ${runmode} == "analysis" ]; then
cp ${target}.rd ${PROGPATH}/record/
cp ${target}.wpa ${PROGPATH}/record/
exit
fi

$LLVMPATH/bin/llvm-dis ${target}.wpa
cp ${target}.wpa.ll ${target}.ll
cp ${target}.wpa ${target}.bc

python ${PROGPATH}/genrds.py ${target} -init -sfunc dfi_inst

echo "----------added initialization function----------"

$LLVMPATH/bin/llvm-as ${target}.ll -o ${target}.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ${target}.bc -o ${target}.s
sed -i 's/\.attribute.*//g' ${target}.s
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ${target}.s -O0 -L./ -lpthread -lstdc++ -lm -o ${target}
${COMPILECHAIN}objdump -d ${target} > ${target}.od

echo "----------program compile done----------"

python ${PROGPATH}/genrds.py ${target} -map -sfunc dfi_inst

echo "----------aux IR generation done----------"

#echo "Generating IR"
$LLVMPATH/bin/llvm-as ${target}.ll.aux -o ${target}.bc.aux

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ${target}.bc.aux -o ${target}.s
sed -i 's/\.attribute.*//g' ${target}.s
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ${target}.s -O0 -L./ -lpthread -lstdc++ -lm -o ${target}.aux
${COMPILECHAIN}objdump -d ${target}.aux > ${target}.od.aux

echo "----------aux program compilation done----------"

#clean
rm *.bc

if [ ${mode} == "noinstr" ]; then

python ${PROGPATH}/genrds.py ${target} -rds -sfunc dfi_inst
$LLVMPATH/bin/llvm-as ${target}.ll -o ${target}.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ${target}.bc -o ${target}.s
sed -i 's/\.attribute.*//g' ${target}.s
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ${target}.s -O0 -L./ -lpthread -lstdc++ -lm -o ${target}
${COMPILECHAIN}objdump -d ${target} > obj.od
echo "----------no instrumentation mode done----------"

elif [ ${mode} == "oriexit" ]; then

python ${PROGPATH}/genrds.py ${target} -ori -sfunc dfi_inst -debugdfi

$LLVMPATH/bin/llvm-as ${target}.ll -o ${target}.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ${target}.bc -o ${target}.s
sed -i 's/\.attribute.*//g' ${target}.s
echo "changing asm instrumentation"
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ${target}.s -O0 -L./ -lpthread -lstdc++ -lm -o ${target}
${COMPILECHAIN}objdump -d ${target} > ${target}.od

echo "----------ori mode done----------"

elif [ ${mode} == "cfi" ]; then

#python ${PROGPATH}/genrds.py ${target} -roccinstr -sfunc dfi_inst -nofunc -debugrocc #-nofunc #-usrrds usr_rds_test #-stldroccdebug

python ${PROGPATH}/genrds.py ${target} -cfi -sfunc dfi_inst -nofunc -debugcfi

$LLVMPATH/bin/llvm-as ${target}.ll -o ${target}.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ${target}.bc -o ${target}.s
sed -i 's/\.attribute.*//g' ${target}.s
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ${target}.s -O0 -L./ -lpthread -lstdc++ -lm -o ${target}
${COMPILECHAIN}objdump -d ${target} > obj.od
python ${PROGPATH}/cfitable.py obj.od
echo "generate rocc instruction--->>>"
sed -i '2,3d' ${PROGPATH}/inst-gen/genCoInst.py
sed -i "2i DFI=0" ${PROGPATH}/inst-gen/genCoInst.py
sed -i "3i CFI=1" ${PROGPATH}/inst-gen/genCoInst.py
python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_cfi_v3.txt
python ${PROGPATH}/srtable_fresh.py cfitable -key 8 -value 8 
#python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_cfi_test_pc.txt
#python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/register_clean.txt


echo "----------cfiinst mode done----------"

elif [ ${mode} == "dfi" ]; then


python ${PROGPATH}/genrds.py ${target} -roccinstr -dfi -sfunc dfi_inst -debugdfi -allfunc #-nofunc #-usrrds usr_rds_test #-stldroccdebug

$LLVMPATH/bin/llvm-as ${target}.ll -o ${target}.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ${target}.bc -o ${target}.s
sed -i 's/\.attribute.*//g' ${target}.s
echo "changing asm instrumentation"
python ${PROGPATH}/genrds.py ${target} -revasm -sfunc dfi_inst
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ${target}.s -O0 -L./ -lpthread -lstdc++ -lm -o ${target}
${COMPILECHAIN}objdump -d ${target} > ${target}.od
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


python ${PROGPATH}/genrds.py ${target} -roccinstr -hdfi_instr -dfi -sfunc dfi_inst -debugdfi -allfunc #-nofunc #-usrrds usr_rds_test #-stldroccdebug

$LLVMPATH/bin/llvm-as ${target}.ll -o ${target}.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ${target}.bc -o ${target}.s
sed -i 's/\.attribute.*//g' ${target}.s
echo "changing asm instrumentation"
python ${PROGPATH}/genrds.py ${target} -revasm -sfunc dfi_inst
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ${target}.s -O0 -L./ -lpthread -lstdc++ -lm -o ${target}
${COMPILECHAIN}objdump -d ${target} > ${target}.od
echo "generate rocc instruction--->>>"
sed -i '2,3d' ${PROGPATH}/inst-gen/genCoInst.py
sed -i "2i DFI=1" ${PROGPATH}/inst-gen/genCoInst.py
sed -i "3i CFI=0" ${PROGPATH}/inst-gen/genCoInst.py
python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_hdfi_v2.txt
#python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/register_clean.txt
#python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_dfi_test_pc.txt


echo "----------hdfiinst mode done----------"
elif [ ${mode} == "whlist" ]; then


python ${PROGPATH}/genrds.py ${target} -roccinstr -whlist -dfi -sfunc dfi_inst -allfunc -debugdfi #-nofunc #-usrrds usr_rds_test #-stldroccdebug

$LLVMPATH/bin/llvm-as ${target}.ll -o ${target}.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ${target}.bc -o ${target}.s
sed -i 's/\.attribute.*//g' ${target}.s
echo "changing asm instrumentation"
python ${PROGPATH}/genrds.py ${target} -revasm -sfunc dfi_inst
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ${target}.s -O0 -L./ -lpthread -lstdc++ -lm -o ${target}
${COMPILECHAIN}objdump -d ${target} > ${target}.od
echo "generate rocc instruction--->>>"
sed -i '2,3d' ${PROGPATH}/inst-gen/genCoInst.py
sed -i "2i DFI=1" ${PROGPATH}/inst-gen/genCoInst.py
sed -i "3i CFI=0" ${PROGPATH}/inst-gen/genCoInst.py
python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_whlist_v2.txt


echo "----------white list inst mode done----------"
elif [ ${mode} == "sstack" ]; then

#python ${PROGPATH}/genrds.py ${target} -roccinstr -sfunc dfi_inst -nofunc -debugrocc #-nofunc #-usrrds usr_rds_test #-stldroccdebug

python ${PROGPATH}/genrds.py ${target} -cfi -sfunc dfi_inst -nofunc -debugcfi

$LLVMPATH/bin/llvm-as ${target}.ll -o ${target}.bc

$LLVMPATH2/bin/llc -O0 -march=riscv64 -mcpu=generic-rv64 -mattr=+a,+c,+d,+f,+m ${target}.bc -o ${target}.s
sed -i 's/\.attribute.*//g' ${target}.s
${COMPILECHAIN}g++ -I${RISCVCXXLIBPATH} -I ${RISCVCXXLIBPATH}/riscv64-unknown-linux-gnu/  ${target}.s -O0 -L./ -lpthread -lstdc++ -lm -o ${target}
${COMPILECHAIN}objdump -d ${target} > obj.od
python ${PROGPATH}/cfitable.py obj.od
echo "generate rocc instruction--->>>"
sed -i '2,3d' ${PROGPATH}/inst-gen/genCoInst.py
sed -i "2i DFI=0" ${PROGPATH}/inst-gen/genCoInst.py
sed -i "3i CFI=1" ${PROGPATH}/inst-gen/genCoInst.py
python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_cfi_shadowstack.txt
#python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/inst_cfi_test_pc.txt
#python ${PROGPATH}/inst-gen/genCoInst.py FPGA ${PROGPATH}/inst-gen/register_clean.txt


echo "----------shadow stack mode done----------"
fi
