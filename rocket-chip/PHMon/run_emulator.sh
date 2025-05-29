#!/bin/bash -ex

export ROCKETCHIP_DIR=/home/wxrqw/rocket/freedom-configsty/rocket-chip
export PHMon=`pwd`
export RISCV=/home/wxrqw/rocket/riscv-software/a-cross

TEST=$1
if [ -z "$TEST" ]
then
    TEST=$PHMon/varanus/build/hello.rv
fi

echo $TEST
cd $PHMon/varanus
make -B RV_TARGET=$RISCV/bin/riscv64-unknown-elf

cd $ROCKETCHIP_DIR/PHMon/emulator
#make CONFIG=KomodoCppConfig ROCKETCHIP_ADDONS=varanus
./emulator-freechips.rocketchip.system-KomodoCppConfig ../riscv-pk/build/pk $TEST
#./emulator-freechips.rocketchip.system-KomodoCppConfig pk $TEST
