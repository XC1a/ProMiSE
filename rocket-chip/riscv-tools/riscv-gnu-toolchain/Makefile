srcdir := /home/lf/hams/freedom/rocket-chip/riscv-tools/riscv-gnu-toolchain
builddir := /home/lf/hams/freedom/rocket-chip/riscv-tools/riscv-gnu-toolchain
INSTALL_DIR := /home/lf/hams/riscv-gnu-build-linux

# We need a relative source dir for the gcc configure, to make msys2 mingw64
# builds work.  Mayberelsrcdir is relative if a relative path was used to run
# configure, otherwise absolute, so we have to check.
mayberelsrcdir := .
gccsrcdir := $(shell case $(mayberelsrcdir) in \
		  ([\\/]* | ?:[\\/]*)  echo $(mayberelsrcdir)/riscv-gcc ;; \
		  (*)  echo ../$(mayberelsrcdir)/riscv-gcc ;; \
		esac)

PACKAGES :=

DISTDIR ?= /var/cache/distfiles
GNU_MIRROR := http://mirrors.kernel.org/gnu
gcc_url := $(GNU_MIRROR)/gcc/gcc-$(gcc_version)/gcc-$(gcc_version).tar.gz
glibc_url := $(GNU_MIRROR)/glibc/glibc-$(glibc_version).tar.gz
newlib_url := ftp://sourceware.org/pub/newlib/newlib-$(newlib_version).tar.gz

WITH_ARCH ?= --with-arch=rv64imafdc
WITH_ABI ?= --with-abi=lp64d
SYSROOT := $(INSTALL_DIR)/sysroot

SHELL := /bin/sh
AWK := /usr/bin/gawk
SED := /bin/sed
PATH := $(INSTALL_DIR)/bin:$(PATH)

# Check to see if we need wrapper scripts for awk/sed (which point to
# gawk/gsed on platforms where these aren't the default), otherwise
# don't override these as the wrappers don't always work.
ifneq (/bin/sed,/bin/sed)
	PATH := $(base_dir)/sed:$(PATH)
endif
ifneq (/usr/bin/gawk,/usr/bin/gawk)
	PATH := $(base_dir)/awk:$(PATH)
endif

export PATH AWK SED

MULTILIB_FLAGS := --disable-multilib
NEWLIB_MULTILIB_NAMES := rv64imafdc-lp64d
GLIBC_MULTILIB_NAMES := rv64imafdc-lp64d
GCC_CHECKING_FLAGS := --enable-checking=yes

XLEN := $(shell echo $(WITH_ARCH) | tr A-Z a-z | sed 's/.*rv\([0-9]*\).*/\1/')
ifneq ($(XLEN),32)
	XLEN := 64
endif

make_tuple = riscv$(1)-unknown-$(2)
LINUX_TUPLE  ?= $(call make_tuple,$(XLEN),linux-gnu)
NEWLIB_TUPLE ?= $(call make_tuple,$(XLEN),elf)

CFLAGS_FOR_TARGET := $(CFLAGS_FOR_TARGET_EXTRA) -mcmodel=medlow
ASFLAGS_FOR_TARGET := $(ASFLAGS_FOR_TARGET_EXTRA) -mcmodel=medlow
# --with-expat is required to enable XML support used by OpenOCD.
BINUTILS_GDB_TARGET_FLAGS := --with-expat=yes $(BINUTILS_GDB_TARGET_FLAGS_EXTRA)
BINUTILS_GDB_NATIVE_FLAGS := $(BINUTILS_GDB_NATIVE_FLAGS_EXTRA)
GLIBC_TARGET_FLAGS := $(GLIBC_TARGET_FLAGS_EXTRA)
GLIBC_CC_FOR_TARGET ?= $(LINUX_TUPLE)-gcc
GLIBC_CXX_FOR_TARGET ?= $(LINUX_TUPLE)-g++
GLIBC_TARGET_BOARDS ?= $(shell echo "$(GLIBC_MULTILIB_NAMES)" | sed 's!\([a-z0-9]*\)-\([a-z0-9]*\)!riscv-sim/-march=\1/-mabi=\2/-mcmodel=medlow!g')
NEWLIB_CC_FOR_TARGET ?= $(NEWLIB_TUPLE)-gcc
NEWLIB_CXX_FOR_TARGET ?= $(NEWLIB_TUPLE)-g++
NEWLIB_TARGET_BOARDS ?= $(shell echo "$(NEWLIB_MULTILIB_NAMES)" | sed 's!\([a-z0-9]*\)-\([a-z0-9]*\)!riscv-sim/-march=\1/-mabi=\2/-mcmodel=medlow!g')
NEWLIB_NANO_TARGET_BOARDS ?= $(shell echo "$(NEWLIB_MULTILIB_NAMES)" | sed 's!\([a-z0-9]*\)-\([a-z0-9]*\)!riscv-sim-nano/-march=\1/-mabi=\2/-mcmodel=medlow!g')

CONFIGURE_HOST   = 

all: newlib
newlib: stamps/build-gcc-newlib-stage2
linux: stamps/build-gcc-linux-stage2
linux-native: stamps/build-gcc-linux-native

.PHONY: build-binutils build-gcc1 build-libc build-gcc2 build-qemu
build-binutils: stamps/build-binutils-newlib
build-gcc%: stamps/build-gcc-newlib-stage%
ifeq (newlib,linux)
build-libc: $(patsubst %,stamps/build-glibc-linux-%,$(MULTLIB_NAMES))
else
build-libc: stamps/build-newlib stamps/build-newlib-nano \
	stamps/merge-newlib-nano
endif
build-qemu: stamps/build-qemu

REGRESSION_TEST_LIST = gcc

.PHONY: check
check: check-newlib
.PHONY: check-linux check-newlib
check-linux: $(patsubst %,check-%-linux,$(REGRESSION_TEST_LIST))
check-newlib: $(patsubst %,check-%-newlib,$(REGRESSION_TEST_LIST))
check-newlib-nano: $(patsubst %,check-%-newlib-nano,$(REGRESSION_TEST_LIST))
.PHONY: check-gcc check-gcc-linux check-gcc-newlib check-gcc-newlib-nano
check-gcc: check-gcc-newlib
check-gcc-linux: stamps/check-gcc-linux
check-gcc-newlib: stamps/check-gcc-newlib
check-gcc-newlib-nano: stamps/check-gcc-newlib-nano
.PHONY: check-dhrystone check-dhrystone-linux check-dhrystone-newlib
check-dhrystone: check-dhrystone-newlib
.PHONY: check-binutils check-binutils-linux check-binutils-newlib
check-binutils: check-binutils-newlib
check-binutils-linux: stamps/check-binutils-linux
check-binutils-newlib: stamps/check-binutils-newlib
check-binutils-newlib-nano: stamps/check-binutils-newlib-nano
.PHONY: check-gdb check-gdb-linux check-gdb-newlib
check-gdb: check-gdb-newlib
check-gdb-linux: stamps/check-gdb-linux
check-gdb-newlib: stamps/check-gdb-newlib
check-gdb-newlib-nano: stamps/check-gdb-newlib-nano

.PHONY: report
report: report-newlib
.PHONY: report-linux report-newlib report-newlib-nano
report-linux: $(patsubst %,report-%-linux,$(REGRESSION_TEST_LIST))
report-newlib: $(patsubst %,report-%-newlib,$(REGRESSION_TEST_LIST))
report-newlib-nano: $(patsubst %,report-%-newlib-nano,$(REGRESSION_TEST_LIST))
.PHONY: report-gcc
report-gcc: report-gcc-newlib
.PHONY: report-dhrystone
report-dhrystone: report-dhrystone-newlib
.PHONY: report-binutils
report-binutils: report-binutils-newlib
.PHONY: report-gdb
report-gdb: report-gdb-newlib

$(addprefix src/original-,$(PACKAGES)):
	mkdir -p src
	rm -rf $@ $(subst original-,,$@)-*
	cd src && (cat $(DISTDIR)/$(subst src/original-,,$@)-$($(subst src/original-,,$@)_version).tar.gz || /usr/bin/curl -L -o - --ftp-pasv --retry 10 $($(subst src/original-,,$@)_url)) | tar zxf -
	mv $(subst original-,,$@)-$($(subst src/original-,,$@)_version) $@

$(addprefix src/,$(PACKAGES)): src/%: src/original-%
	rm -rf $@ $@.tmp
	cp -a $< $@.tmp
	$(srcdir)/scripts/cp_s $(srcdir)/$(notdir $@) $@.tmp
	cd $@.tmp && patch -p1 < $(srcdir)/patches/$(notdir $@)
	if test -f $@.tmp/contrib/download_prerequisites && test "false" == "true"; then cd $@.tmp && ./contrib/download_prerequisites; fi
	mv $@.tmp $@

.PHONY: patches $(addprefix $(srcdir)/patches/,$(PACKAGES))
$(addprefix $(srcdir)/patches/,$(PACKAGES)): $(srcdir)/patches/%: src/%
	-cd src/$(notdir $@) && rm `cd $(srcdir)/$(notdir $@) && find . -type f`
	-cd src && diff --exclude=manual --exclude=autom4te.cache -rupN original-$(notdir $@) $(notdir $@) | filterdiff --remove-timestamps > $@
	$(srcdir)/scripts/cp_s $(srcdir)/$(notdir $@) $<

patches: $(addprefix $(srcdir)/patches/,$(PACKAGES))

stamps/build-binutils-linux: $(srcdir)/riscv-binutils-gdb
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
# CC_FOR_TARGET is required for the ld testsuite.
	cd $(notdir $@) && CC_FOR_TARGET=$(GLIBC_CC_FOR_TARGET) $</configure \
		--target=$(LINUX_TUPLE) \
		$(CONFIGURE_HOST) \
		--prefix=$(INSTALL_DIR) \
		--with-sysroot=$(SYSROOT) \
		$(MULTILIB_FLAGS) \
		 \
		--disable-werror \
		--disable-nls \
		$(BINUTILS_GDB_TARGET_FLAGS) \
		--enable-gdb
	$(MAKE) -C $(notdir $@)
	$(MAKE) -C $(notdir $@) install
	mkdir -p $(dir $@) && touch $@

stamps/build-linux-headers:
	mkdir -p $(SYSROOT)/usr/
	cp -a $(srcdir)/linux-headers/include $(SYSROOT)/usr/
	mkdir -p $(dir $@) && touch $@

stamps/build-glibc-linux-headers: $(srcdir)/riscv-glibc stamps/build-gcc-linux-stage1
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
	cd $(notdir $@) && CC="$(GLIBC_CC_FOR_TARGET)" $</configure \
		--host=$(LINUX_TUPLE) \
		--prefix=$(SYSROOT)/usr \
		--enable-shared \
		--with-headers=$(srcdir)/linux-headers/include \
		--disable-multilib \
		--enable-kernel=3.0.0
	$(MAKE) -C $(notdir $@) install-headers
	mkdir -p $(dir $@) && touch $@

stamps/build-glibc-linux-%: $(srcdir)/riscv-glibc stamps/build-gcc-linux-stage1
ifeq ($(MULTILIB_FLAGS),--enable-multilib)
	$(eval $@_ARCH := $(word 4,$(subst -, ,$@)))
	$(eval $@_ABI := $(word 5,$(subst -, ,$@)))
else
	$(eval $@_ARCH := )
	$(eval $@_ABI := )
endif
	$(eval $@_LIBDIRSUFFIX := $(if $($@_ABI),$(shell echo $($@_ARCH) | sed 's/.*rv\([0-9]*\).*/\1/')/$($@_ABI),))
	$(eval $@_XLEN := $(if $($@_ABI),$(shell echo $($@_ARCH) | sed 's/.*rv\([0-9]*\).*/\1/'),$(XLEN)))
	$(eval $@_CFLAGS := $(if $($@_ABI),-march=$($@_ARCH) -mabi=$($@_ABI),))
	$(eval $@_LIBDIROPTS := $(if $@_LIBDIRSUFFIX,--libdir=/usr/lib$($@_LIBDIRSUFFIX) libc_cv_slibdir=/lib$($@_LIBDIRSUFFIX) libc_cv_rtlddir=/lib,))
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
	cd $(notdir $@) && \
		CC="$(GLIBC_CC_FOR_TARGET) $($@_CFLAGS)" \
		CFLAGS="$(CFLAGS_FOR_TARGET) -g -O2 $($@_CFLAGS)" \
		ASFLAGS="$(ASFLAGS_FOR_TARGET) $($@_CFLAGS)" \
		$</configure \
		--host=$(call make_tuple,$($@_XLEN),linux-gnu) \
		--prefix=/usr \
		--disable-werror \
		--enable-shared \
		--enable-obsolete-rpc \
		--with-headers=$(srcdir)/linux-headers/include \
		$(MULTILIB_FLAGS) \
		--enable-kernel=3.0.0 \
		$(GLIBC_TARGET_FLAGS) \
		$($@_LIBDIROPTS)
	$(MAKE) -C $(notdir $@)
	+flock $(SYSROOT)/.lock $(MAKE) -C $(notdir $@) install install_root=$(SYSROOT)
	mkdir -p $(dir $@) && touch $@

stamps/build-gcc-linux-stage1: $(srcdir)/riscv-gcc stamps/build-binutils-linux \
                               stamps/build-linux-headers
	if test -f $</contrib/download_prerequisites && test "false" == "true"; then cd $< && ./contrib/download_prerequisites; fi
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
	cd $(notdir $@) && $</configure \
		--target=$(LINUX_TUPLE) \
		$(CONFIGURE_HOST) \
		--prefix=$(INSTALL_DIR) \
		--with-sysroot=$(SYSROOT) \
		--with-newlib \
		--without-headers \
		--disable-shared \
		--disable-threads \
		--with-system-zlib \
		--enable-tls \
		--enable-languages=c \
		--disable-libatomic \
		--disable-libmudflap \
		--disable-libssp \
		--disable-libquadmath \
		--disable-libgomp \
		--disable-nls \
		--disable-bootstrap \
		--src=$(gccsrcdir) \
		$(GCC_CHECKING_FLAGS) \
		$(MULTILIB_FLAGS) \
		$(WITH_ABI) \
		$(WITH_ARCH)
	$(MAKE) -C $(notdir $@) inhibit-libc=true all-gcc
	$(MAKE) -C $(notdir $@) inhibit-libc=true install-gcc
	$(MAKE) -C $(notdir $@) inhibit-libc=true all-target-libgcc
	$(MAKE) -C $(notdir $@) inhibit-libc=true install-target-libgcc
	mkdir -p $(dir $@) && touch $@

stamps/build-gcc-linux-stage2: $(srcdir)/riscv-gcc $(addprefix stamps/build-glibc-linux-,$(GLIBC_MULTILIB_NAMES)) \
                               stamps/build-glibc-linux-headers
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
	cd $(notdir $@) && $</configure \
		--target=$(LINUX_TUPLE) \
		$(CONFIGURE_HOST) \
		--prefix=$(INSTALL_DIR) \
		--with-sysroot=$(SYSROOT) \
		--with-system-zlib \
		--enable-shared \
		--enable-tls \
		--enable-languages=c,c++,fortran \
		--disable-libmudflap \
		--disable-libssp \
		--disable-libquadmath \
		--disable-nls \
		--disable-bootstrap \
		--src=$(gccsrcdir) \
		$(GCC_CHECKING_FLAGS) \
		$(MULTILIB_FLAGS) \
		$(WITH_ABI) \
		$(WITH_ARCH)
	$(MAKE) -C $(notdir $@)
	$(MAKE) -C $(notdir $@) install
	cp -a $(INSTALL_DIR)/$(LINUX_TUPLE)/lib* $(SYSROOT)
	mkdir -p $(dir $@) && touch $@

stamps/build-binutils-linux-native: $(srcdir)/riscv-binutils-gdb stamps/build-gcc-linux-stage2
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
	cd $(notdir $@) && $</configure \
		--host=$(LINUX_TUPLE) \
		--target=$(LINUX_TUPLE) \
		$(CONFIGURE_HOST) \
		--prefix=$(INSTALL_DIR)/native \
		$(MULTILIB_FLAGS) \
		 \
		--disable-werror \
		--disable-nls \
		$(BINUTILS_GDB_NATIVE_FLAGS) \
		--enable-gdb
	$(MAKE) -C $(notdir $@)
	$(MAKE) -C $(notdir $@) install
	mkdir -p $(dir $@) && touch $@

stamps/build-gcc-linux-native: $(srcdir)/riscv-gcc stamps/build-gcc-linux-stage2 stamps/build-binutils-linux-native
	if test -f $</contrib/download_prerequisites; then cd $< && ./contrib/download_prerequisites; fi
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
	cd $(notdir $@) && $</configure \
		--host=$(LINUX_TUPLE) \
		--target=$(LINUX_TUPLE) \
		$(CONFIGURE_HOST) \
		--prefix=$(INSTALL_DIR)/native \
		--without-system-zlib \
		--enable-shared \
		--enable-tls \
		--enable-languages=c,c++,fortran \
		--disable-libmudflap \
		--disable-libssp \
		--disable-libquadmath \
		--disable-nls \
		--disable-bootstrap \
                --with-native-system-header-dir=$(INSTALL_DIR)/native/include \
		$(GCC_CHECKING_FLAGS) \
		$(MULTILIB_FLAGS) \
		$(WITH_ABI) \
		$(WITH_ARCH)
	$(MAKE) -C $(notdir $@)
	$(MAKE) -C $(notdir $@) install
	cp -a $(INSTALL_DIR)/$(LINUX_TUPLE)/lib* $(SYSROOT)
	mkdir -p $(dir $@) && touch $@

stamps/build-binutils-newlib: $(srcdir)/riscv-binutils-gdb
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
# CC_FOR_TARGET is required for the ld testsuite.
	cd $(notdir $@) && CC_FOR_TARGET=$(NEWLIB_CC_FOR_TARGET) $</configure \
		--target=$(NEWLIB_TUPLE) \
		$(CONFIGURE_HOST) \
		--prefix=$(INSTALL_DIR) \
		 \
		--disable-werror \
		$(BINUTILS_GDB_TARGET_FLAGS) \
		--enable-gdb
	$(MAKE) -C $(notdir $@)
	$(MAKE) -C $(notdir $@) install
	mkdir -p $(dir $@) && touch $@

stamps/build-gcc-newlib-stage1: $(srcdir)/riscv-gcc stamps/build-binutils-newlib
	if test -f $</contrib/download_prerequisites && test "false" == "true"; then cd $< && ./contrib/download_prerequisites; fi
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
	cd $(notdir $@) && $</configure \
		--target=$(NEWLIB_TUPLE) \
		$(CONFIGURE_HOST) \
		--prefix=$(INSTALL_DIR) \
		--disable-shared \
		--disable-threads \
		--disable-tls \
		--enable-languages=c,c++ \
		--with-system-zlib \
		--with-newlib \
		--with-sysroot=$(INSTALL_DIR)/$(NEWLIB_TUPLE) \
		--disable-libmudflap \
		--disable-libssp \
		--disable-libquadmath \
		--disable-libgomp \
		--disable-nls \
		--src=$(gccsrcdir) \
		$(GCC_CHECKING_FLAGS) \
		$(MULTILIB_FLAGS) \
		$(WITH_ABI) \
		$(WITH_ARCH) \
		CFLAGS_FOR_TARGET="-Os $(CFLAGS_FOR_TARGET)"
	$(MAKE) -C $(notdir $@) all-gcc
	$(MAKE) -C $(notdir $@) install-gcc
	mkdir -p $(dir $@) && touch $@

stamps/build-newlib: $(srcdir)/riscv-newlib stamps/build-gcc-newlib-stage1
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
	cd $(notdir $@) && $</configure \
		--target=$(NEWLIB_TUPLE) \
		$(CONFIGURE_HOST) \
		--prefix=$(INSTALL_DIR) \
		--enable-newlib-io-long-double \
		--enable-newlib-io-long-long \
		--enable-newlib-io-c99-formats \
		CFLAGS_FOR_TARGET="-Os $(CFLAGS_FOR_TARGET)"
	$(MAKE) -C $(notdir $@)
	$(MAKE) -C $(notdir $@) install
	mkdir -p $(dir $@) && touch $@

stamps/build-newlib-nano: $(srcdir)/riscv-newlib stamps/build-gcc-newlib-stage1
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
	cd $(notdir $@) && $</configure \
		--target=$(NEWLIB_TUPLE) \
		$(CONFIGURE_HOST) \
		--prefix=$(builddir)/install-newlib-nano \
		--enable-newlib-reent-small \
		--disable-newlib-fvwrite-in-streamio \
		--disable-newlib-fseek-optimization \
		--disable-newlib-wide-orient \
		--enable-newlib-nano-malloc \
		--disable-newlib-unbuf-stream-opt \
		--enable-lite-exit \
		--enable-newlib-global-atexit \
		--enable-newlib-nano-formatted-io \
		--disable-newlib-supplied-syscalls \
		--disable-nls \
		--enable-newlib-register-fini \
		CFLAGS_FOR_TARGET="-Os -ffunction-sections -fdata-sections $(CFLAGS_FOR_TARGET)"
	$(MAKE) -C $(notdir $@)
	$(MAKE) -C $(notdir $@) install
	mkdir -p $(dir $@) && touch $@

stamps/merge-newlib-nano: stamps/build-newlib-nano stamps/build-newlib
# Copy nano library files into newlib install dir.
	set -e; \
        for ml in `$(INSTALL_DIR)/bin/$(NEWLIB_TUPLE)-gcc --print-multi-lib`; \
	do \
	    mld=`echo $${ml} | sed -e 's/;.*$$//'`; \
	    cp $(builddir)/install-newlib-nano/$(NEWLIB_TUPLE)/lib/$${mld}/libc.a \
		$(INSTALL_DIR)/$(NEWLIB_TUPLE)/lib/$${mld}/libc_nano.a; \
	    cp $(builddir)/install-newlib-nano/$(NEWLIB_TUPLE)/lib/$${mld}/libg.a \
		$(INSTALL_DIR)/$(NEWLIB_TUPLE)/lib/$${mld}/libg_nano.a; \
	    cp $(builddir)/install-newlib-nano/$(NEWLIB_TUPLE)/lib/$${mld}/libgloss.a\
		$(INSTALL_DIR)/$(NEWLIB_TUPLE)/lib/$${mld}/libgloss_nano.a; \
	done
# Copy nano header files into newlib install dir.
	mkdir -p $(INSTALL_DIR)/$(NEWLIB_TUPLE)/include/newlib-nano; \
	cp $(builddir)/install-newlib-nano/$(NEWLIB_TUPLE)/include/newlib.h \
		$(INSTALL_DIR)/$(NEWLIB_TUPLE)/include/newlib-nano/newlib.h; \
	mkdir -p $(dir $@) && touch $@

stamps/build-gcc-newlib-stage2: $(srcdir)/riscv-gcc stamps/build-newlib \
		stamps/merge-newlib-nano
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
	cd $(notdir $@) && $</configure \
		--target=$(NEWLIB_TUPLE) \
		$(CONFIGURE_HOST) \
		--prefix=$(INSTALL_DIR) \
		--disable-shared \
		--disable-threads \
		--enable-languages=c,c++ \
		--with-system-zlib \
		--enable-tls \
		--with-newlib \
		--with-sysroot=$(INSTALL_DIR)/$(NEWLIB_TUPLE) \
		--with-native-system-header-dir=/include \
		--disable-libmudflap \
		--disable-libssp \
		--disable-libquadmath \
		--disable-libgomp \
		--disable-nls \
		--src=$(gccsrcdir) \
		$(GCC_CHECKING_FLAGS) \
		$(MULTILIB_FLAGS) \
		$(WITH_ABI) \
		$(WITH_ARCH) \
		CFLAGS_FOR_TARGET="-Os $(CFLAGS_FOR_TARGET)"
	$(MAKE) -C $(notdir $@)
	$(MAKE) -C $(notdir $@) install
	mkdir -p $(dir $@) && touch $@

stamps/build-qemu: $(srcdir)/riscv-qemu
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
	cd $(notdir $@) && $</configure \
		--prefix=$(INSTALL_DIR) \
		--target-list=riscv64-linux-user,riscv32-linux-user \
		--interp-prefix=$(INSTALL_DIR)/sysroot \
		--python=python2
	$(MAKE) -C $(notdir $@)
	$(MAKE) -C $(notdir $@) install
	mkdir -p $(dir $@)
	date > $@

stamps/build-dejagnu: $(srcdir)/riscv-dejagnu
	rm -rf $@ $(notdir $@)
	mkdir $(notdir $@)
	cd $(notdir $@) && $</configure \
		--prefix=$(INSTALL_DIR)
	$(MAKE) -C $(notdir $@)
	$(MAKE) -C $(notdir $@) install
	mkdir -p $(dir $@)
	date > $@

stamps/check-gcc-newlib: stamps/build-gcc-newlib-stage2 stamps/build-qemu stamps/build-dejagnu
	PATH="$(srcdir)/scripts/wrapper/qemu:$(INSTALL_DIR)/bin:$(PATH)" RISC_V_SYSROOT="$(SYSROOT)" $(MAKE) -C build-gcc-newlib-stage2 check-gcc "RUNTESTFLAGS=--target_board='$(NEWLIB_TARGET_BOARDS)'"
	mkdir -p $(dir $@)
	date > $@

stamps/check-gcc-newlib-nano: stamps/build-gcc-newlib-stage2 stamps/build-qemu stamps/build-dejagnu
	PATH="$(srcdir)/scripts/wrapper/qemu:$(INSTALL_DIR)/bin:$(PATH)" RISC_V_SYSROOT="$(SYSROOT)" $(MAKE) -C build-gcc-newlib-stage2 check-gcc "RUNTESTFLAGS=--target_board='$(NEWLIB_NANO_TARGET_BOARDS)'"
	mkdir -p $(dir $@)
	date > $@

stamps/check-gcc-linux: stamps/build-gcc-linux-stage2 stamps/build-qemu stamps/build-dejagnu
	PATH="$(srcdir)/scripts/wrapper/qemu:$(INSTALL_DIR)/bin:$(PATH)" RISC_V_SYSROOT="$(SYSROOT)" $(MAKE) -C build-gcc-linux-stage2 check-gcc "RUNTESTFLAGS=--target_board='$(GLIBC_TARGET_BOARDS)'"
	mkdir -p $(dir $@)
	date > $@

.PHONY: check-dhrystone-newlib check-dhrystone-newlib-nano
check-dhrystone-newlib: $(patsubst %,stamps/check-dhrystone-newlib-%,$(NEWLIB_MULTILIB_NAMES))
check-dhrystone-newlib-nano: $(patsubst %,stamps/check-dhrystone-newlib-nano-%,$(NEWLIB_MULTILIB_NAMES))

stamps/check-dhrystone-newlib-%: \
		stamps/build-gcc-newlib-stage2 \
		stamps/build-qemu \
		$(wildcard $(srcdir)/test/benchmarks/dhrystone/*)
	$(eval $@_ARCH := $(word 4,$(subst -, ,$@)))
	$(eval $@_ABI := $(word 5,$(subst -, ,$@)))
	$(eval $@_XLEN := $(patsubst rv32%,32,$(patsubst rv64%,64,$($@_ARCH))))
	PATH="$(srcdir)/scripts/wrapper/qemu:$(INSTALL_DIR)/bin:$(PATH)" RISC_V_SYSROOT="$(SYSROOT)" $(srcdir)/test/benchmarks/dhrystone/check -march=$($@_ARCH) -mabi=$($@_ABI) -cc=riscv$(XLEN)-unknown-elf-gcc -objdump=riscv$(XLEN)-unknown-elf-objdump -sim=riscv$($@_XLEN)-unknown-elf-run -out=$@ $(filter %.c,$^) || true

stamps/check-dhrystone-newlib-nano-%: \
		stamps/build-gcc-newlib-stage2 \
		stamps/build-qemu \
		$(wildcard $(srcdir)/test/benchmarks/dhrystone/*)
	$(eval $@_ARCH := $(word 5,$(subst -, ,$@)))
	$(eval $@_ABI := $(word 6,$(subst -, ,$@)))
	$(eval $@_XLEN := $(patsubst rv32%,32,$(patsubst rv64%,64,$($@_ARCH))))
	PATH="$(srcdir)/scripts/wrapper/qemu:$(INSTALL_DIR)/bin:$(PATH)" RISC_V_SYSROOT="$(SYSROOT)" $(srcdir)/test/benchmarks/dhrystone/check -march=$($@_ARCH) -mabi=$($@_ABI) -specs=nano.specs -cc=riscv$(XLEN)-unknown-elf-gcc -objdump=riscv$(XLEN)-unknown-elf-objdump -sim=riscv$($@_XLEN)-unknown-elf-run -out=$@ $(filter %.c,$^) || true

.PHONY: check-dhrystone-linux
check-dhrystone-linux: $(patsubst %,stamps/check-dhrystone-linux-%,$(GLIBC_MULTILIB_NAMES))

stamps/check-dhrystone-linux-%: \
		stamps/build-gcc-linux-stage2 \
		stamps/build-qemu \
		$(wildcard $(srcdir)/test/benchmarks/dhrystone/*)
	$(eval $@_ARCH := $(word 4,$(subst -, ,$@)))
	$(eval $@_ABI := $(word 5,$(subst -, ,$@)))
	$(eval $@_XLEN := $(patsubst rv32%,32,$(patsubst rv64%,64,$($@_ARCH))))
	PATH="$(srcdir)/scripts/wrapper/qemu:$(INSTALL_DIR)/bin:$(PATH)" RISC_V_SYSROOT="$(SYSROOT)" $(srcdir)/test/benchmarks/dhrystone/check -march=$($@_ARCH) -mabi=$($@_ABI) -cc=riscv$(XLEN)-unknown-elf-gcc -objdump=riscv$(XLEN)-unknown-elf-objdump -sim=riscv$($@_XLEN)-unknown-elf-run -out=$@ $(filter %.c,$^) || true

stamps/check-binutils-newlib: stamps/build-gcc-newlib-stage2 stamps/build-qemu
	PATH="$(srcdir)/scripts/wrapper/qemu:$(INSTALL_DIR)/bin:$(PATH)" RISC_V_SYSROOT="$(SYSROOT)" $(MAKE) -C build-binutils-newlib check-{binutils,gas,ld} -k "RUNTESTFLAGS=--target_board='$(NEWLIB_TARGET_BOARDS)'" || true
	date > $@

stamps/check-binutils-newlib-nano: stamps/build-gcc-newlib-stage2 stamps/build-qemu
	PATH="$(srcdir)/scripts/wrapper/qemu:$(INSTALL_DIR)/bin:$(PATH)" RISC_V_SYSROOT="$(SYSROOT)" $(MAKE) -C build-binutils-newlib check-{binutils,gas,ld} -k "RUNTESTFLAGS=--target_board='$(NEWLIB_NANO_TARGET_BOARDS)'" || true
	date > $@

stamps/check-binutils-linux: stamps/build-gcc-linux-stage2 stamps/build-qemu
	PATH="$(srcdir)/scripts/wrapper/qemu:$(INSTALL_DIR)/bin:$(PATH)" RISC_V_SYSROOT="$(SYSROOT)" $(MAKE) -C build-binutils-linux check-{binutils,gas,ld} -k "RUNTESTFLAGS=--target_board='$(GLIBC_TARGET_BOARDS)'" || true
	date > $@

stamps/check-gdb-newlib: stamps/build-gcc-newlib-stage2 stamps/build-qemu
	PATH="$(srcdir)/scripts/wrapper/qemu:$(INSTALL_DIR)/bin:$(PATH)" RISC_V_SYSROOT="$(SYSROOT)" $(MAKE) -C build-binutils-newlib check-gdb -k "RUNTESTFLAGS=--target_board='$(NEWLIB_TARGET_BOARDS)'" || true
	date > $@

stamps/check-gdb-newlib-nano: stamps/build-gcc-newlib-stage2 stamps/build-qemu
	PATH="$(srcdir)/scripts/wrapper/qemu:$(INSTALL_DIR)/bin:$(PATH)" RISC_V_SYSROOT="$(SYSROOT)" $(MAKE) -C build-binutils-newlib check-gdb -k "RUNTESTFLAGS=--target_board='$(NEWLIB_NANO_TARGET_BOARDS)'" || true
	date > $@

stamps/check-gdb-linux: stamps/build-gcc-linux-stage2 stamps/build-qemu
	PATH="$(srcdir)/scripts/wrapper/qemu:$(INSTALL_DIR)/bin:$(PATH)" RISC_V_SYSROOT="$(SYSROOT)" $(MAKE) -C build-binutils-linux check-gdb -k "RUNTESTFLAGS=--target_board='$(GLIBC_TARGET_BOARDS)'" || true
	date > $@

.PHONY: report-gcc-newlib report-gcc-newlib-nano
report-gcc-newlib: stamps/check-gcc-newlib
	stat $(patsubst %,$(srcdir)/test/gcc-newlib/%.log,$(NEWLIB_MULTILIB_NAMES)) || exit 1
	if find build-gcc-newlib-stage2/gcc/testsuite/ -iname '*.sum' | xargs grep ^FAIL | sort | grep -F -v $(patsubst %,--file=$(srcdir)/test/gcc-newlib/%.log,$(NEWLIB_MULTILIB_NAMES)); then false; else true; fi
	if [[ "$$(find build-gcc-newlib-stage2/gcc/testsuite/ -iname '*.sum' | xargs cat | wc -l)" -lt 100 ]]; then false; else true; fi

report-gcc-newlib-nano: stamps/check-gcc-newlib-nano
	stat $(patsubst %,$(srcdir)/test/gcc-newlib/%.log,$(NEWLIB_MULTILIB_NAMES)) || exit 1
	if find build-gcc-newlib-stage2/gcc/testsuite/ -iname '*.sum' | xargs grep ^FAIL | sort | grep -F -v $(patsubst %,--file=$(srcdir)/test/gcc-newlib/%.log,$(NEWLIB_MULTILIB_NAMES)); then false; else true; fi
	if [[ "$$(find build-gcc-newlib-stage2/gcc/testsuite/ -iname '*.sum' | xargs cat | wc -l)" -lt 100 ]]; then false; else true; fi

.PHONY: report-gcc-linux
report-gcc-linux: stamps/check-gcc-linux
	stat $(patsubst %,$(srcdir)/test/gcc-linux/%.log,$(GLIBC_MULTILIB_NAMES)) || exit 1
	if find build-gcc-linux-stage2/gcc/testsuite/ -iname '*.sum' | xargs grep ^FAIL | sort | grep -F -v $(patsubst %,--file=$(srcdir)/test/gcc-linux/%.log,$(GLIBC_MULTILIB_NAMES)); then false; else true; fi
	if [[ "$$(find build-gcc-linux-stage2/gcc/testsuite/ -iname '*.sum' | xargs cat | wc -l)" -lt 100 ]]; then false; else true; fi

.PHONY: report-dhrystone-newlib report-dhrystone-newlib-nano
report-dhrystone-newlib: $(patsubst %,stamps/check-dhrystone-newlib-%,$(NEWLIB_MULTILIB_NAMES))
	if cat $^ | grep -v '^PASS'; then false; else true; fi
report-dhrystone-newlib-nano: $(patsubst %,stamps/check-dhrystone-newlib-nano-%,$(NEWLIB_MULTILIB_NAMES))
	if cat $^ | grep -v '^PASS'; then false; else true; fi

.PHONY: report-dhrystone-linux
report-dhrystone-linux: $(patsubst %,stamps/check-dhrystone-linux-%,$(GLIBC_MULTILIB_NAMES))
	if cat $^ | grep -v '^PASS'; then false; else true; fi

.PHONY: report-binutils-newlib report-binutils-newlib-nano
report-binutils-newlib: stamps/check-binutils-newlib
	stat $(patsubst %,$(srcdir)/test/binutils-newlib/%.log,$(NEWLIB_MULTILIB_NAMES)) || exit 1
	if find build-binutils-newlib -iname '*.sum' | xargs grep ^FAIL | sort | grep -F -v $(patsubst %,--file=$(srcdir)/test/binutils-newlib/%.log,$(NEWLIB_MULTILIB_NAMES)); then false; else true; fi

report-binutils-newlib-nano: stamps/check-binutils-newlib-nano
	stat $(patsubst %,$(srcdir)/test/binutils-newlib/%.log,$(NEWLIB_MULTILIB_NAMES)) || exit 1
	if find build-binutils-newlib -iname '*.sum' | xargs grep ^FAIL | sort | grep -F -v $(patsubst %,--file=$(srcdir)/test/binutils-newlib/%.log,$(NEWLIB_MULTILIB_NAMES)); then false; else true; fi

.PHONY: report-binutils-linux
report-binutils-linux: stamps/check-binutils-linux
	stat $(patsubst %,$(srcdir)/test/binutils-linux/%.log,$(GLIBC_MULTILIB_NAMES)) || exit 1
	if find build-binutils-linux -iname '*.sum' | xargs grep ^FAIL | sort | grep -F -v $(patsubst %,--file=$(srcdir)/test/binutils-linux/%.log,$(GLIBC_MULTILIB_NAMES)); then false; else true; fi

clean:
	rm -rf build-* $(addprefix src/,$(PACKAGES)) stamps install-newlib-nano

.PHONY: report-gdb-newlib report-gdb-newlib-nano
report-gdb-newlib: stamps/check-gdb-newlib
	stat $(patsubst %,$(srcdir)/test/gdb-newlib/%.log,$(NEWLIB_MULTILIB_NAMES)) || exit 1
	if find build-binutils-newlib -iname '*.sum' | xargs grep ^FAIL | sort | grep -F -v $(patsubst %,--file=$(srcdir)/test/gdb-newlib/%.log,$(NEWLIB_MULTILIB_NAMES)); then false; else true; fi

report-gdb-newlib-nano: stamps/check-gdb-newlib-nano
	stat $(patsubst %,$(srcdir)/test/gdb-newlib/%.log,$(NEWLIB_MULTILIB_NAMES)) || exit 1
	if find build-binutils-newlib -iname '*.sum' | xargs grep ^FAIL | sort | grep -F -v $(patsubst %,--file=$(srcdir)/test/gdb-newlib/%.log,$(NEWLIB_MULTILIB_NAMES)); then false; else true; fi

.PHONY: report-gdb-linux
report-gdb-linux: stamps/check-gdb-linux
	stat $(patsubst %,$(srcdir)/test/gdb-linux/%.log,$(GLIBC_MULTILIB_NAMES)) || exit 1
	if find build-binutils-linux -iname '*.sum' | xargs grep ^FAIL | sort | grep -F -v $(patsubst %,--file=$(srcdir)/test/gdb-linux/%.log,$(GLIBC_MULTILIB_NAMES)); then false; else true; fi

distclean: clean
	rm -rf src

# All of the packages install themselves, so our install target does nothing.
install:

# Rebuilding Makefile.
Makefile: $(srcdir)/Makefile.in config.status
	CONFIG_FILES=$@ CONFIG_HEADERS= $(SHELL) ./config.status
