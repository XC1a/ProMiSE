export dfi_config=0

cd $SPECPATH/400.perlbench/src/
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o av.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        av.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o deb.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        deb.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o doio.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        doio.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o doop.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        doop.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o dump.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        dump.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o globals.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        globals.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o gv.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        gv.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o hv.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        hv.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o locale.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        locale.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o mg.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        mg.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o numeric.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        numeric.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o op.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        op.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o pad.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        pad.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o perl.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        perl.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o perlapi.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        perlapi.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o perlio.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        perlio.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o perlmain.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        perlmain.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o perly.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        perly.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o pp.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        pp.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o pp_ctl.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        pp_ctl.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o pp_hot.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        pp_hot.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o pp_pack.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        pp_pack.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o pp_sort.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        pp_sort.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o pp_sys.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        pp_sys.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o regcomp.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        regcomp.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o regexec.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        regexec.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o run.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        run.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o scope.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        scope.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o sv.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        sv.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o taint.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        taint.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o toke.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        toke.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o universal.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        universal.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o utf8.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        utf8.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o util.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        util.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o xsutils.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        xsutils.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o Base64.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        Base64.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o Cwd.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        Cwd.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o Dumper.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        Dumper.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o HiRes.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        HiRes.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o IO.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        IO.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o Peek.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        Peek.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o attrs.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        attrs.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o poll.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        poll.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o stdio.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        stdio.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o DynaLoader.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        DynaLoader.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o MD5.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        MD5.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o Storable.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        Storable.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o Parser.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        Parser.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o specrand.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        specrand.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o Hostname.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        Hostname.c
$LLVMPATH/bin/clang  -emit-llvm -std=gnu89 -c -o Opcode.bc -DSPEC_CPU -DNDEBUG -DPERL_CORE  -O3 -ffast-math       -DSPEC_CPU_LP64 -DSPEC_CPU_LINUX_X64        Opcode.c
cp *.bc $WORKPATH
rm *.bc

cd $WORKPATH
$LLVMPATH/bin/llvm-link  av.bc deb.bc doio.bc doop.bc dump.bc globals.bc gv.bc hv.bc locale.bc mg.bc numeric.bc op.bc pad.bc perl.bc perlapi.bc perlio.bc perlmain.bc perly.bc pp.bc pp_ctl.bc pp_hot.bc pp_pack.bc pp_sort.bc pp_sys.bc regcomp.bc regexec.bc run.bc scope.bc sv.bc taint.bc toke.bc universal.bc utf8.bc util.bc xsutils.bc Base64.bc Cwd.bc Dumper.bc HiRes.bc IO.bc Peek.bc attrs.bc poll.bc stdio.bc DynaLoader.bc MD5.bc Storable.bc Parser.bc specrand.bc Hostname.bc Opcode.bc   -o perlbench.bc


