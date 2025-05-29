export dfi_config=0

cd $SPECPATH/471.omnetpp/src/
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherAppCli.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherAppCli.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherAppCli_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherAppCli_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherAppSrv.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherAppSrv.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherAppSrv_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherAppSrv_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherApp_m.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherApp_m.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherBus.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherBus.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherBus_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherBus_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherCtrl_m.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherCtrl_m.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherEncap.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherEncap.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherEncap_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherEncap_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherFrame_m.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherFrame_m.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherHost_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherHost_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherHub.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherHub.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherHub_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherHub_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherLLC.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherLLC.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherLLC_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherLLC_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherMAC.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherMAC.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherMAC_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherMAC_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o EtherSwitch_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       EtherSwitch_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o LargeNet_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       LargeNet_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o MACAddress.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       MACAddress.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o MACAddress_m.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       MACAddress_m.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o MACRelayUnitBase.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       MACRelayUnitBase.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o MACRelayUnitNP.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       MACRelayUnitNP.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o MACRelayUnitNP_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       MACRelayUnitNP_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o MACRelayUnitPP.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       MACRelayUnitPP.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o MACRelayUnitPP_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       MACRelayUnitPP_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o MACRelayUnit_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       MACRelayUnit_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o Networks_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       Networks_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o eth-index_n.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       eth-index_n.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o utils.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       utils.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/cmdenv/cmdenv.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/cmdenv/cmdenv.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/cmdenv/enumstr.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/cmdenv/enumstr.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/cmdenv/heap.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/cmdenv/heap.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/envir/akoutvectormgr.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/envir/akoutvectormgr.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/envir/args.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/envir/args.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/envir/cenvir.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/envir/cenvir.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/envir/cinifile.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/envir/cinifile.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/envir/filemgrs.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/envir/filemgrs.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/envir/main.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/envir/main.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/envir/omnetapp.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/envir/omnetapp.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/envir/patmatch.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/envir/patmatch.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/envir/platdep.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/envir/platdep.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/envir/seeds.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/envir/seeds.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/envir/slaveapp.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/envir/slaveapp.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/envir/speedmtr.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/envir/speedmtr.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/carray.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/carray.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cexception.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cexception.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cmessage.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cmessage.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cpar.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cpar.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/ctypes.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/ctypes.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/task.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/task.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cchannel.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cchannel.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cfsm.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cfsm.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cmodule.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cmodule.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cpsquare.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cpsquare.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cvarhist.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cvarhist.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/util.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/util.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/ccoroutine.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/ccoroutine.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cgate.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cgate.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cmsgheap.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cmsgheap.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cqueue.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cqueue.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cwatch.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cwatch.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cdensity.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cdensity.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/chead.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/chead.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cnetmod.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cnetmod.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/csimul.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/csimul.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/distrib.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/distrib.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cdetect.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cdetect.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/chist.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/chist.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cobject.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cobject.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cstat.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cstat.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/errmsg.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/errmsg.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cdispstr.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cdispstr.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cksplit.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cksplit.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/coutvect.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/coutvect.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cstruct.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cstruct.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/onstartup.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/onstartup.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cenum.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cenum.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cllist.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cllist.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/cpacket.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/cpacket.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/ctopo.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/ctopo.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/random.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/random.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/sim/std/netpack.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/sim/std/netpack.cc
$LLVMPATH/bin/clang++ -emit-llvm -c -o libs/spec/spec_qsort.bc -DSPEC_CPU -DNDEBUG -I. -Iomnet_include -Ilibs/envir   -O3 -fno-math-errno   -DSPEC_CPU_LP64       libs/spec/spec_qsort.cc

mkdir $WORKPATH/libs
mkdir $WORKPATH/libs/cmdenv
mkdir $WORKPATH/libs/envir
mkdir $WORKPATH/libs/sim
mkdir $WORKPATH/libs/sim/std
mkdir $WORKPATH/libs/spec
find . -type f | grep -i .bc$ | xargs -i cp {} $WORKPATH/{}
rm *.bc

cd $WORKPATH
$LLVMPATH/bin/llvm-link   EtherAppCli.bc EtherAppCli_n.bc EtherAppSrv.bc EtherAppSrv_n.bc EtherApp_m.bc EtherBus.bc EtherBus_n.bc EtherCtrl_m.bc EtherEncap.bc EtherEncap_n.bc EtherFrame_m.bc EtherHost_n.bc EtherHub.bc EtherHub_n.bc EtherLLC.bc EtherLLC_n.bc EtherMAC.bc EtherMAC_n.bc EtherSwitch_n.bc LargeNet_n.bc MACAddress.bc MACAddress_m.bc MACRelayUnitBase.bc MACRelayUnitNP.bc MACRelayUnitNP_n.bc MACRelayUnitPP.bc MACRelayUnitPP_n.bc MACRelayUnit_n.bc Networks_n.bc eth-index_n.bc utils.bc libs/cmdenv/cmdenv.bc libs/cmdenv/enumstr.bc libs/cmdenv/heap.bc libs/envir/akoutvectormgr.bc libs/envir/args.bc libs/envir/cenvir.bc libs/envir/cinifile.bc libs/envir/filemgrs.bc libs/envir/main.bc libs/envir/omnetapp.bc libs/envir/patmatch.bc libs/envir/platdep.bc libs/envir/seeds.bc libs/envir/slaveapp.bc libs/envir/speedmtr.bc libs/sim/carray.bc libs/sim/cexception.bc libs/sim/cmessage.bc libs/sim/cpar.bc libs/sim/ctypes.bc libs/sim/task.bc libs/sim/cchannel.bc libs/sim/cfsm.bc libs/sim/cmodule.bc libs/sim/cpsquare.bc libs/sim/cvarhist.bc libs/sim/util.bc libs/sim/ccoroutine.bc libs/sim/cgate.bc libs/sim/cmsgheap.bc libs/sim/cqueue.bc libs/sim/cwatch.bc libs/sim/cdensity.bc libs/sim/chead.bc libs/sim/cnetmod.bc libs/sim/csimul.bc libs/sim/distrib.bc libs/sim/cdetect.bc libs/sim/chist.bc libs/sim/cobject.bc libs/sim/cstat.bc libs/sim/errmsg.bc libs/sim/cdispstr.bc libs/sim/cksplit.bc libs/sim/coutvect.bc libs/sim/cstruct.bc libs/sim/onstartup.bc libs/sim/cenum.bc libs/sim/cllist.bc libs/sim/cpacket.bc libs/sim/ctopo.bc libs/sim/random.bc libs/sim/std/netpack.bc libs/spec/spec_qsort.bc        -o omnetpp.bc


