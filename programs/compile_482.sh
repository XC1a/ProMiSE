export dfi_t_count=37300848
export dfi_config=0

cd $SPECPATH/482.sphinx3/src/
$LLVMPATH/bin/clang  -emit-llvm -c -o spec_main_live_pretend.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         spec_main_live_pretend.c
$LLVMPATH/bin/clang  -emit-llvm -c -o parse_args_file.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         parse_args_file.c
$LLVMPATH/bin/clang  -emit-llvm -c -o live.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         live.c
$LLVMPATH/bin/clang  -emit-llvm -c -o agc.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         agc.c
$LLVMPATH/bin/clang  -emit-llvm -c -o approx_cont_mgau.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         approx_cont_mgau.c
$LLVMPATH/bin/clang  -emit-llvm -c -o ascr.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         ascr.c
$LLVMPATH/bin/clang  -emit-llvm -c -o beam.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         beam.c
$LLVMPATH/bin/clang  -emit-llvm -c -o bio.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         bio.c
$LLVMPATH/bin/clang  -emit-llvm -c -o case.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         case.c
$LLVMPATH/bin/clang  -emit-llvm -c -o ckd_alloc.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         ckd_alloc.c
$LLVMPATH/bin/clang  -emit-llvm -c -o cmd_ln.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         cmd_ln.c
$LLVMPATH/bin/clang  -emit-llvm -c -o cmn.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         cmn.c
$LLVMPATH/bin/clang  -emit-llvm -c -o cmn_prior.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         cmn_prior.c
$LLVMPATH/bin/clang  -emit-llvm -c -o cont_mgau.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         cont_mgau.c
$LLVMPATH/bin/clang  -emit-llvm -c -o dict.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         dict.c
$LLVMPATH/bin/clang  -emit-llvm -c -o dict2pid.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         dict2pid.c
$LLVMPATH/bin/clang  -emit-llvm -c -o err.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         err.c
$LLVMPATH/bin/clang  -emit-llvm -c -o feat.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         feat.c
$LLVMPATH/bin/clang  -emit-llvm -c -o fillpen.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         fillpen.c
$LLVMPATH/bin/clang  -emit-llvm -c -o glist.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         glist.c
$LLVMPATH/bin/clang  -emit-llvm -c -o gs.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         gs.c
$LLVMPATH/bin/clang  -emit-llvm -c -o hash.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         hash.c
$LLVMPATH/bin/clang  -emit-llvm -c -o heap.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         heap.c
$LLVMPATH/bin/clang  -emit-llvm -c -o hmm.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         hmm.c
$LLVMPATH/bin/clang  -emit-llvm -c -o io.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         io.c
$LLVMPATH/bin/clang  -emit-llvm -c -o kb.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         kb.c
$LLVMPATH/bin/clang  -emit-llvm -c -o kbcore.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         kbcore.c
$LLVMPATH/bin/clang  -emit-llvm -c -o lextree.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         lextree.c
$LLVMPATH/bin/clang  -emit-llvm -c -o lm.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         lm.c
$LLVMPATH/bin/clang  -emit-llvm -c -o lmclass.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         lmclass.c
$LLVMPATH/bin/clang  -emit-llvm -c -o logs3.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         logs3.c
$LLVMPATH/bin/clang  -emit-llvm -c -o mdef.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         mdef.c
$LLVMPATH/bin/clang  -emit-llvm -c -o new_fe.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         new_fe.c
$LLVMPATH/bin/clang  -emit-llvm -c -o new_fe_sp.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         new_fe_sp.c
$LLVMPATH/bin/clang  -emit-llvm -c -o profile.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         profile.c
$LLVMPATH/bin/clang  -emit-llvm -c -o specrand.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         specrand.c
$LLVMPATH/bin/clang  -emit-llvm -c -o str2words.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         str2words.c
$LLVMPATH/bin/clang  -emit-llvm -c -o subvq.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         subvq.c
$LLVMPATH/bin/clang  -emit-llvm -c -o tmat.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         tmat.c
$LLVMPATH/bin/clang  -emit-llvm -c -o unlimit.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         unlimit.c
$LLVMPATH/bin/clang  -emit-llvm -c -o utt.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         utt.c
$LLVMPATH/bin/clang  -emit-llvm -c -o vector.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         vector.c
$LLVMPATH/bin/clang  -emit-llvm -c -o vithist.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         vithist.c
$LLVMPATH/bin/clang  -emit-llvm -c -o wid.bc -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I. -Ilibutil   -O3 -ffast-math -fsigned-char       -DSPEC_CPU_LP64         wid.c
cp *.bc $WORKPATH
rm *.bc

cd $WORKPATH
$LLVMPATH/bin/llvm-link   spec_main_live_pretend.bc parse_args_file.bc live.bc agc.bc approx_cont_mgau.bc ascr.bc beam.bc bio.bc case.bc ckd_alloc.bc cmd_ln.bc cmn.bc cmn_prior.bc cont_mgau.bc dict.bc dict2pid.bc err.bc feat.bc fillpen.bc glist.bc gs.bc hash.bc heap.bc hmm.bc io.bc kb.bc kbcore.bc lextree.bc lm.bc lmclass.bc logs3.bc mdef.bc new_fe.bc new_fe_sp.bc profile.bc specrand.bc str2words.bc subvq.bc tmat.bc unlimit.bc utt.bc vector.bc vithist.bc wid.bc    -o sphinx3.bc

