export dfi_t_count=56490903
export dfi_config=0

cd $SPECPATH/464.h264ref/src/
$LLVMPATH/bin/clang -emit-llvm -c -o annexb.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         annexb.c
$LLVMPATH/bin/clang -emit-llvm -c -o biariencode.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         biariencode.c
$LLVMPATH/bin/clang -emit-llvm -c -o block.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         block.c
$LLVMPATH/bin/clang -emit-llvm -c -o cabac.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         cabac.c
$LLVMPATH/bin/clang -emit-llvm -c -o configfile.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         configfile.c
$LLVMPATH/bin/clang -emit-llvm -c -o context_ini.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         context_ini.c
$LLVMPATH/bin/clang -emit-llvm -c -o decoder.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         decoder.c
$LLVMPATH/bin/clang -emit-llvm -c -o explicit_gop.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         explicit_gop.c
$LLVMPATH/bin/clang -emit-llvm -c -o fast_me.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         fast_me.c
$LLVMPATH/bin/clang -emit-llvm -c -o filehandle.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         filehandle.c
$LLVMPATH/bin/clang -emit-llvm -c -o fmo.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         fmo.c
$LLVMPATH/bin/clang -emit-llvm -c -o header.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         header.c
$LLVMPATH/bin/clang -emit-llvm -c -o image.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         image.c
$LLVMPATH/bin/clang -emit-llvm -c -o intrarefresh.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         intrarefresh.c
$LLVMPATH/bin/clang -emit-llvm -c -o leaky_bucket.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         leaky_bucket.c
$LLVMPATH/bin/clang -emit-llvm -c -o lencod.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         lencod.c
$LLVMPATH/bin/clang -emit-llvm -c -o loopFilter.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         loopFilter.c
$LLVMPATH/bin/clang -emit-llvm -c -o macroblock.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         macroblock.c
$LLVMPATH/bin/clang -emit-llvm -c -o mb_access.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         mb_access.c
$LLVMPATH/bin/clang -emit-llvm -c -o mbuffer.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         mbuffer.c
$LLVMPATH/bin/clang -emit-llvm -c -o memalloc.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         memalloc.c
$LLVMPATH/bin/clang -emit-llvm -c -o mv-search.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         mv-search.c
$LLVMPATH/bin/clang -emit-llvm -c -o nal.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         nal.c
$LLVMPATH/bin/clang -emit-llvm -c -o nalu.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         nalu.c
$LLVMPATH/bin/clang -emit-llvm -c -o nalucommon.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         nalucommon.c
$LLVMPATH/bin/clang -emit-llvm -c -o output.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         output.c
$LLVMPATH/bin/clang -emit-llvm -c -o parset.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         parset.c
$LLVMPATH/bin/clang -emit-llvm -c -o parsetcommon.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         parsetcommon.c
$LLVMPATH/bin/clang -emit-llvm -c -o q_matrix.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         q_matrix.c
$LLVMPATH/bin/clang -emit-llvm -c -o q_offsets.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         q_offsets.c
$LLVMPATH/bin/clang -emit-llvm -c -o ratectl.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         ratectl.c
$LLVMPATH/bin/clang -emit-llvm -c -o rdopt.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         rdopt.c
$LLVMPATH/bin/clang -emit-llvm -c -o rdopt_coding_state.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         rdopt_coding_state.c
$LLVMPATH/bin/clang -emit-llvm -c -o rdpicdecision.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         rdpicdecision.c
$LLVMPATH/bin/clang -emit-llvm -c -o refbuf.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         refbuf.c
$LLVMPATH/bin/clang -emit-llvm -c -o rtp.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         rtp.c
$LLVMPATH/bin/clang -emit-llvm -c -o sei.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         sei.c
$LLVMPATH/bin/clang -emit-llvm -c -o slice.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         slice.c
$LLVMPATH/bin/clang -emit-llvm -c -o transform8x8.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         transform8x8.c
$LLVMPATH/bin/clang -emit-llvm -c -o vlc.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         vlc.c
$LLVMPATH/bin/clang -emit-llvm -c -o weighted_prediction.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         weighted_prediction.c
$LLVMPATH/bin/clang -emit-llvm -c -o specrand.bc -DSPEC_CPU -DNDEBUG   -O3 -std=gnu89        -DSPEC_CPU_LP64         specrand.c
cp *.bc $WORKPATH
rm *.bc

cd $WORKPATH
$LLVMPATH/bin/llvm-link    annexb.bc biariencode.bc block.bc cabac.bc configfile.bc context_ini.bc decoder.bc explicit_gop.bc fast_me.bc filehandle.bc fmo.bc header.bc image.bc intrarefresh.bc leaky_bucket.bc lencod.bc loopFilter.bc macroblock.bc mb_access.bc mbuffer.bc memalloc.bc mv-search.bc nal.bc nalu.bc nalucommon.bc output.bc parset.bc parsetcommon.bc q_matrix.bc q_offsets.bc ratectl.bc rdopt.bc rdopt_coding_state.bc rdpicdecision.bc refbuf.bc rtp.bc sei.bc slice.bc transform8x8.bc vlc.bc weighted_prediction.bc specrand.bc    -o h264ref.bc
