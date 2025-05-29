export dfi_config=0

cd $SPECPATH/450.soplex/src/
$LLVMPATH/bin/clang++ -emit-llvm -c -o changesoplex.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       changesoplex.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o didxset.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       didxset.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o dsvector.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       dsvector.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o dvector.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       dvector.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o enter.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       enter.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o example.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       example.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o factor.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       factor.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o forest.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       forest.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o idxset.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       idxset.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o leave.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       leave.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o lpcolset.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       lpcolset.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o lprow.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       lprow.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o lprowset.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       lprowset.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o message.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       message.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o mpsinput.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       mpsinput.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o nameset.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       nameset.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o slufactor.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       slufactor.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o solve.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       solve.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o soplex.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       soplex.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxaggregatesm.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxaggregatesm.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxbasis.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxbasis.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxbounds.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxbounds.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxchangebasis.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxchangebasis.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxdefaultpr.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxdefaultpr.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxdefaultrt.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxdefaultrt.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxdefines.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxdefines.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxdesc.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxdesc.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxdevexpr.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxdevexpr.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxequilisc.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxequilisc.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxfastrt.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxfastrt.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxgeneralsm.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxgeneralsm.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxharrisrt.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxharrisrt.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxhybridpr.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxhybridpr.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxid.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxid.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxio.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxio.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxlp.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxlp.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxlpfread.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxlpfread.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxmpsread.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxmpsread.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxmpswrite.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxmpswrite.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxparmultpr.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxparmultpr.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxquality.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxquality.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxredundantsm.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxredundantsm.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxrem1sm.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxrem1sm.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxscaler.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxscaler.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxshift.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxshift.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxsolve.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxsolve.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxsolver.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxsolver.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxstarter.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxstarter.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxsteeppr.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxsteeppr.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxsumst.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxsumst.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxvecs.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxvecs.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxvectorst.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxvectorst.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxweightpr.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxweightpr.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o spxweightst.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       spxweightst.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o ssvector.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       ssvector.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o svector.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       svector.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o svset.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       svset.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o timer.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       timer.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o unitvector.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       unitvector.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o update.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       update.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o updatevector.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       updatevector.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o vector.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       vector.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o vsolve.bc -DSPEC_CPU -DNDEBUG    -O3   -DSPEC_CPU_LP64       vsolve.cc
cp *.bc $WORKPATH
rm *.bc

cd $WORKPATH
$LLVMPATH/bin/llvm-link  changesoplex.bc didxset.bc dsvector.bc dvector.bc enter.bc example.bc factor.bc forest.bc idxset.bc leave.bc lpcolset.bc lprow.bc lprowset.bc message.bc mpsinput.bc nameset.bc slufactor.bc solve.bc soplex.bc spxaggregatesm.bc spxbasis.bc spxbounds.bc spxchangebasis.bc spxdefaultpr.bc spxdefaultrt.bc spxdefines.bc spxdesc.bc spxdevexpr.bc spxequilisc.bc spxfastrt.bc spxgeneralsm.bc spxharrisrt.bc spxhybridpr.bc spxid.bc spxio.bc spxlp.bc spxlpfread.bc spxmpsread.bc spxmpswrite.bc spxparmultpr.bc spxquality.bc spxredundantsm.bc spxrem1sm.bc spxscaler.bc spxshift.bc spxsolve.bc spxsolver.bc spxstarter.bc spxsteeppr.bc spxsumst.bc spxvecs.bc spxvectorst.bc spxweightpr.bc spxweightst.bc ssvector.bc svector.bc svset.bc timer.bc unitvector.bc update.bc updatevector.bc vector.bc vsolve.bc     -o soplex.bc

