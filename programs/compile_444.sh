export dfi_t_count=13609060
export dfi_config=0

cd $SPECPATH/444.namd/src/
$LLVMPATH/bin/clang++ -emit-llvm -c -o Compute.bc -DSPEC_CPU -DNDEBUG    -O3 -fno-math-errno   -DSPEC_CPU_LP64       Compute.C
$LLVMPATH/bin/clang++ -emit-llvm -c -o ComputeList.bc -DSPEC_CPU -DNDEBUG    -O3 -fno-math-errno   -DSPEC_CPU_LP64       ComputeList.C
$LLVMPATH/bin/clang++ -emit-llvm -c -o ComputeNonbondedUtil.bc -DSPEC_CPU -DNDEBUG    -O3 -fno-math-errno   -DSPEC_CPU_LP64       ComputeNonbondedUtil.C
$LLVMPATH/bin/clang++ -emit-llvm -c -o LJTable.bc -DSPEC_CPU -DNDEBUG    -O3 -fno-math-errno   -DSPEC_CPU_LP64       LJTable.C
$LLVMPATH/bin/clang++ -emit-llvm -c -o Molecule.bc -DSPEC_CPU -DNDEBUG    -O3 -fno-math-errno   -DSPEC_CPU_LP64       Molecule.C
$LLVMPATH/bin/clang++ -emit-llvm -c -o Patch.bc -DSPEC_CPU -DNDEBUG    -O3 -fno-math-errno   -DSPEC_CPU_LP64       Patch.C
$LLVMPATH/bin/clang++ -emit-llvm -c -o PatchList.bc -DSPEC_CPU -DNDEBUG    -O3 -fno-math-errno   -DSPEC_CPU_LP64       PatchList.C
$LLVMPATH/bin/clang++ -emit-llvm -c -o ResultSet.bc -DSPEC_CPU -DNDEBUG    -O3 -fno-math-errno   -DSPEC_CPU_LP64       ResultSet.C
$LLVMPATH/bin/clang++ -emit-llvm -c -o SimParameters.bc -DSPEC_CPU -DNDEBUG    -O3 -fno-math-errno   -DSPEC_CPU_LP64       SimParameters.C
$LLVMPATH/bin/clang++ -emit-llvm -c -o erf.bc -DSPEC_CPU -DNDEBUG    -O3 -fno-math-errno   -DSPEC_CPU_LP64       erf.C
$LLVMPATH/bin/clang++ -emit-llvm -c -o spec_namd.bc -DSPEC_CPU -DNDEBUG    -O3 -fno-math-errno   -DSPEC_CPU_LP64       spec_namd.C
cp *.bc $WORKPATH
rm *.bc

cd $WORKPATH
$LLVMPATH/bin/llvm-link   Compute.bc ComputeList.bc ComputeNonbondedUtil.bc LJTable.bc Molecule.bc Patch.bc PatchList.bc ResultSet.bc SimParameters.bc erf.bc spec_namd.bc     -o namd.bc
