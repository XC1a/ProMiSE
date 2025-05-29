export dfi_stop_call_count=0xffffffff
export dfi_config=0
cd $COREMARKPATH

# sed -i '22d' ./posix/core_portme.c
# sed -i "22i #define ITER_NEW=3000" ./posix/core_portme.c

$LLVMPATH/bin/clang  -emit-llvm -c -o core_list_join.bc -D ITERATIONS=3000 -O3                 core_list_join.c -I./posix
$LLVMPATH/bin/clang  -emit-llvm -c -o core_main.bc -D ITERATIONS=3000 -O3                 core_main.c -I./posix
$LLVMPATH/bin/clang  -emit-llvm -c -o core_matrix.bc -D ITERATIONS=3000 -O3                 core_matrix.c -I./posix
$LLVMPATH/bin/clang  -emit-llvm -c -o core_state.bc -D ITERATIONS=3000 -O3                 core_state.c -I./posix
$LLVMPATH/bin/clang  -emit-llvm -c -o core_util.bc -D ITERATIONS=3000 -O3                 core_util.c -I./posix
$LLVMPATH/bin/clang  -emit-llvm -c -o core_portme.bc -D ITERATIONS=3000   -O3                 ./posix/core_portme.c -I./posix -I./
cp *.bc $WORKPATH
rm *.bc

cd $WORKPATH
$LLVMPATH/bin/llvm-link core_list_join.bc core_main.bc core_matrix.bc core_state.bc core_util.bc core_portme.bc -o coremark.bc


