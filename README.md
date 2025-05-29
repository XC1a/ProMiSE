# 1. Introduction of this Repo

This repository contains the implementation of ProMiSE based on Rocket-chip project, which is a flexible/programmable secure monitor enforecing different secuirty policies, e.g., Control-Flow Integrity or Shadow-Stack. More details are shown in IEEE TCAD 2023 Paper:

Xinrui Wang, Lang Feng, Zhongfeng Wang, [ProMiSE: A High-Performance Programmable Hardware Monitor for High Security Enforcement of Software Execution](https://ieeexplore.ieee.org/document/10110921), *IEEE Transactions on Computer-Aided Design of Integrated Circuits and Systems*, vol. 42, no. 11, pp. 3599-3612, Nov. 2023.

We realized 5 security policies on VCU707 board (implementing to other rocket-chip suppotted FPGA boards is not difficult): 

*Shadow Stack*, *White-List*,*Control-flow Integrity(CFI)*, *Light-weight Data-Information-Flow-Track(LW-DIFT)*,*Data-flow Integrity(DFI)*

Acknowledgment: We thank Xun Jiang for his contribution to setting up the basic RISC-V platform.

Following sections will introduce the details of the implementation.

Contact: Xinrui Wang (mailto:xrwang@smail.nju.edu.cn) and Lang Feng ([fenglang3@mail.sysu.edu.cn](mailto:fenglang3@mail.sysu.edu.cn)).

# 2. Repository Contents

1. Folder `freedom-u-sdk`: This contains the Linux system that is tested under the RISC-V processor. The Linux system has been modified to reserve some memory for ProMiSE (the size of this reserved region can be further changed by modifying the Linux source code).
2. Folder `SVF`: This is the *DFI* static analysis tool used in the paper. Refer to the instructions inside the folder to build the tool.
3. Folder `TCAD-ORI-Result`: This is the metadata of the paper, including the benchmark's execution info and the FPGA synthesis results.
4. Folder `rdebug`: This folder contains the debug program, which can be used to read certain memory region after every program executed.
5. Folder `programs`: This folder contains the tools for the offline stage of the paper. User can use the `build.sh` to build the programs they want to monitor.
6. Other folders and files: These are based on the initial Freedom project.

# 3. Environment Setup

### 3.1. GCC Compiler

Multiple GCC compilers are used in this guide for different goals. We name them Toolchains A, B, and C.

#### 3.1.1. Toolchain A

This toolchain is needed when compiling to get Freedom RISC-V processor hardware. Freedom project provided RISC-V GCC toolchain inside `rocket-chip/riscv-tools`. Read the `README.md` under `rocket-chip`. Follow the guidance of “*Setting up the RISCV environment variable*” to build the toolchain A in a folder you want.

In detail, according to the mentioned `README.md`, you need to set the toolchain build path by doing the following:

```bash
$ export RISCV=[paht of toolchain A]
$ cd rocket-chip/riscv-tools
$ ./build.sh
```

Note, toolchain A is built under “newlib” type, without any default libraries such as “stdio.h”.

This is tested successfully under Ubuntu 16.04 and GCC 5.4.0.

#### 3.1.2. Toolchain B

This toolchain is used to compile the binaries running on the RISC-V operating system. Run the following steps:

```bash
$ cd rocket-chip/riscv-tools/riscv-gnu-toolchain
$ ./configure --prefix=[path of toolchain B]
$ make linux # If it shows "make: Nothing to be done for linux", do "make clean", and do "make linux"
```

If `gnu/stubs-lp64.h` cannot be found during any compilation, copy `stubs-lp64d.h` in toolchain B’s `sysroot` folder to `stubs-lp64.h`, and put it into the same folder with `stubs-lp64d.h`.

### 3.2. LLVM Compiler

We need LLVM compiler for static analysis, instrumentation, and generating RISC-V binaries that run on ProMiSE processor. There are 3 LLVM that are simultaneously tested under our repository, with versions 11.0.0, 7.0.0, and 6.0.0. There are reasons for the repository to use 3 versions of LLVM:

- Version 6.0.0 is needed by static analysis tool, which is the modified SVF. It needs and only supports LLVM 6.0.0.
- Version 7.0.0 is needed for instrumentation, because our instrumentation tool needs and only supports the human-readable intermediate representation (IR) code before LLVM version 8.0.1. Besides, Version 6.0.0 does not support RISC-V toolchain, so finally LLVM 7.0.0 is selected.
- LLVM 11.0.0 is needed to compiling and linking the final binaries, because LLVM 7.0.0 can generate RISC-V IR, but does not support generating the final binaries well.

#### 3.2.1. Toochain LLVM11

This toolchain is for compiling the RISC-V binaries running on ProMiSE processor (based on toolchain B):

- Download LLVM and Clang with version >= 8.0.1 (The repository uses 11.0.0 as an example).
- Build LLVM (Please refer to LLVM website for more information). Note that the cmake command needed is as follows (Replace each enter with a space).

```bash
$ cmake -G Unix \
>        Makefiles \
>   -DCMAKE_BUILD_TYPE=Release \
>   -DBUILD_SHARED_LIBS=True \
>    -DLLVM_USE_SPLIT_DWARF=True \
>    -DLLVM_OPTIMIZED_TABLEGEN=True \
>    -DLLVM_BUILD_TESTS=True \
>    -DDEFAULT_SYSROOT=[path of toolchain B]/sysroot/usr \
>    -DGCC_INSTALL_PREFIX=“[path of toolchain B]” \
>    -DLLVM_DEFAULT_TARGET_TRIPLE=“riscv64-unknown-linux-gnu” \
>    -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=“RISCV” \
>    [LLVM source folder’s path] \
```

#### 3.2.2. Toolchain LLVM7

This toolchain is used for generate IR. We need LLVM 7.0.0 for this. The way of build Toolchain LLVM7 is the same as LLVM11.

#### 3.2.3. Toolchain LLVM6

This toolchain is used for the static analysis tool SVF. Currently, the modified SVF only supports LLVM with version 6.0.0. We need to build such version of LLVM and toolchain LLVM6. LLVM6 does not need to be compiled under RISC-V GCC toolchain.

### 3.3. Linux System

Inside `freedom-u-sdk`, also build the RISC-V GCC toolchain. This time, you can just build to the default path:

- Inside `freedom-u-sdk`, run `./rebuild.sh` to build the Linux system
- After the binary `./work/bbl.bin` is generated, use `Win32DiskImager` (or similar tools) to load this binary into an SD card.
- If you want to embed some files inside the Linux system’s filesystem, you can copy them into `./work/buildroot_initramfs_sysroot` (The file sizes should not be large)

# 4. Hardware Preparation (Online Stage of the Paper)

### 4.1. Build the ProMiSE hardware design

Vivado 2018.3 is needed.

Before building ProMiSE, you need to set the following environment variables. Note that the following is only used for build thProMiSEFI hardware design. If you need to compile RISC-V software, please open another terminal and do not run the following command in the new terminal.

```bash
$ export RISCV=[path of toolchain A]
$ export PATH=${PATH}:[path of the executable of Vivado, typically /opt/Xilinx/Vivado/2018.3/bin]
$ export PATH=${PATH}:[[path of toolchain A]/bin

# You could adjust the "-jn" in this file to accelerate based on your machine.
# You can look inside this file for more details. The bitstream of the corresponding FGPA is generated in the new folder.
$ ./rebuild.sh 
```

### 4.2. Modify the ProMiSE hardware design

The security monitor is implemented inside RoCC of the RISC-V core, with most of the code inside `./rocket-chip/src/main/scala/tile/LazyRoCC.scala`.

# 5. Software Preparation (Offline Stage of the paper)

## 5.1 How to write monitor programs (step 2 of the paper)?

The first step is enter the folder `programs/inst-gen`, then refer to the paper and `genCoInst.py`. Then, write the monitor program into `inst.txt` (you can just follow other example programs). After that, run the python shell and you can get the hexadecimal value of the programs in file `inst_bin.txt`. Note this step has already merged in to the flow in Section 5.2.

Therefore, if the user wants to add some new monitor instructions or modify the old, (1) modify the `genCoInst.py` (2) modify`./rocketchip/src/main/scala/tile/LazyRoCC.scala` to support the new function.

## 5.2 How to instrument and compile programs (step 1 of the paper)?

### 5.2.1 Basic flow

**NOTE** : Firstly, ProMiSE supports to monitor the program with or without instrumentation. For instance, CFI does not require the instrumentation. For experiment, we simply instrument a function at the beggining of the program to initialize (1) monitor program to monitor hardware and (2) the CFG/DFG (stored as the security table, which will be automatically generated in the shell `build.sh`). In future, this part can be moved to operation system.

You can see all the details of the initialization in `dfi_inst.cc`.

**This part starts with `build.sh`, before using it, modifying the path in this file: `YOUR_PATH` and `SPEC_PATH`.** `YOUR_PATH` refers this repository's path and `SPEC_PATH` refers to the SPEC CPU 2006's path.

There are some ways to use `build.sh`:

```bash
$ ./build.sh [casename] [workname] -oriexit/-dfi/-cfi/-whlist/-sstack/-lwDIFT
```

Note the `-oriexit` means there will not be any security policy enabled. The options of the `casename` could be programs of the SPEC benchmark. After running this shell, the program execution files and `inst_bin.txt` will be automatically generated, and CFG/DFG (only use -cfi/-dfi) will be also generated.

If you want to instrument ripe and other security cases, you can run such as `build_ripe.sh`,`build_ripe.sh`,`build_ripe.sh`,`build_ripe.sh`,`build_ripe_riscv.sh`.

## 5.2.2 How to quickly get benchmark

You can direcly run the shell `programs/build_all_{option}`, the option can be `ori` `dfi` `cfi` `sstack` `whlist` `lwDIFT`. Then you can get all the benchmark execution files. (**NOTE:** `cfitable/dfi_rds_file` and `inst_bin.txt` needs the user manually handle, i.e. you need manually copy them to the right folder.)

# 6. How to simulate C programs?

Simulation only supports limited system call. For example, `mmap` is not supported in C programs. If you want to inspect the waveform, please install `gtkwave`.There are some steps to simulate:

1. Enter `rocket-chip/emulator`, export the environment variable in Section 4.1. Then:

```bash
make CONFIG=RoccExampleConfig -j4 
```

2. Enter `rocket-chip/emulator/tests`, make to obtain the program execution file.

3. Then execute to simulate the C execution file:       

```bash
./emulator-freechips.rocketchip.system-RoccExampleConfig +verbose ./tests/testatt.riscv  
```

4. To further watch the waveform (use `gtkwave` to watch `test,vcd`):

```bash
./emulator-freechips.rocketchip.system-RoccExampleConfig-debug +max-cycles=100000000 +verbose --vcd=test.vcd ./tests/test.riscv### 7.1. Software Preparation
```

**NOTE**  (1) If you get only java runtime errors when compiling the emulator make, check the Chisel code, and be sure to use all variables after they are defined! (2) The simulation of the C program, can not malloc too large a memory space such as a [1024 * 64], will cause inexplicable errors.

# 7. Hardware Implementation

Following to Section 4 to generate the bitstream, and download into the FPGA. After this, insert the SD card with Linux system into the FPGA board, and reboot the system. You should be able to see the system booting.

Following Section 5 to generated **(1) program execution files** + **(2) inst_bin.txt** + **(3) cfitable(for CFI)/dfi_rds_file (for DFI) + 4. rdebug/rdebug (used to read the debug information)**. Put the files such as binaries you want inside the Linux system’s root folders (following Section 3.3, if the file sizes are not large). Then, compile Linux system and load it inside an SD card.

If the files you want to run are large, please use another SD card to store them, and mount this SD card after the Linux system completes the boot (so you need to prepare two SD cards, one for linux system, the other for programs).

Everytime you execute the program, you can execute `rdebug` to read the debug information.
