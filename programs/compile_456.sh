export dfi_stop_call_count=0x2cf30d2e
export dfi_config=0

cd $SPECPATH/456.hmmer/src/
$LLVMPATH/bin/clang -emit-llvm -c -o alphabet.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         alphabet.c
$LLVMPATH/bin/clang -emit-llvm -c -o core_algorithms.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         core_algorithms.c
$LLVMPATH/bin/clang -emit-llvm -c -o debug.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         debug.c
$LLVMPATH/bin/clang -emit-llvm -c -o display.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         display.c
$LLVMPATH/bin/clang -emit-llvm -c -o emit.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         emit.c
$LLVMPATH/bin/clang -emit-llvm -c -o emulation.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         emulation.c
$LLVMPATH/bin/clang -emit-llvm -c -o fast_algorithms.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         fast_algorithms.c
$LLVMPATH/bin/clang -emit-llvm -c -o histogram.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         histogram.c
$LLVMPATH/bin/clang -emit-llvm -c -o hmmio.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         hmmio.c
$LLVMPATH/bin/clang -emit-llvm -c -o hmmcalibrate.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         hmmcalibrate.c
$LLVMPATH/bin/clang -emit-llvm -c -o hmmsearch.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         hmmsearch.c
$LLVMPATH/bin/clang -emit-llvm -c -o mathsupport.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         mathsupport.c
$LLVMPATH/bin/clang -emit-llvm -c -o masks.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         masks.c
$LLVMPATH/bin/clang -emit-llvm -c -o misc.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         misc.c
$LLVMPATH/bin/clang -emit-llvm -c -o modelmakers.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         modelmakers.c
$LLVMPATH/bin/clang -emit-llvm -c -o plan7.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         plan7.c
$LLVMPATH/bin/clang -emit-llvm -c -o plan9.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         plan9.c
$LLVMPATH/bin/clang -emit-llvm -c -o postprob.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         postprob.c
$LLVMPATH/bin/clang -emit-llvm -c -o prior.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         prior.c
$LLVMPATH/bin/clang -emit-llvm -c -o tophits.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         tophits.c
$LLVMPATH/bin/clang -emit-llvm -c -o trace.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         trace.c
$LLVMPATH/bin/clang -emit-llvm -c -o ucbqsort.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         ucbqsort.c
$LLVMPATH/bin/clang -emit-llvm -c -o a2m.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         a2m.c
$LLVMPATH/bin/clang -emit-llvm -c -o aligneval.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         aligneval.c
$LLVMPATH/bin/clang -emit-llvm -c -o alignio.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         alignio.c
$LLVMPATH/bin/clang -emit-llvm -c -o clustal.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         clustal.c
$LLVMPATH/bin/clang -emit-llvm -c -o cluster.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         cluster.c
$LLVMPATH/bin/clang -emit-llvm -c -o dayhoff.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         dayhoff.c
$LLVMPATH/bin/clang -emit-llvm -c -o eps.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         eps.c
$LLVMPATH/bin/clang -emit-llvm -c -o file.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         file.c
$LLVMPATH/bin/clang -emit-llvm -c -o getopt.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         getopt.c
$LLVMPATH/bin/clang -emit-llvm -c -o gki.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         gki.c
$LLVMPATH/bin/clang -emit-llvm -c -o gsi.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         gsi.c
$LLVMPATH/bin/clang -emit-llvm -c -o hsregex.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         hsregex.c
$LLVMPATH/bin/clang -emit-llvm -c -o iupac.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         iupac.c
$LLVMPATH/bin/clang -emit-llvm -c -o msa.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         msa.c
$LLVMPATH/bin/clang -emit-llvm -c -o msf.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         msf.c
$LLVMPATH/bin/clang -emit-llvm -c -o phylip.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         phylip.c
$LLVMPATH/bin/clang -emit-llvm -c -o revcomp.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         revcomp.c
$LLVMPATH/bin/clang -emit-llvm -c -o rk.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         rk.c
$LLVMPATH/bin/clang -emit-llvm -c -o selex.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         selex.c
$LLVMPATH/bin/clang -emit-llvm -c -o seqencode.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         seqencode.c
$LLVMPATH/bin/clang -emit-llvm -c -o shuffle.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         shuffle.c
$LLVMPATH/bin/clang -emit-llvm -c -o sqerror.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         sqerror.c
$LLVMPATH/bin/clang -emit-llvm -c -o sqio.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         sqio.c
$LLVMPATH/bin/clang -emit-llvm -c -o squidcore.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         squidcore.c
$LLVMPATH/bin/clang -emit-llvm -c -o sre_ctype.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         sre_ctype.c
$LLVMPATH/bin/clang -emit-llvm -c -o sre_math.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         sre_math.c
$LLVMPATH/bin/clang -emit-llvm -c -o sre_random.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         sre_random.c
$LLVMPATH/bin/clang -emit-llvm -c -o sre_string.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         sre_string.c
$LLVMPATH/bin/clang -emit-llvm -c -o ssi.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         ssi.c
$LLVMPATH/bin/clang -emit-llvm -c -o stack.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         stack.c
$LLVMPATH/bin/clang -emit-llvm -c -o stockholm.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         stockholm.c
$LLVMPATH/bin/clang -emit-llvm -c -o translate.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         translate.c
$LLVMPATH/bin/clang -emit-llvm -c -o types.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         types.c
$LLVMPATH/bin/clang -emit-llvm -c -o vectorops.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         vectorops.c
$LLVMPATH/bin/clang -emit-llvm -c -o weight.bc -DSPEC_CPU -DNDEBUG    -O3 -std=gnu89       -DSPEC_CPU_LP64         weight.c
cp *.bc $WORKPATH
rm -r *.bc

cd $WORKPATH
$LLVMPATH/bin/llvm-link     alphabet.bc core_algorithms.bc debug.bc display.bc emit.bc emulation.bc fast_algorithms.bc histogram.bc hmmio.bc hmmcalibrate.bc hmmsearch.bc mathsupport.bc masks.bc misc.bc modelmakers.bc plan7.bc plan9.bc postprob.bc prior.bc tophits.bc trace.bc ucbqsort.bc a2m.bc aligneval.bc alignio.bc clustal.bc cluster.bc dayhoff.bc eps.bc file.bc getopt.bc gki.bc gsi.bc hsregex.bc iupac.bc msa.bc msf.bc phylip.bc revcomp.bc rk.bc selex.bc seqencode.bc shuffle.bc sqerror.bc sqio.bc squidcore.bc sre_ctype.bc sre_math.bc sre_random.bc sre_string.bc ssi.bc stack.bc stockholm.bc translate.bc types.bc vectorops.bc weight.bc    -o hmmer.bc
