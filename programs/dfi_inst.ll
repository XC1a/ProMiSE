; ModuleID = 'dfi_inst.bc'
source_filename = "/home/lf/hams/freedom/programs/dfi_inst.cc"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.cpu_set_t = type { [16 x i64] }
%union.pthread_attr_t = type { i64, [48 x i8] }

$_ZSt3hexRSt8ios_base = comdat any

$_ZSt3decRSt8ios_base = comdat any

$_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_ = comdat any

$_ZStaNRSt13_Ios_FmtflagsS_ = comdat any

$_ZStcoSt13_Ios_Fmtflags = comdat any

$_ZStoRRSt13_Ios_FmtflagsS_ = comdat any

$_ZStanSt13_Ios_FmtflagsS_ = comdat any

$_ZStorSt13_Ios_FmtflagsS_ = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@dfi_reg = dso_local global i8** null, align 8
@dfi_reg_s = dso_local global i16* null, align 8
@dfi_reg_t = dso_local global i32* null, align 8
@dfi_reg_0 = dso_local global i32* null, align 8
@dfi_reg_1 = dso_local global i32* null, align 8
@dfi_reg_2 = dso_local global i32* null, align 8
@dfi_reg_3 = dso_local global i32* null, align 8
@dfi_reg_4 = dso_local global i32* null, align 8
@dfi_reg_5 = dso_local global i32* null, align 8
@dfi_reg_6 = dso_local global i32* null, align 8
@dfi_reg_7 = dso_local global i32* null, align 8
@dfi_p = dso_local global i32* null, align 8
@dfi_start = dso_local global i32 0, align 4
@dfi_vio = dso_local global i32 0, align 4
@dfi_reg_signal = dso_local global i32 0, align 4
@vmem = dso_local global i8* null, align 8
@dfi_user_start = dso_local global i32 0, align 4
@dfi_thread_id = dso_local global i64 0, align 8
@dfi_2core_round = dso_local global i32 0, align 4
@dfi_2core_pointer = dso_local global i32 0, align 4
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [13 x i8] c"init regions\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"/dev/mem\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"cannot open /dev/mem\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"cannot map physical address\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"regions init done\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"dfi_rds_file\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.7 = private unnamed_addr constant [42 x i8] c"Cannot open reachine definition set file\0A\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"rds load done, total \00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c" bytes\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"max call count \00", align 1
@.str.11 = private unnamed_addr constant [25 x i8] c"pointers indication done\00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"reg rdt vaddr \00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c" to \00", align 1
@.str.14 = private unnamed_addr constant [15 x i8] c"reg rds vaddr \00", align 1
@.str.15 = private unnamed_addr constant [20 x i8] c"debug buffer vaddr \00", align 1
@.str.16 = private unnamed_addr constant [13 x i8] c"init dfi end\00", align 1
@.str.17 = private unnamed_addr constant [13 x i8] c"set cpu to 1\00", align 1
@.str.18 = private unnamed_addr constant [17 x i8] c"set cpu to 1 end\00", align 1
@.str.19 = private unnamed_addr constant [13 x i8] c"set cpu to 0\00", align 1
@.str.20 = private unnamed_addr constant [15 x i8] c"Create Thread\0A\00", align 1
@.str.21 = private unnamed_addr constant [18 x i8] c"reg signal vaddr \00", align 1
@.str.22 = private unnamed_addr constant [13 x i8] c"reg 0 vaddr \00", align 1
@.str.23 = private unnamed_addr constant [23 x i8] c"reg func signal vaddr \00", align 1
@.str.24 = private unnamed_addr constant [4 x i8] c"%x\0A\00", align 1
@.str.25 = private unnamed_addr constant [19 x i8] c"init 2core dfi end\00", align 1
@.str.26 = private unnamed_addr constant [14 x i8] c"init soft dfi\00", align 1
@.str.27 = private unnamed_addr constant [33 x i8] c"init ready to allocate registers\00", align 1
@.str.28 = private unnamed_addr constant [25 x i8] c"DEBUG: rocc debug begin\0A\00", align 1
@.str.29 = private unnamed_addr constant [9 x i8] c"-------\0A\00", align 1
@.str.30 = private unnamed_addr constant [12 x i8] c"%lx -> %lx\0A\00", align 1
@.str.31 = private unnamed_addr constant [15 x i8] c"DFI DEBUG INFO\00", align 1
@.str.32 = private unnamed_addr constant [15 x i8] c"trace---------\00", align 1
@.str.33 = private unnamed_addr constant [3 x i8] c"t \00", align 1
@.str.34 = private unnamed_addr constant [3 x i8] c": \00", align 1
@.str.35 = private unnamed_addr constant [3 x i8] c"c \00", align 1
@.str.36 = private unnamed_addr constant [7 x i8] c" read \00", align 1
@.str.37 = private unnamed_addr constant [8 x i8] c" write \00", align 1
@.str.38 = private unnamed_addr constant [5 x i8] c"id: \00", align 1
@.str.39 = private unnamed_addr constant [8 x i8] c" addr: \00", align 1
@.str.40 = private unnamed_addr constant [14 x i8] c" last write: \00", align 1
@.str.41 = private unnamed_addr constant [3 x i8] c"n \00", align 1
@.str.42 = private unnamed_addr constant [3 x i8] c"l \00", align 1
@.str.43 = private unnamed_addr constant [13 x i8] c" read addr: \00", align 1
@.str.44 = private unnamed_addr constant [14 x i8] c" write addr: \00", align 1
@.str.45 = private unnamed_addr constant [10 x i8] c" length: \00", align 1
@.str.46 = private unnamed_addr constant [13 x i8] c"rds---------\00", align 1
@.str.47 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.48 = private unnamed_addr constant [15 x i8] c"reg 4---------\00", align 1
@.str.49 = private unnamed_addr constant [22 x i8] c"rocc: now processing \00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_dfi_inst.cc, i8* null }]

; Function Attrs: noinline
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline nounwind optnone
define dso_local void @_Z15dfi_func_signalv() #4 {
  %1 = load i32*, i32** @dfi_reg_3, align 8
  %2 = getelementptr inbounds i32, i32* %1, i64 2
  store i32 22332233, i32* %2, align 4
  ret void
}

; Function Attrs: noinline optnone
define dso_local void @_Z18init_roccinstr_dfiv() #5 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0))
  %7 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %6, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %8 = call signext i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 signext 1052674)
  store i32 %8, i32* %1, align 4
  %9 = load i32, i32* %1, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %14

; <label>:11:                                     ; preds = %0
  %12 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i32 0, i32 0))
  %13 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %12, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  call void @exit(i32 signext 0) #10
  unreachable

; <label>:14:                                     ; preds = %0
  %15 = load i32, i32* %1, align 4
  %16 = call i8* @mmap(i8* null, i64 100663296, i32 signext 3, i32 signext 1, i32 signext %15, i64 4094181376) #3
  store i8* %16, i8** @vmem, align 8
  %17 = load i8*, i8** @vmem, align 8
  %18 = icmp eq i8* %17, null
  br i1 %18, label %19, label %22

; <label>:19:                                     ; preds = %14
  %20 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0))
  %21 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %20, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  call void @exit(i32 signext 0) #10
  unreachable

; <label>:22:                                     ; preds = %14
  %23 = call noalias i8* @malloc(i64 64) #3
  %24 = bitcast i8* %23 to i8**
  store i8** %24, i8*** @dfi_reg, align 8
  %25 = load i8*, i8** @vmem, align 8
  %26 = load i8**, i8*** @dfi_reg, align 8
  %27 = getelementptr inbounds i8*, i8** %26, i64 0
  store i8* %25, i8** %27, align 8
  %28 = load i8*, i8** @vmem, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 4194304
  %30 = load i8**, i8*** @dfi_reg, align 8
  %31 = getelementptr inbounds i8*, i8** %30, i64 1
  store i8* %29, i8** %31, align 8
  %32 = load i8*, i8** @vmem, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 71303168
  %34 = load i8**, i8*** @dfi_reg, align 8
  %35 = getelementptr inbounds i8*, i8** %34, i64 2
  store i8* %33, i8** %35, align 8
  %36 = load i8**, i8*** @dfi_reg, align 8
  %37 = getelementptr inbounds i8*, i8** %36, i64 0
  %38 = load i8*, i8** %37, align 8
  %39 = bitcast i8* %38 to i32*
  store i32* %39, i32** @dfi_reg_0, align 8
  %40 = load i8**, i8*** @dfi_reg, align 8
  %41 = getelementptr inbounds i8*, i8** %40, i64 1
  %42 = load i8*, i8** %41, align 8
  %43 = bitcast i8* %42 to i32*
  store i32* %43, i32** @dfi_reg_1, align 8
  %44 = load i8**, i8*** @dfi_reg, align 8
  %45 = getelementptr inbounds i8*, i8** %44, i64 2
  %46 = load i8*, i8** %45, align 8
  %47 = bitcast i8* %46 to i32*
  store i32* %47, i32** @dfi_reg_2, align 8
  %48 = load i8**, i8*** @dfi_reg, align 8
  %49 = getelementptr inbounds i8*, i8** %48, i64 3
  %50 = load i8*, i8** %49, align 8
  %51 = bitcast i8* %50 to i32*
  store i32* %51, i32** @dfi_reg_3, align 8
  %52 = load i8**, i8*** @dfi_reg, align 8
  %53 = getelementptr inbounds i8*, i8** %52, i64 4
  %54 = load i8*, i8** %53, align 8
  %55 = bitcast i8* %54 to i32*
  store i32* %55, i32** @dfi_reg_4, align 8
  %56 = load i8**, i8*** @dfi_reg, align 8
  %57 = getelementptr inbounds i8*, i8** %56, i64 1
  %58 = load i8*, i8** %57, align 8
  %59 = bitcast i8* %58 to i16*
  store i16* %59, i16** @dfi_reg_s, align 8
  %60 = load i8*, i8** @vmem, align 8
  call void @llvm.memset.p0i8.i64(i8* align 1 %60, i8 0, i64 100663296, i1 false)
  %61 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %62 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %61, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i32 0, i32 0))
  %63 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %62, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %64 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  store %struct._IO_FILE* %64, %struct._IO_FILE** %3, align 8
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %66 = icmp eq %struct._IO_FILE* %65, null
  br i1 %66, label %67, label %69

; <label>:67:                                     ; preds = %22
  %68 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 signext 0) #10
  unreachable

; <label>:69:                                     ; preds = %22
  store i32 0, i32* %2, align 4
  store i32 0, i32* %5, align 4
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %71 = call signext i32 @fgetc(%struct._IO_FILE* %70)
  %72 = trunc i32 %71 to i8
  store i8 %72, i8* %4, align 1
  br label %73

; <label>:73:                                     ; preds = %76, %69
  %74 = load i32, i32* %2, align 4
  %75 = icmp slt i32 %74, 4
  br i1 %75, label %76, label %89

; <label>:76:                                     ; preds = %73
  %77 = load i8, i8* %4, align 1
  %78 = load i8**, i8*** @dfi_reg, align 8
  %79 = getelementptr inbounds i8*, i8** %78, i64 2
  %80 = load i8*, i8** %79, align 8
  %81 = load i32, i32* %2, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, i8* %80, i64 %82
  store i8 %77, i8* %83, align 1
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %85 = call signext i32 @fgetc(%struct._IO_FILE* %84)
  %86 = trunc i32 %85 to i8
  store i8 %86, i8* %4, align 1
  %87 = load i32, i32* %2, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %2, align 4
  br label %73

; <label>:89:                                     ; preds = %73
  %90 = load i8**, i8*** @dfi_reg, align 8
  %91 = getelementptr inbounds i8*, i8** %90, i64 2
  %92 = load i8*, i8** %91, align 8
  %93 = bitcast i8* %92 to i32*
  %94 = getelementptr inbounds i32, i32* %93, i64 0
  %95 = load i32, i32* %94, align 4
  store i32 %95, i32* %5, align 4
  %96 = load i32, i32* %5, align 4
  %97 = mul i32 2, %96
  store i32 %97, i32* %5, align 4
  br label %98

; <label>:98:                                     ; preds = %102, %89
  %99 = load i32, i32* %2, align 4
  %100 = load i32, i32* %5, align 4
  %101 = icmp ult i32 %99, %100
  br i1 %101, label %102, label %115

; <label>:102:                                    ; preds = %98
  %103 = load i8, i8* %4, align 1
  %104 = load i8**, i8*** @dfi_reg, align 8
  %105 = getelementptr inbounds i8*, i8** %104, i64 2
  %106 = load i8*, i8** %105, align 8
  %107 = load i32, i32* %2, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i8, i8* %106, i64 %108
  store i8 %103, i8* %109, align 1
  %110 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %111 = call signext i32 @fgetc(%struct._IO_FILE* %110)
  %112 = trunc i32 %111 to i8
  store i8 %112, i8* %4, align 1
  %113 = load i32, i32* %2, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %2, align 4
  br label %98

; <label>:115:                                    ; preds = %98
  %116 = load i8**, i8*** @dfi_reg, align 8
  %117 = getelementptr inbounds i8*, i8** %116, i64 2
  %118 = load i8*, i8** %117, align 8
  %119 = bitcast i8* %118 to i32*
  %120 = load i32, i32* %2, align 4
  %121 = sdiv i32 %120, 4
  %122 = sub nsw i32 %121, 1
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32* %119, i64 %123
  %125 = load i32, i32* %124, align 4
  %126 = mul i32 2, %125
  store i32 %126, i32* %5, align 4
  br label %127

; <label>:127:                                    ; preds = %131, %115
  %128 = load i32, i32* %2, align 4
  %129 = load i32, i32* %5, align 4
  %130 = icmp ult i32 %128, %129
  br i1 %130, label %131, label %144

; <label>:131:                                    ; preds = %127
  %132 = load i8, i8* %4, align 1
  %133 = load i8**, i8*** @dfi_reg, align 8
  %134 = getelementptr inbounds i8*, i8** %133, i64 2
  %135 = load i8*, i8** %134, align 8
  %136 = load i32, i32* %2, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i8, i8* %135, i64 %137
  store i8 %132, i8* %138, align 1
  %139 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %140 = call signext i32 @fgetc(%struct._IO_FILE* %139)
  %141 = trunc i32 %140 to i8
  store i8 %141, i8* %4, align 1
  %142 = load i32, i32* %2, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %2, align 4
  br label %127

; <label>:144:                                    ; preds = %127
  %145 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %146 = call signext i32 @fclose(%struct._IO_FILE* %145)
  %147 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %148 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %147, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.8, i32 0, i32 0))
  %149 = load i32, i32* %2, align 4
  %150 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %148, i32 signext %149)
  %151 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %150, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0))
  %152 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %151, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %153 = load i32*, i32** @dfi_reg_1, align 8
  %154 = getelementptr inbounds i32, i32* %153, i64 0
  store i32 12345678, i32* %154, align 4
  call void asm sideeffect ".word 0x4000000b", ""() #3, !srcloc !2
  %155 = load i32*, i32** @dfi_reg_2, align 8
  %156 = getelementptr inbounds i32, i32* %155, i64 0
  store i32 23456789, i32* %156, align 4
  call void asm sideeffect ".word 0x8000000b", ""() #3, !srcloc !3
  %157 = load i32*, i32** @dfi_reg_0, align 8
  %158 = bitcast i32* %157 to i64*
  %159 = getelementptr inbounds i64, i64* %158, i64 0
  store i64 -1, i64* %159, align 8
  store i32 0, i32* %2, align 4
  br label %160

; <label>:160:                                    ; preds = %164, %144
  %161 = load i32, i32* %2, align 4
  %162 = icmp slt i32 %161, 100000
  br i1 %162, label %163, label %167

; <label>:163:                                    ; preds = %160
  br label %164

; <label>:164:                                    ; preds = %163
  %165 = load i32, i32* %2, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %2, align 4
  br label %160

; <label>:167:                                    ; preds = %160
  call void asm sideeffect ".word 0xc000000b", ""() #3, !srcloc !4
  %168 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %169 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %168, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.10, i32 0, i32 0))
  %170 = load i32*, i32** @dfi_reg_0, align 8
  %171 = bitcast i32* %170 to i64*
  %172 = getelementptr inbounds i64, i64* %171, i64 0
  %173 = load i64, i64* %172, align 8
  %174 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %169, i64 %173)
  %175 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %174, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %176 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %177 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %176, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11, i32 0, i32 0))
  %178 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %177, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %179 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %180 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %179, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i32 0, i32 0))
  %181 = load i32*, i32** @dfi_reg_1, align 8
  %182 = ptrtoint i32* %181 to i64
  %183 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %180, i64 %182)
  %184 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %183, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0))
  %185 = load i8**, i8*** @dfi_reg, align 8
  %186 = getelementptr inbounds i8*, i8** %185, i64 1
  %187 = load i8*, i8** %186, align 8
  %188 = getelementptr inbounds i8, i8* %187, i64 67108863
  %189 = ptrtoint i8* %188 to i64
  %190 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %184, i64 %189)
  %191 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %190, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %192 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %193 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %192, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.14, i32 0, i32 0))
  %194 = load i32*, i32** @dfi_reg_2, align 8
  %195 = ptrtoint i32* %194 to i64
  %196 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %193, i64 %195)
  %197 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %196, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0))
  %198 = load i8**, i8*** @dfi_reg, align 8
  %199 = getelementptr inbounds i8*, i8** %198, i64 2
  %200 = load i8*, i8** %199, align 8
  %201 = getelementptr inbounds i8, i8* %200, i64 16777215
  %202 = ptrtoint i8* %201 to i64
  %203 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %197, i64 %202)
  %204 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %203, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %205 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %206 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %205, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.15, i32 0, i32 0))
  %207 = load i32*, i32** @dfi_reg_0, align 8
  %208 = ptrtoint i32* %207 to i64
  %209 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %206, i64 %208)
  %210 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %209, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0))
  %211 = load i8**, i8*** @dfi_reg, align 8
  %212 = getelementptr inbounds i8*, i8** %211, i64 0
  %213 = load i8*, i8** %212, align 8
  %214 = getelementptr inbounds i8, i8* %213, i64 4194303
  %215 = ptrtoint i8* %214 to i64
  %216 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %210, i64 %215)
  %217 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %216, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %218 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.16, i32 0, i32 0))
  %219 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %218, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  ret void
}

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #1

declare dso_local signext i32 @open(i8*, i32 signext, ...) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 signext) #6

; Function Attrs: nounwind
declare dso_local i8* @mmap(i8*, i64, i32 signext, i32 signext, i32 signext, i64) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #7

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"*, %"class.std::ios_base"* (%"class.std::ios_base"*)*) #1

; Function Attrs: noinline optnone
define linkonce_odr dso_local dereferenceable(216) %"class.std::ios_base"* @_ZSt3hexRSt8ios_base(%"class.std::ios_base"* dereferenceable(216)) #5 comdat {
  %2 = alloca %"class.std::ios_base"*, align 8
  store %"class.std::ios_base"* %0, %"class.std::ios_base"** %2, align 8
  %3 = load %"class.std::ios_base"*, %"class.std::ios_base"** %2, align 8
  %4 = call signext i32 @_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_(%"class.std::ios_base"* %3, i32 signext 8, i32 signext 74)
  %5 = load %"class.std::ios_base"*, %"class.std::ios_base"** %2, align 8
  ret %"class.std::ios_base"* %5
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #1

declare dso_local signext i32 @printf(i8*, ...) #1

declare dso_local signext i32 @fgetc(%struct._IO_FILE*) #1

declare dso_local signext i32 @fclose(%struct._IO_FILE*) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32 signext) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"*, i64) #1

; Function Attrs: noinline optnone
define dso_local void @_Z21init_noinstrument_dfiv() #5 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0))
  %6 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %5, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %7 = call noalias i8* @malloc(i64 64) #3
  %8 = bitcast i8* %7 to i8**
  store i8** %8, i8*** @dfi_reg, align 8
  %9 = call noalias i8* @malloc(i64 4194304) #3
  %10 = load i8**, i8*** @dfi_reg, align 8
  %11 = getelementptr inbounds i8*, i8** %10, i64 0
  store i8* %9, i8** %11, align 8
  %12 = call noalias i8* @malloc(i64 67108864) #3
  %13 = load i8**, i8*** @dfi_reg, align 8
  %14 = getelementptr inbounds i8*, i8** %13, i64 1
  store i8* %12, i8** %14, align 8
  %15 = call noalias i8* @malloc(i64 16777216) #3
  %16 = load i8**, i8*** @dfi_reg, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 2
  store i8* %15, i8** %17, align 8
  %18 = call noalias i8* @malloc(i64 4096) #3
  %19 = load i8**, i8*** @dfi_reg, align 8
  %20 = getelementptr inbounds i8*, i8** %19, i64 3
  store i8* %18, i8** %20, align 8
  %21 = call noalias i8* @malloc(i64 4096) #3
  %22 = load i8**, i8*** @dfi_reg, align 8
  %23 = getelementptr inbounds i8*, i8** %22, i64 4
  store i8* %21, i8** %23, align 8
  %24 = load i8**, i8*** @dfi_reg, align 8
  %25 = getelementptr inbounds i8*, i8** %24, i64 0
  %26 = load i8*, i8** %25, align 8
  %27 = bitcast i8* %26 to i32*
  store i32* %27, i32** @dfi_reg_0, align 8
  %28 = load i8**, i8*** @dfi_reg, align 8
  %29 = getelementptr inbounds i8*, i8** %28, i64 1
  %30 = load i8*, i8** %29, align 8
  %31 = bitcast i8* %30 to i32*
  store i32* %31, i32** @dfi_reg_1, align 8
  %32 = load i8**, i8*** @dfi_reg, align 8
  %33 = getelementptr inbounds i8*, i8** %32, i64 2
  %34 = load i8*, i8** %33, align 8
  %35 = bitcast i8* %34 to i32*
  store i32* %35, i32** @dfi_reg_2, align 8
  %36 = load i8**, i8*** @dfi_reg, align 8
  %37 = getelementptr inbounds i8*, i8** %36, i64 3
  %38 = load i8*, i8** %37, align 8
  %39 = bitcast i8* %38 to i32*
  store i32* %39, i32** @dfi_reg_3, align 8
  %40 = load i8**, i8*** @dfi_reg, align 8
  %41 = getelementptr inbounds i8*, i8** %40, i64 4
  %42 = load i8*, i8** %41, align 8
  %43 = bitcast i8* %42 to i32*
  store i32* %43, i32** @dfi_reg_4, align 8
  %44 = load i8**, i8*** @dfi_reg, align 8
  %45 = getelementptr inbounds i8*, i8** %44, i64 1
  %46 = load i8*, i8** %45, align 8
  %47 = bitcast i8* %46 to i16*
  store i16* %47, i16** @dfi_reg_s, align 8
  %48 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  store %struct._IO_FILE* %48, %struct._IO_FILE** %2, align 8
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %50 = icmp eq %struct._IO_FILE* %49, null
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %0
  %52 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 signext 0) #10
  unreachable

; <label>:53:                                     ; preds = %0
  store i32 0, i32* %1, align 4
  store i32 0, i32* %4, align 4
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %55 = call signext i32 @fgetc(%struct._IO_FILE* %54)
  %56 = trunc i32 %55 to i8
  store i8 %56, i8* %3, align 1
  br label %57

; <label>:57:                                     ; preds = %60, %53
  %58 = load i32, i32* %1, align 4
  %59 = icmp slt i32 %58, 4
  br i1 %59, label %60, label %73

; <label>:60:                                     ; preds = %57
  %61 = load i8, i8* %3, align 1
  %62 = load i8**, i8*** @dfi_reg, align 8
  %63 = getelementptr inbounds i8*, i8** %62, i64 2
  %64 = load i8*, i8** %63, align 8
  %65 = load i32, i32* %1, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %64, i64 %66
  store i8 %61, i8* %67, align 1
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %69 = call signext i32 @fgetc(%struct._IO_FILE* %68)
  %70 = trunc i32 %69 to i8
  store i8 %70, i8* %3, align 1
  %71 = load i32, i32* %1, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %1, align 4
  br label %57

; <label>:73:                                     ; preds = %57
  %74 = load i8**, i8*** @dfi_reg, align 8
  %75 = getelementptr inbounds i8*, i8** %74, i64 2
  %76 = load i8*, i8** %75, align 8
  %77 = bitcast i8* %76 to i32*
  %78 = getelementptr inbounds i32, i32* %77, i64 0
  %79 = load i32, i32* %78, align 4
  store i32 %79, i32* %4, align 4
  %80 = load i32, i32* %4, align 4
  %81 = and i32 %80, 1048575
  %82 = mul i32 4, %81
  store i32 %82, i32* %4, align 4
  br label %83

; <label>:83:                                     ; preds = %87, %73
  %84 = load i32, i32* %1, align 4
  %85 = load i32, i32* %4, align 4
  %86 = icmp ult i32 %84, %85
  br i1 %86, label %87, label %100

; <label>:87:                                     ; preds = %83
  %88 = load i8, i8* %3, align 1
  %89 = load i8**, i8*** @dfi_reg, align 8
  %90 = getelementptr inbounds i8*, i8** %89, i64 2
  %91 = load i8*, i8** %90, align 8
  %92 = load i32, i32* %1, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8* %91, i64 %93
  store i8 %88, i8* %94, align 1
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %96 = call signext i32 @fgetc(%struct._IO_FILE* %95)
  %97 = trunc i32 %96 to i8
  store i8 %97, i8* %3, align 1
  %98 = load i32, i32* %1, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %1, align 4
  br label %83

; <label>:100:                                    ; preds = %83
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %102 = call signext i32 @fclose(%struct._IO_FILE* %101)
  %103 = load i32*, i32** @dfi_reg_1, align 8
  %104 = getelementptr inbounds i32, i32* %103, i64 0
  store i32 12345678, i32* %104, align 4
  %105 = load i32*, i32** @dfi_reg_1, align 8
  %106 = getelementptr inbounds i32, i32* %105, i64 0
  store i32 12345678, i32* %106, align 4
  %107 = load i32*, i32** @dfi_reg_2, align 8
  %108 = getelementptr inbounds i32, i32* %107, i64 0
  store i32 23456789, i32* %108, align 4
  %109 = load i32*, i32** @dfi_reg_2, align 8
  %110 = getelementptr inbounds i32, i32* %109, i64 0
  store i32 23456789, i32* %110, align 4
  %111 = load i32*, i32** @dfi_reg_3, align 8
  %112 = getelementptr inbounds i32, i32* %111, i64 2
  store i32 22332233, i32* %112, align 4
  %113 = load i32*, i32** @dfi_reg_3, align 8
  %114 = getelementptr inbounds i32, i32* %113, i64 2
  store i32 22332233, i32* %114, align 4
  %115 = load i32*, i32** @dfi_reg_3, align 8
  %116 = getelementptr inbounds i32, i32* %115, i64 2
  store i32 4259840, i32* %116, align 4
  %117 = load i32*, i32** @dfi_reg_3, align 8
  %118 = getelementptr inbounds i32, i32* %117, i64 2
  store i32 4259840, i32* %118, align 4
  %119 = load i32*, i32** @dfi_reg_3, align 8
  %120 = getelementptr inbounds i32, i32* %119, i64 2
  store i32 43214321, i32* %120, align 4
  %121 = load i32*, i32** @dfi_reg_3, align 8
  %122 = getelementptr inbounds i32, i32* %121, i64 2
  store i32 43214321, i32* %122, align 4
  %123 = load i32*, i32** @dfi_reg_3, align 8
  %124 = getelementptr inbounds i32, i32* %123, i64 2
  store i32 1000000000, i32* %124, align 4
  %125 = load i32*, i32** @dfi_reg_3, align 8
  %126 = getelementptr inbounds i32, i32* %125, i64 2
  store i32 1000000000, i32* %126, align 4
  %127 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %128 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %127, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i32 0, i32 0))
  %129 = load i32*, i32** @dfi_reg_1, align 8
  %130 = ptrtoint i32* %129 to i64
  %131 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %128, i64 %130)
  %132 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %131, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %133 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %134 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %133, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.14, i32 0, i32 0))
  %135 = load i32*, i32** @dfi_reg_2, align 8
  %136 = ptrtoint i32* %135 to i64
  %137 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %134, i64 %136)
  %138 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %137, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %139 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.16, i32 0, i32 0))
  %140 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %139, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  ret void
}

; Function Attrs: noinline optnone
define dso_local i8* @_Z16execute_dficheckPv(i8*) #5 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct.cpu_set_t, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i16, align 2
  %17 = alloca i16, align 2
  %18 = alloca i16, align 2
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %33 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.17, i32 0, i32 0))
  %34 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %33, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %35

; <label>:35:                                     ; preds = %1
  %36 = bitcast %struct.cpu_set_t* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %36, i8 0, i64 128, i1 false)
  br label %37

; <label>:37:                                     ; preds = %35
  store i64 1, i64* %4, align 8
  %38 = load i64, i64* %4, align 8
  %39 = udiv i64 %38, 8
  %40 = icmp ult i64 %39, 128
  br i1 %40, label %41, label %52

; <label>:41:                                     ; preds = %37
  %42 = load i64, i64* %4, align 8
  %43 = urem i64 %42, 64
  %44 = shl i64 1, %43
  %45 = getelementptr inbounds %struct.cpu_set_t, %struct.cpu_set_t* %3, i32 0, i32 0
  %46 = getelementptr inbounds [16 x i64], [16 x i64]* %45, i32 0, i32 0
  %47 = load i64, i64* %4, align 8
  %48 = udiv i64 %47, 64
  %49 = getelementptr inbounds i64, i64* %46, i64 %48
  %50 = load i64, i64* %49, align 8
  %51 = or i64 %50, %44
  store i64 %51, i64* %49, align 8
  br label %53

; <label>:52:                                     ; preds = %37
  br label %53

; <label>:53:                                     ; preds = %52, %41
  %54 = phi i64 [ %51, %41 ], [ 0, %52 ]
  store i64 %54, i64* %5, align 8
  %55 = load i64, i64* %5, align 8
  %56 = call i64 @pthread_self() #9
  store i64 %56, i64* %6, align 8
  %57 = load i64, i64* %6, align 8
  %58 = call signext i32 @pthread_setaffinity_np(i64 %57, i64 128, %struct.cpu_set_t* %3) #3
  %59 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.18, i32 0, i32 0))
  %60 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %59, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %61 = load i32*, i32** @dfi_reg_0, align 8
  store i32* %61, i32** %7, align 8
  %62 = load i32*, i32** @dfi_reg_1, align 8
  %63 = bitcast i32* %62 to i16*
  store i16* %63, i16** %8, align 8
  %64 = load i32*, i32** @dfi_reg_2, align 8
  store i32* %64, i32** %9, align 8
  %65 = load i32*, i32** @dfi_reg_4, align 8
  store i32* %65, i32** %10, align 8
  store i32 0, i32* %11, align 4
  store i32 0, i32* %12, align 4
  store i32 0, i32* %13, align 4
  store i32 0, i32* %14, align 4
  store i32 0, i32* %15, align 4
  store i16 0, i16* %16, align 2
  store i16 0, i16* %17, align 2
  store i16 0, i16* %18, align 2
  store i32 0, i32* %19, align 4
  store i32 0, i32* %20, align 4
  store i32 0, i32* %21, align 4
  store i32 0, i32* %22, align 4
  store i32 0, i32* %23, align 4
  store i32 0, i32* %24, align 4
  store i32 0, i32* %25, align 4
  store i32 0, i32* %26, align 4
  store i32 0, i32* %27, align 4
  store i32 0, i32* %28, align 4
  store i32 0, i32* %29, align 4
  store i32 0, i32* %30, align 4
  store i32 0, i32* %31, align 4
  store i32 0, i32* %24, align 4
  store i32 0, i32* %27, align 4
  store i32 0, i32* %28, align 4
  store i32 0, i32* %29, align 4
  store i32 0, i32* %30, align 4
  store i32 0, i32* %31, align 4
  store i32 0, i32* %25, align 4
  store i32 0, i32* %26, align 4
  store i32 0, i32* %14, align 4
  store i16 0, i16* %17, align 2
  %66 = load i32*, i32** %10, align 8
  %67 = getelementptr inbounds i32, i32* %66, i64 0
  store i32 12123, i32* %67, align 4
  %68 = load i32*, i32** %10, align 8
  %69 = getelementptr inbounds i32, i32* %68, i64 1
  store i32 0, i32* %69, align 4
  store i32 0, i32* %32, align 4
  store volatile i32 1, i32* @dfi_user_start, align 4
  br label %70

; <label>:70:                                     ; preds = %53, %78, %103, %104, %144, %145, %809
  store i32 0, i32* %23, align 4
  %71 = load i32, i32* %11, align 4
  %72 = icmp uge i32 %71, 1048576
  br i1 %72, label %73, label %79

; <label>:73:                                     ; preds = %70
  store i32 0, i32* %11, align 4
  %74 = load i32, i32* %12, align 4
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %77

; <label>:76:                                     ; preds = %73
  store i32 1, i32* %12, align 4
  br label %78

; <label>:77:                                     ; preds = %73
  store i32 0, i32* %12, align 4
  br label %78

; <label>:78:                                     ; preds = %77, %76
  br label %70

; <label>:79:                                     ; preds = %70
  %80 = load i32*, i32** %7, align 8
  %81 = load i32, i32* %11, align 4
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32* %80, i64 %82
  %84 = load i32, i32* %83, align 4
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %86, label %105

; <label>:86:                                     ; preds = %79
  %87 = load i32*, i32** %7, align 8
  %88 = getelementptr inbounds i32, i32* %87, i64 0
  %89 = load i32, i32* %88, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %104

; <label>:91:                                     ; preds = %86
  %92 = load i32*, i32** %7, align 8
  %93 = getelementptr inbounds i32, i32* %92, i64 0
  %94 = load i32, i32* %93, align 4
  %95 = lshr i32 %94, 31
  %96 = load i32, i32* %12, align 4
  %97 = icmp ne i32 %95, %96
  br i1 %97, label %98, label %104

; <label>:98:                                     ; preds = %91
  store i32 0, i32* %11, align 4
  %99 = load i32, i32* %12, align 4
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %101, label %102

; <label>:101:                                    ; preds = %98
  store i32 1, i32* %12, align 4
  br label %103

; <label>:102:                                    ; preds = %98
  store i32 0, i32* %12, align 4
  br label %103

; <label>:103:                                    ; preds = %102, %101
  br label %70

; <label>:104:                                    ; preds = %91, %86
  br label %70

; <label>:105:                                    ; preds = %79
  %106 = load i32*, i32** %7, align 8
  %107 = load i32, i32* %11, align 4
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32* %106, i64 %108
  %110 = load i32, i32* %109, align 4
  %111 = lshr i32 %110, 31
  %112 = load i32, i32* %12, align 4
  %113 = icmp ne i32 %111, %112
  br i1 %113, label %114, label %146

; <label>:114:                                    ; preds = %105
  %115 = load i32*, i32** %7, align 8
  %116 = getelementptr inbounds i32, i32* %115, i64 0
  %117 = load i32, i32* %116, align 4
  %118 = lshr i32 %117, 31
  %119 = load i32, i32* %12, align 4
  %120 = icmp ne i32 %118, %119
  br i1 %120, label %121, label %145

; <label>:121:                                    ; preds = %114
  %122 = load i32, i32* %11, align 4
  %123 = icmp ugt i32 %122, 0
  br i1 %123, label %124, label %139

; <label>:124:                                    ; preds = %121
  %125 = load i32*, i32** %7, align 8
  %126 = load i32, i32* %11, align 4
  %127 = sub i32 %126, 1
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32* %125, i64 %128
  %130 = load i32, i32* %129, align 4
  %131 = lshr i32 %130, 31
  %132 = load i32, i32* %12, align 4
  %133 = icmp ne i32 %131, %132
  br i1 %133, label %134, label %139

; <label>:134:                                    ; preds = %124
  %135 = load i32*, i32** %10, align 8
  %136 = getelementptr inbounds i32, i32* %135, i64 5
  %137 = load i32, i32* %136, align 4
  %138 = add i32 %137, 1
  store i32 %138, i32* %136, align 4
  br label %139

; <label>:139:                                    ; preds = %134, %124, %121
  store i32 0, i32* %11, align 4
  %140 = load i32, i32* %12, align 4
  %141 = icmp eq i32 %140, 0
  br i1 %141, label %142, label %143

; <label>:142:                                    ; preds = %139
  store i32 1, i32* %12, align 4
  br label %144

; <label>:143:                                    ; preds = %139
  store i32 0, i32* %12, align 4
  br label %144

; <label>:144:                                    ; preds = %143, %142
  br label %70

; <label>:145:                                    ; preds = %114
  br label %70

; <label>:146:                                    ; preds = %105
  %147 = load i32*, i32** %7, align 8
  %148 = load i32, i32* %11, align 4
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds i32, i32* %147, i64 %149
  %151 = load i32, i32* %150, align 4
  %152 = lshr i32 %151, 30
  %153 = and i32 %152, 1
  %154 = icmp ne i32 %153, 0
  br i1 %154, label %155, label %276

; <label>:155:                                    ; preds = %146
  %156 = load i32, i32* %24, align 4
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %158, label %159

; <label>:158:                                    ; preds = %155
  store i32 2, i32* %24, align 4
  br label %159

; <label>:159:                                    ; preds = %158, %155
  %160 = load i32, i32* %24, align 4
  %161 = sub i32 2, %160
  store i32 %161, i32* %19, align 4
  %162 = load i32*, i32** %7, align 8
  %163 = load i32, i32* %11, align 4
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds i32, i32* %162, i64 %164
  %166 = load i32, i32* %165, align 4
  %167 = load i32, i32* %19, align 4
  %168 = mul i32 15, %167
  %169 = add i32 7, %168
  %170 = lshr i32 %166, %169
  %171 = and i32 %170, 1
  %172 = icmp ne i32 %171, 0
  br i1 %172, label %173, label %197

; <label>:173:                                    ; preds = %159
  %174 = load i32, i32* %14, align 4
  %175 = load i32*, i32** %7, align 8
  %176 = load i32, i32* %11, align 4
  %177 = zext i32 %176 to i64
  %178 = getelementptr inbounds i32, i32* %175, i64 %177
  %179 = load i32, i32* %178, align 4
  %180 = load i32, i32* %19, align 4
  %181 = mul i32 15, %180
  %182 = add i32 3, %181
  %183 = lshr i32 %179, %182
  %184 = and i32 %183, 15
  %185 = load i32*, i32** %7, align 8
  %186 = load i32, i32* %11, align 4
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32* %185, i64 %187
  %189 = load i32, i32* %188, align 4
  %190 = load i32, i32* %19, align 4
  %191 = mul i32 15, %190
  %192 = lshr i32 %189, %191
  %193 = and i32 %192, 7
  %194 = mul i32 %193, 4
  %195 = shl i32 %184, %194
  %196 = sub i32 %174, %195
  store i32 %196, i32* %13, align 4
  br label %221

; <label>:197:                                    ; preds = %159
  %198 = load i32, i32* %14, align 4
  %199 = load i32*, i32** %7, align 8
  %200 = load i32, i32* %11, align 4
  %201 = zext i32 %200 to i64
  %202 = getelementptr inbounds i32, i32* %199, i64 %201
  %203 = load i32, i32* %202, align 4
  %204 = load i32, i32* %19, align 4
  %205 = mul i32 15, %204
  %206 = add i32 3, %205
  %207 = lshr i32 %203, %206
  %208 = and i32 %207, 15
  %209 = load i32*, i32** %7, align 8
  %210 = load i32, i32* %11, align 4
  %211 = zext i32 %210 to i64
  %212 = getelementptr inbounds i32, i32* %209, i64 %211
  %213 = load i32, i32* %212, align 4
  %214 = load i32, i32* %19, align 4
  %215 = mul i32 15, %214
  %216 = lshr i32 %213, %215
  %217 = and i32 %216, 7
  %218 = mul i32 %217, 4
  %219 = shl i32 %208, %218
  %220 = add i32 %198, %219
  store i32 %220, i32* %13, align 4
  br label %221

; <label>:221:                                    ; preds = %197, %173
  %222 = load i32*, i32** %7, align 8
  %223 = load i32, i32* %11, align 4
  %224 = zext i32 %223 to i64
  %225 = getelementptr inbounds i32, i32* %222, i64 %224
  %226 = load i32, i32* %225, align 4
  %227 = load i32, i32* %19, align 4
  %228 = mul i32 15, %227
  %229 = add i32 13, %228
  %230 = lshr i32 %226, %229
  %231 = and i32 %230, 1
  %232 = icmp ne i32 %231, 0
  br i1 %232, label %233, label %248

; <label>:233:                                    ; preds = %221
  %234 = load i16, i16* %17, align 2
  %235 = zext i16 %234 to i32
  %236 = load i32*, i32** %7, align 8
  %237 = load i32, i32* %11, align 4
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds i32, i32* %236, i64 %238
  %240 = load i32, i32* %239, align 4
  %241 = load i32, i32* %19, align 4
  %242 = mul i32 15, %241
  %243 = add i32 8, %242
  %244 = lshr i32 %240, %243
  %245 = and i32 %244, 31
  %246 = sub i32 %235, %245
  %247 = trunc i32 %246 to i16
  store i16 %247, i16* %16, align 2
  br label %263

; <label>:248:                                    ; preds = %221
  %249 = load i16, i16* %17, align 2
  %250 = zext i16 %249 to i32
  %251 = load i32*, i32** %7, align 8
  %252 = load i32, i32* %11, align 4
  %253 = zext i32 %252 to i64
  %254 = getelementptr inbounds i32, i32* %251, i64 %253
  %255 = load i32, i32* %254, align 4
  %256 = load i32, i32* %19, align 4
  %257 = mul i32 15, %256
  %258 = add i32 8, %257
  %259 = lshr i32 %255, %258
  %260 = and i32 %259, 31
  %261 = add i32 %250, %260
  %262 = trunc i32 %261 to i16
  store i16 %262, i16* %16, align 2
  br label %263

; <label>:263:                                    ; preds = %248, %233
  %264 = load i32*, i32** %7, align 8
  %265 = load i32, i32* %11, align 4
  %266 = zext i32 %265 to i64
  %267 = getelementptr inbounds i32, i32* %264, i64 %266
  %268 = load i32, i32* %267, align 4
  %269 = load i32, i32* %19, align 4
  %270 = mul i32 15, %269
  %271 = add i32 14, %270
  %272 = lshr i32 %268, %271
  %273 = and i32 %272, 1
  store i32 %273, i32* %15, align 4
  %274 = load i32, i32* %24, align 4
  %275 = add i32 %274, -1
  store i32 %275, i32* %24, align 4
  store i32 2, i32* %23, align 4
  br label %497

; <label>:276:                                    ; preds = %146
  %277 = load i32*, i32** %7, align 8
  %278 = load i32, i32* %11, align 4
  %279 = zext i32 %278 to i64
  %280 = getelementptr inbounds i32, i32* %277, i64 %279
  %281 = load i32, i32* %280, align 4
  %282 = lshr i32 %281, 29
  %283 = icmp eq i32 %282, 0
  br i1 %283, label %284, label %306

; <label>:284:                                    ; preds = %276
  %285 = load i32*, i32** %7, align 8
  %286 = load i32, i32* %11, align 4
  %287 = add i32 %286, 1
  %288 = zext i32 %287 to i64
  %289 = getelementptr inbounds i32, i32* %285, i64 %288
  %290 = load i32, i32* %289, align 4
  %291 = and i32 %290, 2147483647
  store i32 %291, i32* %13, align 4
  %292 = load i32*, i32** %7, align 8
  %293 = load i32, i32* %11, align 4
  %294 = zext i32 %293 to i64
  %295 = getelementptr inbounds i32, i32* %292, i64 %294
  %296 = load i32, i32* %295, align 4
  %297 = lshr i32 %296, 16
  %298 = and i32 %297, 1
  store i32 %298, i32* %15, align 4
  %299 = load i32*, i32** %7, align 8
  %300 = load i32, i32* %11, align 4
  %301 = zext i32 %300 to i64
  %302 = getelementptr inbounds i32, i32* %299, i64 %301
  %303 = load i32, i32* %302, align 4
  %304 = and i32 %303, 65535
  %305 = trunc i32 %304 to i16
  store i16 %305, i16* %16, align 2
  store i32 1, i32* %23, align 4
  br label %496

; <label>:306:                                    ; preds = %276
  %307 = load i32, i32* %11, align 4
  store i32 %307, i32* %28, align 4
  %308 = load i32, i32* %28, align 4
  %309 = add i32 %308, 1
  store i32 %309, i32* %28, align 4
  %310 = load i32*, i32** %7, align 8
  %311 = load i32, i32* %11, align 4
  %312 = zext i32 %311 to i64
  %313 = getelementptr inbounds i32, i32* %310, i64 %312
  %314 = load i32, i32* %313, align 4
  %315 = lshr i32 %314, 18
  %316 = and i32 %315, 1
  %317 = icmp ne i32 %316, 0
  br i1 %317, label %318, label %322

; <label>:318:                                    ; preds = %306
  %319 = load i32, i32* %28, align 4
  store i32 %319, i32* %29, align 4
  %320 = load i32, i32* %28, align 4
  %321 = add i32 %320, 1
  store i32 %321, i32* %28, align 4
  br label %322

; <label>:322:                                    ; preds = %318, %306
  %323 = load i32*, i32** %7, align 8
  %324 = load i32, i32* %11, align 4
  %325 = zext i32 %324 to i64
  %326 = getelementptr inbounds i32, i32* %323, i64 %325
  %327 = load i32, i32* %326, align 4
  %328 = lshr i32 %327, 19
  %329 = and i32 %328, 1
  %330 = icmp ne i32 %329, 0
  br i1 %330, label %331, label %335

; <label>:331:                                    ; preds = %322
  %332 = load i32, i32* %28, align 4
  store i32 %332, i32* %30, align 4
  %333 = load i32, i32* %28, align 4
  %334 = add i32 %333, 1
  store i32 %334, i32* %28, align 4
  br label %335

; <label>:335:                                    ; preds = %331, %322
  %336 = load i32, i32* %28, align 4
  store i32 %336, i32* %31, align 4
  %337 = load i32*, i32** %7, align 8
  %338 = load i32, i32* %11, align 4
  %339 = zext i32 %338 to i64
  %340 = getelementptr inbounds i32, i32* %337, i64 %339
  %341 = load i32, i32* %340, align 4
  %342 = lshr i32 %341, 16
  %343 = and i32 %342, 3
  %344 = load i32, i32* %28, align 4
  %345 = add i32 %344, %343
  store i32 %345, i32* %28, align 4
  %346 = load i32, i32* %27, align 4
  %347 = icmp eq i32 %346, 0
  br i1 %347, label %348, label %361

; <label>:348:                                    ; preds = %335
  %349 = load i32, i32* %29, align 4
  %350 = icmp ne i32 %349, 0
  br i1 %350, label %351, label %354

; <label>:351:                                    ; preds = %348
  %352 = load i32, i32* %27, align 4
  %353 = add i32 %352, 1
  store i32 %353, i32* %27, align 4
  br label %354

; <label>:354:                                    ; preds = %351, %348
  %355 = load i32, i32* %30, align 4
  %356 = icmp ne i32 %355, 0
  br i1 %356, label %357, label %360

; <label>:357:                                    ; preds = %354
  %358 = load i32, i32* %27, align 4
  %359 = add i32 %358, 1
  store i32 %359, i32* %27, align 4
  br label %360

; <label>:360:                                    ; preds = %357, %354
  br label %361

; <label>:361:                                    ; preds = %360, %335
  %362 = load i32*, i32** %7, align 8
  %363 = load i32, i32* %11, align 4
  %364 = zext i32 %363 to i64
  %365 = getelementptr inbounds i32, i32* %362, i64 %364
  %366 = load i32, i32* %365, align 4
  %367 = and i32 %366, 65535
  %368 = trunc i32 %367 to i16
  store i16 %368, i16* %16, align 2
  %369 = load i32, i32* %29, align 4
  %370 = icmp ne i32 %369, 0
  br i1 %370, label %371, label %387

; <label>:371:                                    ; preds = %361
  %372 = load i32, i32* %27, align 4
  %373 = icmp eq i32 %372, 2
  br i1 %373, label %380, label %374

; <label>:374:                                    ; preds = %371
  %375 = load i32, i32* %27, align 4
  %376 = icmp eq i32 %375, 1
  br i1 %376, label %377, label %387

; <label>:377:                                    ; preds = %374
  %378 = load i32, i32* %30, align 4
  %379 = icmp ne i32 %378, 0
  br i1 %379, label %387, label %380

; <label>:380:                                    ; preds = %377, %371
  store i32 1, i32* %15, align 4
  %381 = load i32*, i32** %7, align 8
  %382 = load i32, i32* %29, align 4
  %383 = zext i32 %382 to i64
  %384 = getelementptr inbounds i32, i32* %381, i64 %383
  %385 = load i32, i32* %384, align 4
  %386 = and i32 %385, 2147483647
  store i32 %386, i32* %13, align 4
  br label %387

; <label>:387:                                    ; preds = %380, %377, %374, %361
  %388 = load i32, i32* %30, align 4
  %389 = icmp ne i32 %388, 0
  br i1 %389, label %390, label %400

; <label>:390:                                    ; preds = %387
  %391 = load i32, i32* %27, align 4
  %392 = icmp eq i32 %391, 1
  br i1 %392, label %393, label %400

; <label>:393:                                    ; preds = %390
  store i32 0, i32* %15, align 4
  %394 = load i32*, i32** %7, align 8
  %395 = load i32, i32* %30, align 4
  %396 = zext i32 %395 to i64
  %397 = getelementptr inbounds i32, i32* %394, i64 %396
  %398 = load i32, i32* %397, align 4
  %399 = and i32 %398, 2147483647
  store i32 %399, i32* %13, align 4
  br label %400

; <label>:400:                                    ; preds = %393, %390, %387
  store i32 0, i32* %25, align 4
  store i32 0, i32* %26, align 4
  %401 = load i32*, i32** %7, align 8
  %402 = load i32, i32* %11, align 4
  %403 = zext i32 %402 to i64
  %404 = getelementptr inbounds i32, i32* %401, i64 %403
  %405 = load i32, i32* %404, align 4
  %406 = lshr i32 %405, 16
  %407 = and i32 %406, 3
  %408 = icmp eq i32 %407, 1
  br i1 %408, label %409, label %416

; <label>:409:                                    ; preds = %400
  %410 = load i32*, i32** %7, align 8
  %411 = load i32, i32* %31, align 4
  %412 = zext i32 %411 to i64
  %413 = getelementptr inbounds i32, i32* %410, i64 %412
  %414 = load i32, i32* %413, align 4
  %415 = and i32 %414, 2147483647
  store i32 %415, i32* %25, align 4
  store i32 0, i32* %26, align 4
  br label %483

; <label>:416:                                    ; preds = %400
  %417 = load i32*, i32** %7, align 8
  %418 = load i32, i32* %11, align 4
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds i32, i32* %417, i64 %419
  %421 = load i32, i32* %420, align 4
  %422 = lshr i32 %421, 16
  %423 = and i32 %422, 3
  %424 = icmp eq i32 %423, 2
  br i1 %424, label %425, label %449

; <label>:425:                                    ; preds = %416
  %426 = load i32*, i32** %7, align 8
  %427 = load i32, i32* %31, align 4
  %428 = zext i32 %427 to i64
  %429 = getelementptr inbounds i32, i32* %426, i64 %428
  %430 = load i32, i32* %429, align 4
  %431 = and i32 %430, 2147483647
  %432 = load i32*, i32** %7, align 8
  %433 = load i32, i32* %31, align 4
  %434 = add i32 %433, 1
  %435 = zext i32 %434 to i64
  %436 = getelementptr inbounds i32, i32* %432, i64 %435
  %437 = load i32, i32* %436, align 4
  %438 = and i32 %437, 1
  %439 = shl i32 %438, 31
  %440 = or i32 %431, %439
  store i32 %440, i32* %25, align 4
  %441 = load i32*, i32** %7, align 8
  %442 = load i32, i32* %31, align 4
  %443 = add i32 %442, 1
  %444 = zext i32 %443 to i64
  %445 = getelementptr inbounds i32, i32* %441, i64 %444
  %446 = load i32, i32* %445, align 4
  %447 = and i32 %446, 2147483647
  %448 = lshr i32 %447, 1
  store i32 %448, i32* %26, align 4
  br label %482

; <label>:449:                                    ; preds = %416
  %450 = load i32*, i32** %7, align 8
  %451 = load i32, i32* %31, align 4
  %452 = zext i32 %451 to i64
  %453 = getelementptr inbounds i32, i32* %450, i64 %452
  %454 = load i32, i32* %453, align 4
  %455 = and i32 %454, 2147483647
  %456 = load i32*, i32** %7, align 8
  %457 = load i32, i32* %31, align 4
  %458 = add i32 %457, 1
  %459 = zext i32 %458 to i64
  %460 = getelementptr inbounds i32, i32* %456, i64 %459
  %461 = load i32, i32* %460, align 4
  %462 = and i32 %461, 1
  %463 = shl i32 %462, 31
  %464 = or i32 %455, %463
  store i32 %464, i32* %25, align 4
  %465 = load i32*, i32** %7, align 8
  %466 = load i32, i32* %31, align 4
  %467 = add i32 %466, 1
  %468 = zext i32 %467 to i64
  %469 = getelementptr inbounds i32, i32* %465, i64 %468
  %470 = load i32, i32* %469, align 4
  %471 = and i32 %470, 2147483647
  %472 = lshr i32 %471, 1
  %473 = load i32*, i32** %7, align 8
  %474 = load i32, i32* %31, align 4
  %475 = add i32 %474, 2
  %476 = zext i32 %475 to i64
  %477 = getelementptr inbounds i32, i32* %473, i64 %476
  %478 = load i32, i32* %477, align 4
  %479 = and i32 %478, 3
  %480 = shl i32 %479, 30
  %481 = or i32 %472, %480
  store i32 %481, i32* %26, align 4
  br label %482

; <label>:482:                                    ; preds = %449, %425
  br label %483

; <label>:483:                                    ; preds = %482, %409
  %484 = load i32, i32* %25, align 4
  %485 = load i32*, i32** %10, align 8
  %486 = getelementptr inbounds i32, i32* %485, i64 16
  store i32 %484, i32* %486, align 4
  %487 = load i32, i32* %26, align 4
  %488 = load i32*, i32** %10, align 8
  %489 = getelementptr inbounds i32, i32* %488, i64 17
  store i32 %487, i32* %489, align 4
  %490 = load i32, i32* %27, align 4
  %491 = icmp ugt i32 %490, 0
  br i1 %491, label %492, label %495

; <label>:492:                                    ; preds = %483
  %493 = load i32, i32* %27, align 4
  %494 = add i32 %493, -1
  store i32 %494, i32* %27, align 4
  store i32 3, i32* %23, align 4
  br label %495

; <label>:495:                                    ; preds = %492, %483
  br label %496

; <label>:496:                                    ; preds = %495, %284
  br label %497

; <label>:497:                                    ; preds = %496, %263
  %498 = load i32, i32* %23, align 4
  %499 = icmp ne i32 %498, 0
  br i1 %499, label %500, label %777

; <label>:500:                                    ; preds = %497
  %501 = load i32, i32* %23, align 4
  %502 = load i32*, i32** %10, align 8
  %503 = getelementptr inbounds i32, i32* %502, i64 18
  store i32 %501, i32* %503, align 4
  %504 = load i32, i32* %15, align 4
  %505 = icmp ne i32 %504, 0
  br i1 %505, label %506, label %678

; <label>:506:                                    ; preds = %500
  %507 = load i32, i32* %23, align 4
  %508 = icmp eq i32 %507, 3
  br i1 %508, label %509, label %613

; <label>:509:                                    ; preds = %506
  store i32 0, i32* %20, align 4
  store i32 0, i32* %21, align 4
  br label %510

; <label>:510:                                    ; preds = %509, %611
  %511 = load i32, i32* %20, align 4
  %512 = load i32, i32* %25, align 4
  %513 = icmp uge i32 %511, %512
  br i1 %513, label %514, label %518

; <label>:514:                                    ; preds = %510
  %515 = load i32, i32* %21, align 4
  %516 = load i32, i32* %26, align 4
  %517 = icmp eq i32 %515, %516
  br i1 %517, label %522, label %518

; <label>:518:                                    ; preds = %514, %510
  %519 = load i32, i32* %21, align 4
  %520 = load i32, i32* %26, align 4
  %521 = icmp ugt i32 %519, %520
  br i1 %521, label %522, label %523

; <label>:522:                                    ; preds = %518, %514
  br label %612

; <label>:523:                                    ; preds = %518
  %524 = load i16*, i16** %8, align 8
  %525 = load i32, i32* %13, align 4
  %526 = and i32 %525, 33554431
  %527 = zext i32 %526 to i64
  %528 = getelementptr inbounds i16, i16* %524, i64 %527
  %529 = load i16, i16* %528, align 2
  store i16 %529, i16* %18, align 2
  store i32 1, i32* %22, align 4
  %530 = load i32*, i32** %9, align 8
  %531 = load i16, i16* %16, align 2
  %532 = zext i16 %531 to i64
  %533 = getelementptr inbounds i32, i32* %530, i64 %532
  %534 = load i32, i32* %533, align 4
  %535 = load i32*, i32** %10, align 8
  %536 = getelementptr inbounds i32, i32* %535, i64 20
  store i32 %534, i32* %536, align 4
  %537 = load i32*, i32** %9, align 8
  %538 = load i16, i16* %16, align 2
  %539 = zext i16 %538 to i64
  %540 = getelementptr inbounds i32, i32* %537, i64 %539
  %541 = load i32, i32* %540, align 4
  %542 = and i32 %541, 65535
  store i32 %542, i32* %19, align 4
  br label %543

; <label>:543:                                    ; preds = %570, %523
  %544 = load i32, i32* %19, align 4
  %545 = load i32*, i32** %9, align 8
  %546 = load i16, i16* %16, align 2
  %547 = zext i16 %546 to i64
  %548 = getelementptr inbounds i32, i32* %545, i64 %547
  %549 = load i32, i32* %548, align 4
  %550 = lshr i32 %549, 16
  %551 = icmp ult i32 %544, %550
  br i1 %551, label %552, label %573

; <label>:552:                                    ; preds = %543
  store i32 0, i32* %22, align 4
  %553 = load i32*, i32** %9, align 8
  %554 = load i32, i32* %19, align 4
  %555 = zext i32 %554 to i64
  %556 = getelementptr inbounds i32, i32* %553, i64 %555
  %557 = load i32, i32* %556, align 4
  %558 = load i32*, i32** %10, align 8
  %559 = getelementptr inbounds i32, i32* %558, i64 19
  store i32 %557, i32* %559, align 4
  %560 = load i16, i16* %18, align 2
  %561 = zext i16 %560 to i32
  %562 = load i32*, i32** %9, align 8
  %563 = load i32, i32* %19, align 4
  %564 = zext i32 %563 to i64
  %565 = getelementptr inbounds i32, i32* %562, i64 %564
  %566 = load i32, i32* %565, align 4
  %567 = icmp eq i32 %561, %566
  br i1 %567, label %568, label %569

; <label>:568:                                    ; preds = %552
  store i32 1, i32* %22, align 4
  br label %573

; <label>:569:                                    ; preds = %552
  br label %570

; <label>:570:                                    ; preds = %569
  %571 = load i32, i32* %19, align 4
  %572 = add i32 %571, 1
  store i32 %572, i32* %19, align 4
  br label %543

; <label>:573:                                    ; preds = %568, %543
  %574 = load i16, i16* %18, align 2
  %575 = zext i16 %574 to i32
  %576 = icmp eq i32 %575, 0
  br i1 %576, label %577, label %578

; <label>:577:                                    ; preds = %573
  store i32 1, i32* %22, align 4
  br label %578

; <label>:578:                                    ; preds = %577, %573
  %579 = load i32, i32* %22, align 4
  %580 = load i32*, i32** %10, align 8
  %581 = getelementptr inbounds i32, i32* %580, i64 8
  store i32 %579, i32* %581, align 4
  %582 = load i32, i32* %22, align 4
  %583 = icmp eq i32 %582, 0
  br i1 %583, label %584, label %600

; <label>:584:                                    ; preds = %578
  %585 = load i32*, i32** %10, align 8
  %586 = getelementptr inbounds i32, i32* %585, i64 1
  %587 = load i32, i32* %586, align 4
  %588 = add i32 %587, 1
  store i32 %588, i32* %586, align 4
  %589 = load i16, i16* %16, align 2
  %590 = zext i16 %589 to i32
  %591 = load i32*, i32** %10, align 8
  %592 = getelementptr inbounds i32, i32* %591, i64 13
  store i32 %590, i32* %592, align 4
  %593 = load i32, i32* %13, align 4
  %594 = load i32*, i32** %10, align 8
  %595 = getelementptr inbounds i32, i32* %594, i64 14
  store i32 %593, i32* %595, align 4
  %596 = load i16, i16* %18, align 2
  %597 = zext i16 %596 to i32
  %598 = load i32*, i32** %10, align 8
  %599 = getelementptr inbounds i32, i32* %598, i64 15
  store i32 %597, i32* %599, align 4
  br label %600

; <label>:600:                                    ; preds = %584, %578
  %601 = load i32, i32* %13, align 4
  %602 = add i32 %601, 1
  store i32 %602, i32* %13, align 4
  %603 = load i32, i32* %20, align 4
  %604 = icmp ult i32 %603, -4
  br i1 %604, label %605, label %608

; <label>:605:                                    ; preds = %600
  %606 = load i32, i32* %20, align 4
  %607 = add i32 %606, 4
  store i32 %607, i32* %20, align 4
  br label %611

; <label>:608:                                    ; preds = %600
  store i32 0, i32* %20, align 4
  %609 = load i32, i32* %21, align 4
  %610 = add i32 %609, 1
  store i32 %610, i32* %21, align 4
  br label %611

; <label>:611:                                    ; preds = %608, %605
  br label %510

; <label>:612:                                    ; preds = %522
  br label %677

; <label>:613:                                    ; preds = %506
  %614 = load i16*, i16** %8, align 8
  %615 = load i32, i32* %13, align 4
  %616 = and i32 %615, 33554431
  %617 = zext i32 %616 to i64
  %618 = getelementptr inbounds i16, i16* %614, i64 %617
  %619 = load i16, i16* %618, align 2
  store i16 %619, i16* %18, align 2
  store i32 1, i32* %22, align 4
  %620 = load i32*, i32** %9, align 8
  %621 = load i16, i16* %16, align 2
  %622 = zext i16 %621 to i64
  %623 = getelementptr inbounds i32, i32* %620, i64 %622
  %624 = load i32, i32* %623, align 4
  %625 = and i32 %624, 65535
  store i32 %625, i32* %19, align 4
  br label %626

; <label>:626:                                    ; preds = %646, %613
  %627 = load i32, i32* %19, align 4
  %628 = load i32*, i32** %9, align 8
  %629 = load i16, i16* %16, align 2
  %630 = zext i16 %629 to i64
  %631 = getelementptr inbounds i32, i32* %628, i64 %630
  %632 = load i32, i32* %631, align 4
  %633 = lshr i32 %632, 16
  %634 = icmp ult i32 %627, %633
  br i1 %634, label %635, label %649

; <label>:635:                                    ; preds = %626
  store i32 0, i32* %22, align 4
  %636 = load i16, i16* %18, align 2
  %637 = zext i16 %636 to i32
  %638 = load i32*, i32** %9, align 8
  %639 = load i32, i32* %19, align 4
  %640 = zext i32 %639 to i64
  %641 = getelementptr inbounds i32, i32* %638, i64 %640
  %642 = load i32, i32* %641, align 4
  %643 = icmp eq i32 %637, %642
  br i1 %643, label %644, label %645

; <label>:644:                                    ; preds = %635
  store i32 1, i32* %22, align 4
  br label %649

; <label>:645:                                    ; preds = %635
  br label %646

; <label>:646:                                    ; preds = %645
  %647 = load i32, i32* %19, align 4
  %648 = add i32 %647, 1
  store i32 %648, i32* %19, align 4
  br label %626

; <label>:649:                                    ; preds = %644, %626
  %650 = load i16, i16* %18, align 2
  %651 = zext i16 %650 to i32
  %652 = icmp eq i32 %651, 0
  br i1 %652, label %653, label %654

; <label>:653:                                    ; preds = %649
  store i32 1, i32* %22, align 4
  br label %654

; <label>:654:                                    ; preds = %653, %649
  %655 = load i32, i32* %22, align 4
  %656 = load i32*, i32** %10, align 8
  %657 = getelementptr inbounds i32, i32* %656, i64 8
  store i32 %655, i32* %657, align 4
  %658 = load i32, i32* %22, align 4
  %659 = icmp eq i32 %658, 0
  br i1 %659, label %660, label %676

; <label>:660:                                    ; preds = %654
  %661 = load i32*, i32** %10, align 8
  %662 = getelementptr inbounds i32, i32* %661, i64 1
  %663 = load i32, i32* %662, align 4
  %664 = add i32 %663, 1
  store i32 %664, i32* %662, align 4
  %665 = load i16, i16* %16, align 2
  %666 = zext i16 %665 to i32
  %667 = load i32*, i32** %10, align 8
  %668 = getelementptr inbounds i32, i32* %667, i64 10
  store i32 %666, i32* %668, align 4
  %669 = load i32, i32* %13, align 4
  %670 = load i32*, i32** %10, align 8
  %671 = getelementptr inbounds i32, i32* %670, i64 11
  store i32 %669, i32* %671, align 4
  %672 = load i16, i16* %18, align 2
  %673 = zext i16 %672 to i32
  %674 = load i32*, i32** %10, align 8
  %675 = getelementptr inbounds i32, i32* %674, i64 12
  store i32 %673, i32* %675, align 4
  br label %676

; <label>:676:                                    ; preds = %660, %654
  br label %677

; <label>:677:                                    ; preds = %676, %612
  br label %740

; <label>:678:                                    ; preds = %500
  %679 = load i32, i32* %23, align 4
  %680 = icmp eq i32 %679, 3
  br i1 %680, label %681, label %723

; <label>:681:                                    ; preds = %678
  store i32 0, i32* %20, align 4
  store i32 0, i32* %21, align 4
  br label %682

; <label>:682:                                    ; preds = %681, %721
  %683 = load i32, i32* %20, align 4
  %684 = load i32, i32* %25, align 4
  %685 = icmp uge i32 %683, %684
  br i1 %685, label %686, label %690

; <label>:686:                                    ; preds = %682
  %687 = load i32, i32* %21, align 4
  %688 = load i32, i32* %26, align 4
  %689 = icmp eq i32 %687, %688
  br i1 %689, label %694, label %690

; <label>:690:                                    ; preds = %686, %682
  %691 = load i32, i32* %21, align 4
  %692 = load i32, i32* %26, align 4
  %693 = icmp ugt i32 %691, %692
  br i1 %693, label %694, label %695

; <label>:694:                                    ; preds = %690, %686
  br label %722

; <label>:695:                                    ; preds = %690
  %696 = load i16, i16* %16, align 2
  %697 = load i16*, i16** %8, align 8
  %698 = load i32, i32* %13, align 4
  %699 = and i32 %698, 33554431
  %700 = zext i32 %699 to i64
  %701 = getelementptr inbounds i16, i16* %697, i64 %700
  store i16 %696, i16* %701, align 2
  %702 = load i16*, i16** %8, align 8
  %703 = load i32, i32* %13, align 4
  %704 = and i32 %703, 33554431
  %705 = zext i32 %704 to i64
  %706 = getelementptr inbounds i16, i16* %702, i64 %705
  %707 = load i16, i16* %706, align 2
  %708 = zext i16 %707 to i32
  %709 = load i32*, i32** %10, align 8
  %710 = getelementptr inbounds i32, i32* %709, i64 16
  store i32 %708, i32* %710, align 4
  %711 = load i32, i32* %13, align 4
  %712 = add i32 %711, 1
  store i32 %712, i32* %13, align 4
  %713 = load i32, i32* %20, align 4
  %714 = icmp ult i32 %713, -4
  br i1 %714, label %715, label %718

; <label>:715:                                    ; preds = %695
  %716 = load i32, i32* %20, align 4
  %717 = add i32 %716, 4
  store i32 %717, i32* %20, align 4
  br label %721

; <label>:718:                                    ; preds = %695
  store i32 0, i32* %20, align 4
  %719 = load i32, i32* %21, align 4
  %720 = add i32 %719, 1
  store i32 %720, i32* %21, align 4
  br label %721

; <label>:721:                                    ; preds = %718, %715
  br label %682

; <label>:722:                                    ; preds = %694
  br label %739

; <label>:723:                                    ; preds = %678
  %724 = load i16, i16* %16, align 2
  %725 = load i16*, i16** %8, align 8
  %726 = load i32, i32* %13, align 4
  %727 = and i32 %726, 33554431
  %728 = zext i32 %727 to i64
  %729 = getelementptr inbounds i16, i16* %725, i64 %728
  store i16 %724, i16* %729, align 2
  %730 = load i16*, i16** %8, align 8
  %731 = load i32, i32* %13, align 4
  %732 = and i32 %731, 33554431
  %733 = zext i32 %732 to i64
  %734 = getelementptr inbounds i16, i16* %730, i64 %733
  %735 = load i16, i16* %734, align 2
  %736 = zext i16 %735 to i32
  %737 = load i32*, i32** %10, align 8
  %738 = getelementptr inbounds i32, i32* %737, i64 16
  store i32 %736, i32* %738, align 4
  br label %739

; <label>:739:                                    ; preds = %723, %722
  br label %740

; <label>:740:                                    ; preds = %739, %677
  %741 = load i32, i32* %23, align 4
  %742 = icmp eq i32 %741, 1
  br i1 %742, label %746, label %743

; <label>:743:                                    ; preds = %740
  %744 = load i32, i32* %23, align 4
  %745 = icmp eq i32 %744, 2
  br i1 %745, label %746, label %749

; <label>:746:                                    ; preds = %743, %740
  %747 = load i16, i16* %16, align 2
  store i16 %747, i16* %17, align 2
  %748 = load i32, i32* %13, align 4
  store i32 %748, i32* %14, align 4
  br label %749

; <label>:749:                                    ; preds = %746, %743
  %750 = load i32, i32* %23, align 4
  %751 = icmp eq i32 %750, 1
  br i1 %751, label %752, label %755

; <label>:752:                                    ; preds = %749
  %753 = load i32, i32* %11, align 4
  %754 = add i32 %753, 2
  store i32 %754, i32* %11, align 4
  br label %776

; <label>:755:                                    ; preds = %749
  %756 = load i32, i32* %23, align 4
  %757 = icmp eq i32 %756, 2
  br i1 %757, label %758, label %765

; <label>:758:                                    ; preds = %755
  %759 = load i32, i32* %24, align 4
  %760 = icmp eq i32 %759, 0
  br i1 %760, label %761, label %764

; <label>:761:                                    ; preds = %758
  %762 = load i32, i32* %11, align 4
  %763 = add i32 %762, 1
  store i32 %763, i32* %11, align 4
  br label %764

; <label>:764:                                    ; preds = %761, %758
  br label %775

; <label>:765:                                    ; preds = %755
  %766 = load i32, i32* %23, align 4
  %767 = icmp eq i32 %766, 3
  br i1 %767, label %768, label %774

; <label>:768:                                    ; preds = %765
  %769 = load i32, i32* %27, align 4
  %770 = icmp eq i32 %769, 0
  br i1 %770, label %771, label %773

; <label>:771:                                    ; preds = %768
  %772 = load i32, i32* %28, align 4
  store i32 %772, i32* %11, align 4
  store i32 0, i32* %28, align 4
  store i32 0, i32* %29, align 4
  store i32 0, i32* %30, align 4
  store i32 0, i32* %31, align 4
  br label %773

; <label>:773:                                    ; preds = %771, %768
  br label %774

; <label>:774:                                    ; preds = %773, %765
  br label %775

; <label>:775:                                    ; preds = %774, %764
  br label %776

; <label>:776:                                    ; preds = %775, %752
  br label %777

; <label>:777:                                    ; preds = %776, %497
  %778 = load i32, i32* %11, align 4
  %779 = load i32, i32* %32, align 4
  %780 = icmp ugt i32 %778, %779
  br i1 %780, label %781, label %783

; <label>:781:                                    ; preds = %777
  %782 = load i32, i32* %11, align 4
  store i32 %782, i32* %32, align 4
  br label %783

; <label>:783:                                    ; preds = %781, %777
  %784 = load i32*, i32** %9, align 8
  %785 = load i32, i32* %19, align 4
  %786 = zext i32 %785 to i64
  %787 = getelementptr inbounds i32, i32* %784, i64 %786
  %788 = load i32, i32* %787, align 4
  %789 = load i32*, i32** %10, align 8
  %790 = getelementptr inbounds i32, i32* %789, i64 2
  store i32 %788, i32* %790, align 4
  %791 = load i16, i16* %18, align 2
  %792 = zext i16 %791 to i32
  %793 = load i32*, i32** %10, align 8
  %794 = getelementptr inbounds i32, i32* %793, i64 3
  store i32 %792, i32* %794, align 4
  %795 = load i32, i32* %11, align 4
  %796 = load i32*, i32** %10, align 8
  %797 = getelementptr inbounds i32, i32* %796, i64 4
  store i32 %795, i32* %797, align 4
  %798 = load i32, i32* %12, align 4
  %799 = load i32*, i32** %10, align 8
  %800 = getelementptr inbounds i32, i32* %799, i64 6
  store i32 %798, i32* %800, align 4
  %801 = load i32, i32* %32, align 4
  %802 = load i32*, i32** %10, align 8
  %803 = getelementptr inbounds i32, i32* %802, i64 7
  store i32 %801, i32* %803, align 4
  %804 = load i32*, i32** @dfi_reg_4, align 8
  %805 = getelementptr inbounds i32, i32* %804, i64 1023
  %806 = load i32, i32* %805, align 4
  %807 = icmp eq i32 %806, 1234
  br i1 %807, label %808, label %809

; <label>:808:                                    ; preds = %783
  ret i8* null

; <label>:809:                                    ; preds = %783
  br label %70
}

; Function Attrs: nounwind readnone
declare dso_local i64 @pthread_self() #8

; Function Attrs: nounwind
declare dso_local signext i32 @pthread_setaffinity_np(i64, i64, %struct.cpu_set_t*) #2

; Function Attrs: noinline optnone
define dso_local void @_Z14init_2core_dfiv() #5 {
  %1 = alloca %struct.cpu_set_t, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i8, align 1
  %9 = alloca i32, align 4
  %10 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.19, i32 0, i32 0))
  %11 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %10, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %12

; <label>:12:                                     ; preds = %0
  %13 = bitcast %struct.cpu_set_t* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %13, i8 0, i64 128, i1 false)
  br label %14

; <label>:14:                                     ; preds = %12
  store i64 0, i64* %2, align 8
  %15 = load i64, i64* %2, align 8
  %16 = udiv i64 %15, 8
  %17 = icmp ult i64 %16, 128
  br i1 %17, label %18, label %29

; <label>:18:                                     ; preds = %14
  %19 = load i64, i64* %2, align 8
  %20 = urem i64 %19, 64
  %21 = shl i64 1, %20
  %22 = getelementptr inbounds %struct.cpu_set_t, %struct.cpu_set_t* %1, i32 0, i32 0
  %23 = getelementptr inbounds [16 x i64], [16 x i64]* %22, i32 0, i32 0
  %24 = load i64, i64* %2, align 8
  %25 = udiv i64 %24, 64
  %26 = getelementptr inbounds i64, i64* %23, i64 %25
  %27 = load i64, i64* %26, align 8
  %28 = or i64 %27, %21
  store i64 %28, i64* %26, align 8
  br label %30

; <label>:29:                                     ; preds = %14
  br label %30

; <label>:30:                                     ; preds = %29, %18
  %31 = phi i64 [ %28, %18 ], [ 0, %29 ]
  store i64 %31, i64* %3, align 8
  %32 = load i64, i64* %3, align 8
  %33 = call i64 @pthread_self() #9
  store i64 %33, i64* %4, align 8
  %34 = load i64, i64* %4, align 8
  %35 = call signext i32 @pthread_setaffinity_np(i64 %34, i64 128, %struct.cpu_set_t* %1) #3
  %36 = call noalias i8* @malloc(i64 64) #3
  %37 = bitcast i8* %36 to i8**
  store i8** %37, i8*** @dfi_reg, align 8
  %38 = call noalias i8* @malloc(i64 4194304) #3
  %39 = load i8**, i8*** @dfi_reg, align 8
  %40 = getelementptr inbounds i8*, i8** %39, i64 0
  store i8* %38, i8** %40, align 8
  %41 = call noalias i8* @malloc(i64 67108864) #3
  %42 = load i8**, i8*** @dfi_reg, align 8
  %43 = getelementptr inbounds i8*, i8** %42, i64 1
  store i8* %41, i8** %43, align 8
  %44 = call noalias i8* @malloc(i64 4194304) #3
  %45 = load i8**, i8*** @dfi_reg, align 8
  %46 = getelementptr inbounds i8*, i8** %45, i64 2
  store i8* %44, i8** %46, align 8
  %47 = call noalias i8* @malloc(i64 4096) #3
  %48 = load i8**, i8*** @dfi_reg, align 8
  %49 = getelementptr inbounds i8*, i8** %48, i64 3
  store i8* %47, i8** %49, align 8
  %50 = call noalias i8* @malloc(i64 4096) #3
  %51 = load i8**, i8*** @dfi_reg, align 8
  %52 = getelementptr inbounds i8*, i8** %51, i64 4
  store i8* %50, i8** %52, align 8
  %53 = load i8**, i8*** @dfi_reg, align 8
  %54 = getelementptr inbounds i8*, i8** %53, i64 0
  %55 = load i8*, i8** %54, align 8
  %56 = bitcast i8* %55 to i32*
  store i32* %56, i32** @dfi_reg_0, align 8
  %57 = load i8**, i8*** @dfi_reg, align 8
  %58 = getelementptr inbounds i8*, i8** %57, i64 1
  %59 = load i8*, i8** %58, align 8
  %60 = bitcast i8* %59 to i32*
  store i32* %60, i32** @dfi_reg_1, align 8
  %61 = load i8**, i8*** @dfi_reg, align 8
  %62 = getelementptr inbounds i8*, i8** %61, i64 2
  %63 = load i8*, i8** %62, align 8
  %64 = bitcast i8* %63 to i32*
  store i32* %64, i32** @dfi_reg_2, align 8
  %65 = load i8**, i8*** @dfi_reg, align 8
  %66 = getelementptr inbounds i8*, i8** %65, i64 3
  %67 = load i8*, i8** %66, align 8
  %68 = bitcast i8* %67 to i32*
  store i32* %68, i32** @dfi_reg_3, align 8
  %69 = load i8**, i8*** @dfi_reg, align 8
  %70 = getelementptr inbounds i8*, i8** %69, i64 4
  %71 = load i8*, i8** %70, align 8
  %72 = bitcast i8* %71 to i32*
  store i32* %72, i32** @dfi_reg_4, align 8
  %73 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  store %struct._IO_FILE* %73, %struct._IO_FILE** %7, align 8
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %75 = icmp eq %struct._IO_FILE* %74, null
  br i1 %75, label %76, label %78

; <label>:76:                                     ; preds = %30
  %77 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 signext 0) #10
  unreachable

; <label>:78:                                     ; preds = %30
  store i32 0, i32* %5, align 4
  store i32 0, i32* %9, align 4
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %80 = call signext i32 @fgetc(%struct._IO_FILE* %79)
  %81 = trunc i32 %80 to i8
  store i8 %81, i8* %8, align 1
  br label %82

; <label>:82:                                     ; preds = %85, %78
  %83 = load i32, i32* %5, align 4
  %84 = icmp ult i32 %83, 4
  br i1 %84, label %85, label %98

; <label>:85:                                     ; preds = %82
  %86 = load i8, i8* %8, align 1
  %87 = load i8**, i8*** @dfi_reg, align 8
  %88 = getelementptr inbounds i8*, i8** %87, i64 2
  %89 = load i8*, i8** %88, align 8
  %90 = load i32, i32* %5, align 4
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8* %89, i64 %91
  store i8 %86, i8* %92, align 1
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %94 = call signext i32 @fgetc(%struct._IO_FILE* %93)
  %95 = trunc i32 %94 to i8
  store i8 %95, i8* %8, align 1
  %96 = load i32, i32* %5, align 4
  %97 = add i32 %96, 1
  store i32 %97, i32* %5, align 4
  br label %82

; <label>:98:                                     ; preds = %82
  %99 = load i8**, i8*** @dfi_reg, align 8
  %100 = getelementptr inbounds i8*, i8** %99, i64 2
  %101 = load i8*, i8** %100, align 8
  %102 = bitcast i8* %101 to i32*
  %103 = getelementptr inbounds i32, i32* %102, i64 0
  %104 = load i32, i32* %103, align 4
  store i32 %104, i32* %9, align 4
  %105 = load i32, i32* %9, align 4
  %106 = and i32 %105, 65535
  %107 = mul i32 4, %106
  store i32 %107, i32* %9, align 4
  br label %108

; <label>:108:                                    ; preds = %112, %98
  %109 = load i32, i32* %5, align 4
  %110 = load i32, i32* %9, align 4
  %111 = icmp ult i32 %109, %110
  br i1 %111, label %112, label %125

; <label>:112:                                    ; preds = %108
  %113 = load i8, i8* %8, align 1
  %114 = load i8**, i8*** @dfi_reg, align 8
  %115 = getelementptr inbounds i8*, i8** %114, i64 2
  %116 = load i8*, i8** %115, align 8
  %117 = load i32, i32* %5, align 4
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds i8, i8* %116, i64 %118
  store i8 %113, i8* %119, align 1
  %120 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %121 = call signext i32 @fgetc(%struct._IO_FILE* %120)
  %122 = trunc i32 %121 to i8
  store i8 %122, i8* %8, align 1
  %123 = load i32, i32* %5, align 4
  %124 = add i32 %123, 1
  store i32 %124, i32* %5, align 4
  br label %108

; <label>:125:                                    ; preds = %108
  %126 = load i8**, i8*** @dfi_reg, align 8
  %127 = getelementptr inbounds i8*, i8** %126, i64 2
  %128 = load i8*, i8** %127, align 8
  %129 = bitcast i8* %128 to i32*
  %130 = load i32, i32* %5, align 4
  %131 = udiv i32 %130, 4
  %132 = sub i32 %131, 1
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32* %129, i64 %133
  %135 = load i32, i32* %134, align 4
  %136 = lshr i32 %135, 16
  %137 = mul i32 4, %136
  store i32 %137, i32* %9, align 4
  br label %138

; <label>:138:                                    ; preds = %142, %125
  %139 = load i32, i32* %5, align 4
  %140 = load i32, i32* %9, align 4
  %141 = icmp ult i32 %139, %140
  br i1 %141, label %142, label %155

; <label>:142:                                    ; preds = %138
  %143 = load i8, i8* %8, align 1
  %144 = load i8**, i8*** @dfi_reg, align 8
  %145 = getelementptr inbounds i8*, i8** %144, i64 2
  %146 = load i8*, i8** %145, align 8
  %147 = load i32, i32* %5, align 4
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds i8, i8* %146, i64 %148
  store i8 %143, i8* %149, align 1
  %150 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %151 = call signext i32 @fgetc(%struct._IO_FILE* %150)
  %152 = trunc i32 %151 to i8
  store i8 %152, i8* %8, align 1
  %153 = load i32, i32* %5, align 4
  %154 = add i32 %153, 1
  store i32 %154, i32* %5, align 4
  br label %138

; <label>:155:                                    ; preds = %138
  %156 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %157 = call signext i32 @fclose(%struct._IO_FILE* %156)
  store volatile i32 0, i32* @dfi_user_start, align 4
  %158 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.20, i32 0, i32 0))
  store i64 0, i64* @dfi_thread_id, align 8
  %159 = call signext i32 @pthread_create(i64* @dfi_thread_id, %union.pthread_attr_t* null, i8* (i8*)* @_Z16execute_dficheckPv, i8* null) #3
  %160 = load i32*, i32** @dfi_reg_0, align 8
  %161 = getelementptr inbounds i32, i32* %160, i64 0
  store i32 12345678, i32* %161, align 4
  store volatile i32 12312312, i32* @dfi_reg_signal, align 4
  %162 = load i32*, i32** @dfi_reg_3, align 8
  %163 = getelementptr inbounds i32, i32* %162, i64 2
  store i32 22332233, i32* %163, align 4
  %164 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %165 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %164, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.21, i32 0, i32 0))
  %166 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %165, i64 ptrtoint (i32* @dfi_reg_signal to i64))
  %167 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %166, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %168 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %169 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %168, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.22, i32 0, i32 0))
  %170 = load i32*, i32** @dfi_reg_0, align 8
  %171 = ptrtoint i32* %170 to i64
  %172 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %169, i64 %171)
  %173 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %172, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %174 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %175 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %174, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.23, i32 0, i32 0))
  %176 = load i32*, i32** @dfi_reg_3, align 8
  %177 = getelementptr inbounds i32, i32* %176, i64 2
  %178 = ptrtoint i32* %177 to i64
  %179 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %175, i64 %178)
  %180 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %179, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %181 = call i8* @llvm.frameaddress(i32 0)
  %182 = ptrtoint i8* %181 to i64
  %183 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.24, i32 0, i32 0), i64 %182)
  br label %184

; <label>:184:                                    ; preds = %187, %155
  %185 = load volatile i32, i32* @dfi_user_start, align 4
  %186 = icmp eq i32 %185, 0
  br i1 %186, label %187, label %188

; <label>:187:                                    ; preds = %184
  br label %184

; <label>:188:                                    ; preds = %184
  %189 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.25, i32 0, i32 0))
  %190 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %189, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  ret void
}

; Function Attrs: nounwind
declare dso_local signext i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #2

; Function Attrs: nounwind readnone
declare i8* @llvm.frameaddress(i32) #9

; Function Attrs: noinline optnone
define dso_local void @_Z13init_soft_dfiv() #5 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.26, i32 0, i32 0))
  %5 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %4, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %6 = call signext i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 signext 1052674)
  store i32 %6, i32* %1, align 4
  %7 = load i32, i32* %1, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %0
  %10 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i32 0, i32 0))
  %11 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %10, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  call void @exit(i32 signext 0) #10
  unreachable

; <label>:12:                                     ; preds = %0
  %13 = load i32, i32* %1, align 4
  %14 = call i8* @mmap(i8* null, i64 100663296, i32 signext 3, i32 signext 1, i32 signext %13, i64 4094181376) #3
  store i8* %14, i8** @vmem, align 8
  %15 = load i8*, i8** @vmem, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %17, label %20

; <label>:17:                                     ; preds = %12
  %18 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0))
  %19 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %18, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  call void @exit(i32 signext 0) #10
  unreachable

; <label>:20:                                     ; preds = %12
  %21 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.27, i32 0, i32 0))
  %22 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %21, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %23 = load i8*, i8** @vmem, align 8
  %24 = bitcast i8* %23 to i16*
  store i16* %24, i16** @dfi_reg_s, align 8
  store i32 0, i32* @dfi_vio, align 4
  call void asm sideeffect ".word 0x4000000b", ""() #3, !srcloc !5
  call void asm sideeffect ".word 0x8000000b", ""() #3, !srcloc !6
  %25 = load i16*, i16** @dfi_reg_s, align 8
  %26 = bitcast i16* %25 to i64*
  %27 = getelementptr inbounds i64, i64* %26, i64 0
  store i64 -1, i64* %27, align 8
  store i64 0, i64* %2, align 8
  br label %28

; <label>:28:                                     ; preds = %32, %20
  %29 = load i64, i64* %2, align 8
  %30 = icmp ult i64 %29, 100000
  br i1 %30, label %31, label %35

; <label>:31:                                     ; preds = %28
  br label %32

; <label>:32:                                     ; preds = %31
  %33 = load i64, i64* %2, align 8
  %34 = add i64 %33, 1
  store i64 %34, i64* %2, align 8
  br label %28

; <label>:35:                                     ; preds = %28
  call void asm sideeffect ".word 0xc000000b", ""() #3, !srcloc !7
  %36 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %37 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %36, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.10, i32 0, i32 0))
  %38 = load i16*, i16** @dfi_reg_s, align 8
  %39 = bitcast i16* %38 to i64*
  %40 = getelementptr inbounds i64, i64* %39, i64 0
  %41 = load i64, i64* %40, align 8
  %42 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %37, i64 %41)
  %43 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %42, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %44 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.16, i32 0, i32 0))
  %45 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %44, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  ret void
}

; Function Attrs: noinline optnone
define dso_local void @_Z12init_ori_dfiv() #5 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0))
  %4 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %3, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %5 = call signext i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 signext 1052674)
  store i32 %5, i32* %1, align 4
  %6 = load i32, i32* %1, align 4
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %11

; <label>:8:                                      ; preds = %0
  %9 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i32 0, i32 0))
  %10 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %9, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  call void @exit(i32 signext 0) #10
  unreachable

; <label>:11:                                     ; preds = %0
  %12 = load i32, i32* %1, align 4
  %13 = call i8* @mmap(i8* null, i64 100663296, i32 signext 3, i32 signext 1, i32 signext %12, i64 4094181376) #3
  store i8* %13, i8** @vmem, align 8
  %14 = load i8*, i8** @vmem, align 8
  %15 = icmp eq i8* %14, null
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %11
  %17 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0))
  %18 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %17, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  call void @exit(i32 signext 0) #10
  unreachable

; <label>:19:                                     ; preds = %11
  %20 = call noalias i8* @malloc(i64 64) #3
  %21 = bitcast i8* %20 to i8**
  store i8** %21, i8*** @dfi_reg, align 8
  %22 = load i8*, i8** @vmem, align 8
  %23 = load i8**, i8*** @dfi_reg, align 8
  %24 = getelementptr inbounds i8*, i8** %23, i64 0
  store i8* %22, i8** %24, align 8
  %25 = load i8*, i8** @vmem, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 4194304
  %27 = load i8**, i8*** @dfi_reg, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 1
  store i8* %26, i8** %28, align 8
  %29 = load i8*, i8** @vmem, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 71303168
  %31 = load i8**, i8*** @dfi_reg, align 8
  %32 = getelementptr inbounds i8*, i8** %31, i64 2
  store i8* %30, i8** %32, align 8
  %33 = load i8**, i8*** @dfi_reg, align 8
  %34 = getelementptr inbounds i8*, i8** %33, i64 0
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast i8* %35 to i32*
  store i32* %36, i32** @dfi_reg_0, align 8
  %37 = load i8**, i8*** @dfi_reg, align 8
  %38 = getelementptr inbounds i8*, i8** %37, i64 1
  %39 = load i8*, i8** %38, align 8
  %40 = bitcast i8* %39 to i32*
  store i32* %40, i32** @dfi_reg_1, align 8
  %41 = load i8**, i8*** @dfi_reg, align 8
  %42 = getelementptr inbounds i8*, i8** %41, i64 2
  %43 = load i8*, i8** %42, align 8
  %44 = bitcast i8* %43 to i32*
  store i32* %44, i32** @dfi_reg_2, align 8
  %45 = load i8**, i8*** @dfi_reg, align 8
  %46 = getelementptr inbounds i8*, i8** %45, i64 3
  %47 = load i8*, i8** %46, align 8
  %48 = bitcast i8* %47 to i32*
  store i32* %48, i32** @dfi_reg_3, align 8
  %49 = load i8**, i8*** @dfi_reg, align 8
  %50 = getelementptr inbounds i8*, i8** %49, i64 4
  %51 = load i8*, i8** %50, align 8
  %52 = bitcast i8* %51 to i32*
  store i32* %52, i32** @dfi_reg_4, align 8
  %53 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %54 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %53, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i32 0, i32 0))
  %55 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %54, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %56 = load i32*, i32** @dfi_reg_1, align 8
  %57 = getelementptr inbounds i32, i32* %56, i64 0
  store i32 12345678, i32* %57, align 4
  call void asm sideeffect ".word 0x4000000b", ""() #3, !srcloc !8
  %58 = load i32*, i32** @dfi_reg_2, align 8
  %59 = getelementptr inbounds i32, i32* %58, i64 0
  store i32 23456789, i32* %59, align 4
  call void asm sideeffect ".word 0x8000000b", ""() #3, !srcloc !9
  %60 = load i32*, i32** @dfi_reg_0, align 8
  %61 = bitcast i32* %60 to i64*
  %62 = getelementptr inbounds i64, i64* %61, i64 0
  store i64 -1, i64* %62, align 8
  store i32 0, i32* %2, align 4
  br label %63

; <label>:63:                                     ; preds = %67, %19
  %64 = load i32, i32* %2, align 4
  %65 = icmp slt i32 %64, 100000
  br i1 %65, label %66, label %70

; <label>:66:                                     ; preds = %63
  br label %67

; <label>:67:                                     ; preds = %66
  %68 = load i32, i32* %2, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %2, align 4
  br label %63

; <label>:70:                                     ; preds = %63
  call void asm sideeffect ".word 0xc000000b", ""() #3, !srcloc !10
  %71 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %72 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %71, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.10, i32 0, i32 0))
  %73 = load i32*, i32** @dfi_reg_0, align 8
  %74 = bitcast i32* %73 to i64*
  %75 = getelementptr inbounds i64, i64* %74, i64 0
  %76 = load i64, i64* %75, align 8
  %77 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %72, i64 %76)
  %78 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %77, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %79 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %80 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %79, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11, i32 0, i32 0))
  %81 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %80, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %82 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %83 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %82, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.12, i32 0, i32 0))
  %84 = load i32*, i32** @dfi_reg_1, align 8
  %85 = ptrtoint i32* %84 to i64
  %86 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %83, i64 %85)
  %87 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %86, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0))
  %88 = load i8**, i8*** @dfi_reg, align 8
  %89 = getelementptr inbounds i8*, i8** %88, i64 1
  %90 = load i8*, i8** %89, align 8
  %91 = getelementptr inbounds i8, i8* %90, i64 67108863
  %92 = ptrtoint i8* %91 to i64
  %93 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %87, i64 %92)
  %94 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %93, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %95 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %96 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %95, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.14, i32 0, i32 0))
  %97 = load i32*, i32** @dfi_reg_2, align 8
  %98 = ptrtoint i32* %97 to i64
  %99 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %96, i64 %98)
  %100 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %99, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0))
  %101 = load i8**, i8*** @dfi_reg, align 8
  %102 = getelementptr inbounds i8*, i8** %101, i64 2
  %103 = load i8*, i8** %102, align 8
  %104 = getelementptr inbounds i8, i8* %103, i64 16777215
  %105 = ptrtoint i8* %104 to i64
  %106 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %100, i64 %105)
  %107 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %106, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %108 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %109 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %108, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.15, i32 0, i32 0))
  %110 = load i32*, i32** @dfi_reg_0, align 8
  %111 = ptrtoint i32* %110 to i64
  %112 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %109, i64 %111)
  %113 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %112, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0))
  %114 = load i8**, i8*** @dfi_reg, align 8
  %115 = getelementptr inbounds i8*, i8** %114, i64 0
  %116 = load i8*, i8** %115, align 8
  %117 = getelementptr inbounds i8, i8* %116, i64 4194303
  %118 = ptrtoint i8* %117 to i64
  %119 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %113, i64 %118)
  %120 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %119, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %121 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.16, i32 0, i32 0))
  %122 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %121, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  ret void
}

; Function Attrs: noinline optnone
define dso_local void @_Z14dfi_rocc_debugv() #5 {
  %1 = alloca i32, align 4
  %2 = alloca i64*, align 8
  %3 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.28, i32 0, i32 0))
  call void asm sideeffect ".word 0xd000000b", ""() #3, !srcloc !11
  store i32 0, i32* %1, align 4
  br label %4

; <label>:4:                                      ; preds = %8, %0
  %5 = load i32, i32* %1, align 4
  %6 = icmp slt i32 %5, 100000
  br i1 %6, label %7, label %11

; <label>:7:                                      ; preds = %4
  br label %8

; <label>:8:                                      ; preds = %7
  %9 = load i32, i32* %1, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %1, align 4
  br label %4

; <label>:11:                                     ; preds = %4
  %12 = load i32*, i32** @dfi_reg_0, align 8
  %13 = bitcast i32* %12 to i64*
  store i64* %13, i64** %2, align 8
  %14 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.29, i32 0, i32 0))
  store i32 0, i32* %1, align 4
  br label %15

; <label>:15:                                     ; preds = %26, %11
  %16 = load i32, i32* %1, align 4
  %17 = icmp slt i32 %16, 60
  br i1 %17, label %18, label %29

; <label>:18:                                     ; preds = %15
  %19 = load i32, i32* %1, align 4
  %20 = load i64*, i64** %2, align 8
  %21 = load i32, i32* %1, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i64, i64* %20, i64 %22
  %24 = load i64, i64* %23, align 8
  %25 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.30, i32 0, i32 0), i32 signext %19, i64 %24)
  br label %26

; <label>:26:                                     ; preds = %18
  %27 = load i32, i32* %1, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %1, align 4
  br label %15

; <label>:29:                                     ; preds = %15
  call void @exit(i32 signext 0) #10
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noinline optnone
define dso_local void @_Z9dfi_debugv() #5 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.31, i32 0, i32 0))
  %20 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %19, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  store i32 0, i32* %1, align 4
  br label %21

; <label>:21:                                     ; preds = %33, %0
  %22 = load i32, i32* %1, align 4
  %23 = icmp slt i32 %22, 100000
  br i1 %23, label %24, label %36

; <label>:24:                                     ; preds = %21
  store i32 0, i32* %2, align 4
  br label %25

; <label>:25:                                     ; preds = %29, %24
  %26 = load i32, i32* %2, align 4
  %27 = icmp slt i32 %26, 500
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %25
  br label %29

; <label>:29:                                     ; preds = %28
  %30 = load i32, i32* %2, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %2, align 4
  br label %25

; <label>:32:                                     ; preds = %25
  br label %33

; <label>:33:                                     ; preds = %32
  %34 = load i32, i32* %1, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %1, align 4
  br label %21

; <label>:36:                                     ; preds = %21
  store i32 0, i32* %3, align 4
  br label %37

; <label>:37:                                     ; preds = %41, %36
  %38 = load i32, i32* %3, align 4
  %39 = icmp slt i32 %38, 100000
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %37
  br label %41

; <label>:41:                                     ; preds = %40
  %42 = load i32, i32* %3, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %3, align 4
  br label %37

; <label>:44:                                     ; preds = %37
  store i32 0, i32* %4, align 4
  br label %45

; <label>:45:                                     ; preds = %49, %44
  %46 = load i32, i32* %4, align 4
  %47 = icmp slt i32 %46, 100000
  br i1 %47, label %48, label %52

; <label>:48:                                     ; preds = %45
  br label %49

; <label>:49:                                     ; preds = %48
  %50 = load i32, i32* %4, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %4, align 4
  br label %45

; <label>:52:                                     ; preds = %45
  %53 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.32, i32 0, i32 0))
  %54 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %53, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  store i32 0, i32* %7, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %10, align 4
  br label %55

; <label>:55:                                     ; preds = %68, %52
  %56 = load i32, i32* %10, align 4
  %57 = icmp slt i32 %56, 20
  br i1 %57, label %58, label %71

; <label>:58:                                     ; preds = %55
  %59 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %60 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %59, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.33, i32 0, i32 0))
  %61 = load i32*, i32** @dfi_reg_0, align 8
  %62 = load i32, i32* %10, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32* %61, i64 %63
  %65 = load i32, i32* %64, align 4
  %66 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %60, i32 signext %65)
  %67 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %66, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %68

; <label>:68:                                     ; preds = %58
  %69 = load i32, i32* %10, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %10, align 4
  br label %55

; <label>:71:                                     ; preds = %55
  store i32 0, i32* %11, align 4
  br label %72

; <label>:72:                                     ; preds = %552, %71
  %73 = load i32, i32* %11, align 4
  %74 = icmp slt i32 %73, 40000
  br i1 %74, label %75, label %555

; <label>:75:                                     ; preds = %72
  %76 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3decRSt8ios_base)
  %77 = load i32, i32* %7, align 4
  %78 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %76, i32 signext %77)
  %79 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %78, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.34, i32 0, i32 0))
  %80 = load i32*, i32** @dfi_reg_0, align 8
  %81 = load i32, i32* %7, align 4
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32* %80, i64 %82
  %84 = load i32, i32* %83, align 4
  %85 = lshr i32 %84, 30
  %86 = and i32 %85, 1
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %245

; <label>:88:                                     ; preds = %75
  store i32 0, i32* %12, align 4
  br label %89

; <label>:89:                                     ; preds = %239, %88
  %90 = load i32, i32* %12, align 4
  %91 = icmp slt i32 %90, 2
  br i1 %91, label %92, label %242

; <label>:92:                                     ; preds = %89
  %93 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %94 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %93, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.35, i32 0, i32 0))
  %95 = load i32*, i32** @dfi_reg_0, align 8
  %96 = load i32, i32* %7, align 4
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32* %95, i64 %97
  %99 = load i32, i32* %98, align 4
  %100 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %94, i32 signext %99)
  %101 = load i32*, i32** @dfi_reg_0, align 8
  %102 = load i32, i32* %7, align 4
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32* %101, i64 %103
  %105 = load i32, i32* %104, align 4
  %106 = load i32, i32* %12, align 4
  %107 = mul nsw i32 15, %106
  %108 = add nsw i32 14, %107
  %109 = lshr i32 %105, %108
  %110 = and i32 %109, 1
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %112, label %114

; <label>:112:                                    ; preds = %92
  %113 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i32 0, i32 0))
  br label %116

; <label>:114:                                    ; preds = %92
  %115 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.37, i32 0, i32 0))
  br label %116

; <label>:116:                                    ; preds = %114, %112
  %117 = load i32*, i32** @dfi_reg_0, align 8
  %118 = load i32, i32* %7, align 4
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32* %117, i64 %119
  %121 = load i32, i32* %120, align 4
  %122 = load i32, i32* %12, align 4
  %123 = mul nsw i32 15, %122
  %124 = add nsw i32 13, %123
  %125 = lshr i32 %121, %124
  %126 = and i32 %125, 1
  %127 = icmp ne i32 %126, 0
  br i1 %127, label %128, label %141

; <label>:128:                                    ; preds = %116
  %129 = load i32, i32* %5, align 4
  %130 = load i32*, i32** @dfi_reg_0, align 8
  %131 = load i32, i32* %7, align 4
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32* %130, i64 %132
  %134 = load i32, i32* %133, align 4
  %135 = load i32, i32* %12, align 4
  %136 = mul nsw i32 15, %135
  %137 = add nsw i32 8, %136
  %138 = lshr i32 %134, %137
  %139 = and i32 %138, 31
  %140 = sub i32 %129, %139
  store i32 %140, i32* %9, align 4
  br label %154

; <label>:141:                                    ; preds = %116
  %142 = load i32, i32* %5, align 4
  %143 = load i32*, i32** @dfi_reg_0, align 8
  %144 = load i32, i32* %7, align 4
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds i32, i32* %143, i64 %145
  %147 = load i32, i32* %146, align 4
  %148 = load i32, i32* %12, align 4
  %149 = mul nsw i32 15, %148
  %150 = add nsw i32 8, %149
  %151 = lshr i32 %147, %150
  %152 = and i32 %151, 31
  %153 = add i32 %142, %152
  store i32 %153, i32* %9, align 4
  br label %154

; <label>:154:                                    ; preds = %141, %128
  %155 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3decRSt8ios_base)
  %156 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %155, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.38, i32 0, i32 0))
  %157 = load i32, i32* %9, align 4
  %158 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %156, i32 signext %157)
  %159 = load i32, i32* %9, align 4
  store i32 %159, i32* %5, align 4
  %160 = load i32*, i32** @dfi_reg_0, align 8
  %161 = load i32, i32* %7, align 4
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds i32, i32* %160, i64 %162
  %164 = load i32, i32* %163, align 4
  %165 = load i32, i32* %12, align 4
  %166 = mul nsw i32 15, %165
  %167 = add nsw i32 7, %166
  %168 = lshr i32 %164, %167
  %169 = and i32 %168, 1
  %170 = icmp ne i32 %169, 0
  br i1 %170, label %171, label %195

; <label>:171:                                    ; preds = %154
  %172 = load i32, i32* %6, align 4
  %173 = load i32*, i32** @dfi_reg_0, align 8
  %174 = load i32, i32* %7, align 4
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds i32, i32* %173, i64 %175
  %177 = load i32, i32* %176, align 4
  %178 = load i32, i32* %12, align 4
  %179 = mul nsw i32 15, %178
  %180 = add nsw i32 3, %179
  %181 = lshr i32 %177, %180
  %182 = and i32 %181, 15
  %183 = load i32*, i32** @dfi_reg_0, align 8
  %184 = load i32, i32* %7, align 4
  %185 = zext i32 %184 to i64
  %186 = getelementptr inbounds i32, i32* %183, i64 %185
  %187 = load i32, i32* %186, align 4
  %188 = load i32, i32* %12, align 4
  %189 = mul nsw i32 15, %188
  %190 = lshr i32 %187, %189
  %191 = and i32 %190, 7
  %192 = mul i32 %191, 4
  %193 = shl i32 %182, %192
  %194 = sub i32 %172, %193
  store i32 %194, i32* %8, align 4
  br label %219

; <label>:195:                                    ; preds = %154
  %196 = load i32, i32* %6, align 4
  %197 = load i32*, i32** @dfi_reg_0, align 8
  %198 = load i32, i32* %7, align 4
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds i32, i32* %197, i64 %199
  %201 = load i32, i32* %200, align 4
  %202 = load i32, i32* %12, align 4
  %203 = mul nsw i32 15, %202
  %204 = add nsw i32 3, %203
  %205 = lshr i32 %201, %204
  %206 = and i32 %205, 15
  %207 = load i32*, i32** @dfi_reg_0, align 8
  %208 = load i32, i32* %7, align 4
  %209 = zext i32 %208 to i64
  %210 = getelementptr inbounds i32, i32* %207, i64 %209
  %211 = load i32, i32* %210, align 4
  %212 = load i32, i32* %12, align 4
  %213 = mul nsw i32 15, %212
  %214 = lshr i32 %211, %213
  %215 = and i32 %214, 7
  %216 = mul i32 %215, 4
  %217 = shl i32 %206, %216
  %218 = add i32 %196, %217
  store i32 %218, i32* %8, align 4
  br label %219

; <label>:219:                                    ; preds = %195, %171
  %220 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %221 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %220, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.39, i32 0, i32 0))
  %222 = load i32, i32* %8, align 4
  %223 = shl i32 %222, 2
  %224 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %221, i32 signext %223)
  %225 = load i32, i32* %8, align 4
  store i32 %225, i32* %6, align 4
  %226 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3decRSt8ios_base)
  %227 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %226, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.40, i32 0, i32 0))
  %228 = load i8**, i8*** @dfi_reg, align 8
  %229 = getelementptr inbounds i8*, i8** %228, i64 1
  %230 = load i8*, i8** %229, align 8
  %231 = bitcast i8* %230 to i16*
  %232 = load i32, i32* %8, align 4
  %233 = and i32 %232, 33554431
  %234 = zext i32 %233 to i64
  %235 = getelementptr inbounds i16, i16* %231, i64 %234
  %236 = load i16, i16* %235, align 2
  %237 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEs(%"class.std::basic_ostream"* %227, i16 signext %236)
  %238 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %237, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %239

; <label>:239:                                    ; preds = %219
  %240 = load i32, i32* %12, align 4
  %241 = add nsw i32 %240, 1
  store i32 %241, i32* %12, align 4
  br label %89

; <label>:242:                                    ; preds = %89
  %243 = load i32, i32* %7, align 4
  %244 = add i32 %243, 1
  store i32 %244, i32* %7, align 4
  br label %551

; <label>:245:                                    ; preds = %75
  %246 = load i32*, i32** @dfi_reg_0, align 8
  %247 = load i32, i32* %7, align 4
  %248 = zext i32 %247 to i64
  %249 = getelementptr inbounds i32, i32* %246, i64 %248
  %250 = load i32, i32* %249, align 4
  %251 = lshr i32 %250, 29
  %252 = and i32 %251, 3
  %253 = icmp eq i32 %252, 0
  br i1 %253, label %254, label %328

; <label>:254:                                    ; preds = %245
  %255 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %256 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %255, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.41, i32 0, i32 0))
  %257 = load i32*, i32** @dfi_reg_0, align 8
  %258 = load i32, i32* %7, align 4
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds i32, i32* %257, i64 %259
  %261 = load i32, i32* %260, align 4
  %262 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %256, i32 signext %261)
  %263 = load i32*, i32** @dfi_reg_0, align 8
  %264 = load i32, i32* %7, align 4
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds i32, i32* %263, i64 %265
  %267 = load i32, i32* %266, align 4
  %268 = lshr i32 %267, 16
  %269 = and i32 %268, 1
  %270 = icmp ne i32 %269, 0
  br i1 %270, label %271, label %273

; <label>:271:                                    ; preds = %254
  %272 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i32 0, i32 0))
  br label %275

; <label>:273:                                    ; preds = %254
  %274 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.37, i32 0, i32 0))
  br label %275

; <label>:275:                                    ; preds = %273, %271
  %276 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3decRSt8ios_base)
  %277 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %276, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.38, i32 0, i32 0))
  %278 = load i32*, i32** @dfi_reg_0, align 8
  %279 = load i32, i32* %7, align 4
  %280 = zext i32 %279 to i64
  %281 = getelementptr inbounds i32, i32* %278, i64 %280
  %282 = load i32, i32* %281, align 4
  %283 = and i32 %282, 65535
  %284 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %277, i32 signext %283)
  %285 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %286 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %285, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.39, i32 0, i32 0))
  %287 = load i32*, i32** @dfi_reg_0, align 8
  %288 = load i32, i32* %7, align 4
  %289 = add i32 %288, 1
  %290 = zext i32 %289 to i64
  %291 = getelementptr inbounds i32, i32* %287, i64 %290
  %292 = load i32, i32* %291, align 4
  %293 = and i32 %292, 2147483647
  %294 = shl i32 %293, 2
  %295 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %286, i32 signext %294)
  %296 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3decRSt8ios_base)
  %297 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %296, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.40, i32 0, i32 0))
  %298 = load i8**, i8*** @dfi_reg, align 8
  %299 = getelementptr inbounds i8*, i8** %298, i64 1
  %300 = load i8*, i8** %299, align 8
  %301 = bitcast i8* %300 to i16*
  %302 = load i32*, i32** @dfi_reg_0, align 8
  %303 = load i32, i32* %7, align 4
  %304 = add i32 %303, 1
  %305 = zext i32 %304 to i64
  %306 = getelementptr inbounds i32, i32* %302, i64 %305
  %307 = load i32, i32* %306, align 4
  %308 = and i32 %307, 33554431
  %309 = zext i32 %308 to i64
  %310 = getelementptr inbounds i16, i16* %301, i64 %309
  %311 = load i16, i16* %310, align 2
  %312 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEs(%"class.std::basic_ostream"* %297, i16 signext %311)
  %313 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %312, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %314 = load i32*, i32** @dfi_reg_0, align 8
  %315 = load i32, i32* %7, align 4
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds i32, i32* %314, i64 %316
  %318 = load i32, i32* %317, align 4
  %319 = and i32 %318, 65535
  store i32 %319, i32* %5, align 4
  %320 = load i32*, i32** @dfi_reg_0, align 8
  %321 = load i32, i32* %7, align 4
  %322 = add i32 %321, 1
  %323 = zext i32 %322 to i64
  %324 = getelementptr inbounds i32, i32* %320, i64 %323
  %325 = load i32, i32* %324, align 4
  store i32 %325, i32* %6, align 4
  %326 = load i32, i32* %7, align 4
  %327 = add i32 %326, 2
  store i32 %327, i32* %7, align 4
  br label %550

; <label>:328:                                    ; preds = %245
  %329 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %330 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %329, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.42, i32 0, i32 0))
  store i32 0, i32* %13, align 4
  store i64 0, i64* %14, align 8
  %331 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3decRSt8ios_base)
  %332 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %331, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.38, i32 0, i32 0))
  %333 = load i32*, i32** @dfi_reg_0, align 8
  %334 = load i32, i32* %7, align 4
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds i32, i32* %333, i64 %335
  %337 = load i32, i32* %336, align 4
  %338 = and i32 %337, 65535
  %339 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %332, i32 signext %338)
  %340 = load i32, i32* %13, align 4
  %341 = add i32 %340, 1
  store i32 %341, i32* %13, align 4
  %342 = load i32*, i32** @dfi_reg_0, align 8
  %343 = load i32, i32* %7, align 4
  %344 = zext i32 %343 to i64
  %345 = getelementptr inbounds i32, i32* %342, i64 %344
  %346 = load i32, i32* %345, align 4
  %347 = lshr i32 %346, 18
  %348 = and i32 %347, 1
  %349 = icmp ne i32 %348, 0
  br i1 %349, label %350, label %383

; <label>:350:                                    ; preds = %328
  %351 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %352 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %351, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.43, i32 0, i32 0))
  %353 = load i32*, i32** @dfi_reg_0, align 8
  %354 = load i32, i32* %7, align 4
  %355 = load i32, i32* %13, align 4
  %356 = add i32 %354, %355
  %357 = zext i32 %356 to i64
  %358 = getelementptr inbounds i32, i32* %353, i64 %357
  %359 = load i32, i32* %358, align 4
  %360 = and i32 %359, 2147483647
  %361 = shl i32 %360, 2
  %362 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %352, i32 signext %361)
  %363 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3decRSt8ios_base)
  %364 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %363, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.40, i32 0, i32 0))
  %365 = load i8**, i8*** @dfi_reg, align 8
  %366 = getelementptr inbounds i8*, i8** %365, i64 1
  %367 = load i8*, i8** %366, align 8
  %368 = bitcast i8* %367 to i16*
  %369 = load i32*, i32** @dfi_reg_0, align 8
  %370 = load i32, i32* %7, align 4
  %371 = load i32, i32* %13, align 4
  %372 = add i32 %370, %371
  %373 = zext i32 %372 to i64
  %374 = getelementptr inbounds i32, i32* %369, i64 %373
  %375 = load i32, i32* %374, align 4
  %376 = and i32 %375, 33554431
  %377 = zext i32 %376 to i64
  %378 = getelementptr inbounds i16, i16* %368, i64 %377
  %379 = load i16, i16* %378, align 2
  %380 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEs(%"class.std::basic_ostream"* %364, i16 signext %379)
  %381 = load i32, i32* %13, align 4
  %382 = add i32 %381, 1
  store i32 %382, i32* %13, align 4
  br label %383

; <label>:383:                                    ; preds = %350, %328
  %384 = load i32*, i32** @dfi_reg_0, align 8
  %385 = load i32, i32* %7, align 4
  %386 = zext i32 %385 to i64
  %387 = getelementptr inbounds i32, i32* %384, i64 %386
  %388 = load i32, i32* %387, align 4
  %389 = lshr i32 %388, 19
  %390 = and i32 %389, 1
  %391 = icmp ne i32 %390, 0
  br i1 %391, label %392, label %425

; <label>:392:                                    ; preds = %383
  %393 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %394 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %393, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.44, i32 0, i32 0))
  %395 = load i32*, i32** @dfi_reg_0, align 8
  %396 = load i32, i32* %7, align 4
  %397 = load i32, i32* %13, align 4
  %398 = add i32 %396, %397
  %399 = zext i32 %398 to i64
  %400 = getelementptr inbounds i32, i32* %395, i64 %399
  %401 = load i32, i32* %400, align 4
  %402 = and i32 %401, 2147483647
  %403 = shl i32 %402, 2
  %404 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %394, i32 signext %403)
  %405 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3decRSt8ios_base)
  %406 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %405, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.40, i32 0, i32 0))
  %407 = load i8**, i8*** @dfi_reg, align 8
  %408 = getelementptr inbounds i8*, i8** %407, i64 1
  %409 = load i8*, i8** %408, align 8
  %410 = bitcast i8* %409 to i16*
  %411 = load i32*, i32** @dfi_reg_0, align 8
  %412 = load i32, i32* %7, align 4
  %413 = load i32, i32* %13, align 4
  %414 = add i32 %412, %413
  %415 = zext i32 %414 to i64
  %416 = getelementptr inbounds i32, i32* %411, i64 %415
  %417 = load i32, i32* %416, align 4
  %418 = and i32 %417, 33554431
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds i16, i16* %410, i64 %419
  %421 = load i16, i16* %420, align 2
  %422 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEs(%"class.std::basic_ostream"* %406, i16 signext %421)
  %423 = load i32, i32* %13, align 4
  %424 = add i32 %423, 1
  store i32 %424, i32* %13, align 4
  br label %425

; <label>:425:                                    ; preds = %392, %383
  %426 = load i32*, i32** @dfi_reg_0, align 8
  %427 = load i32, i32* %7, align 4
  %428 = zext i32 %427 to i64
  %429 = getelementptr inbounds i32, i32* %426, i64 %428
  %430 = load i32, i32* %429, align 4
  %431 = lshr i32 %430, 16
  %432 = and i32 %431, 3
  %433 = icmp eq i32 %432, 1
  br i1 %433, label %434, label %446

; <label>:434:                                    ; preds = %425
  %435 = load i32*, i32** @dfi_reg_0, align 8
  %436 = load i32, i32* %7, align 4
  %437 = load i32, i32* %13, align 4
  %438 = add i32 %436, %437
  %439 = zext i32 %438 to i64
  %440 = getelementptr inbounds i32, i32* %435, i64 %439
  %441 = load i32, i32* %440, align 4
  %442 = and i32 %441, 2147483647
  %443 = zext i32 %442 to i64
  store i64 %443, i64* %14, align 8
  %444 = load i32, i32* %13, align 4
  %445 = add i32 %444, 1
  store i32 %445, i32* %13, align 4
  br label %541

; <label>:446:                                    ; preds = %425
  %447 = load i32*, i32** @dfi_reg_0, align 8
  %448 = load i32, i32* %7, align 4
  %449 = zext i32 %448 to i64
  %450 = getelementptr inbounds i32, i32* %447, i64 %449
  %451 = load i32, i32* %450, align 4
  %452 = lshr i32 %451, 16
  %453 = and i32 %452, 3
  %454 = icmp eq i32 %453, 2
  br i1 %454, label %455, label %492

; <label>:455:                                    ; preds = %446
  %456 = load i32*, i32** @dfi_reg_0, align 8
  %457 = load i32, i32* %7, align 4
  %458 = load i32, i32* %13, align 4
  %459 = add i32 %457, %458
  %460 = zext i32 %459 to i64
  %461 = getelementptr inbounds i32, i32* %456, i64 %460
  %462 = load i32, i32* %461, align 4
  %463 = and i32 %462, 2147483647
  %464 = load i32*, i32** @dfi_reg_0, align 8
  %465 = load i32, i32* %7, align 4
  %466 = load i32, i32* %13, align 4
  %467 = add i32 %465, %466
  %468 = add i32 %467, 1
  %469 = zext i32 %468 to i64
  %470 = getelementptr inbounds i32, i32* %464, i64 %469
  %471 = load i32, i32* %470, align 4
  %472 = and i32 %471, 1
  %473 = shl i32 %472, 31
  %474 = or i32 %463, %473
  %475 = zext i32 %474 to i64
  store i64 %475, i64* %14, align 8
  %476 = load i32*, i32** @dfi_reg_0, align 8
  %477 = load i32, i32* %7, align 4
  %478 = load i32, i32* %13, align 4
  %479 = add i32 %477, %478
  %480 = add i32 %479, 1
  %481 = zext i32 %480 to i64
  %482 = getelementptr inbounds i32, i32* %476, i64 %481
  %483 = load i32, i32* %482, align 4
  %484 = and i32 %483, 2147483647
  %485 = lshr i32 %484, 1
  %486 = shl i32 %485, 32
  %487 = zext i32 %486 to i64
  %488 = load i64, i64* %14, align 8
  %489 = or i64 %488, %487
  store i64 %489, i64* %14, align 8
  %490 = load i32, i32* %13, align 4
  %491 = add i32 %490, 2
  store i32 %491, i32* %13, align 4
  br label %540

; <label>:492:                                    ; preds = %446
  %493 = load i32*, i32** @dfi_reg_0, align 8
  %494 = load i32, i32* %7, align 4
  %495 = load i32, i32* %13, align 4
  %496 = add i32 %494, %495
  %497 = zext i32 %496 to i64
  %498 = getelementptr inbounds i32, i32* %493, i64 %497
  %499 = load i32, i32* %498, align 4
  %500 = and i32 %499, 2147483647
  %501 = load i32*, i32** @dfi_reg_0, align 8
  %502 = load i32, i32* %7, align 4
  %503 = load i32, i32* %13, align 4
  %504 = add i32 %502, %503
  %505 = add i32 %504, 1
  %506 = zext i32 %505 to i64
  %507 = getelementptr inbounds i32, i32* %501, i64 %506
  %508 = load i32, i32* %507, align 4
  %509 = and i32 %508, 1
  %510 = shl i32 %509, 31
  %511 = or i32 %500, %510
  %512 = zext i32 %511 to i64
  store i64 %512, i64* %14, align 8
  %513 = load i32*, i32** @dfi_reg_0, align 8
  %514 = load i32, i32* %7, align 4
  %515 = load i32, i32* %13, align 4
  %516 = add i32 %514, %515
  %517 = add i32 %516, 1
  %518 = zext i32 %517 to i64
  %519 = getelementptr inbounds i32, i32* %513, i64 %518
  %520 = load i32, i32* %519, align 4
  %521 = and i32 %520, 2147483647
  %522 = lshr i32 %521, 1
  %523 = load i32*, i32** @dfi_reg_0, align 8
  %524 = load i32, i32* %7, align 4
  %525 = load i32, i32* %13, align 4
  %526 = add i32 %524, %525
  %527 = add i32 %526, 2
  %528 = zext i32 %527 to i64
  %529 = getelementptr inbounds i32, i32* %523, i64 %528
  %530 = load i32, i32* %529, align 4
  %531 = and i32 %530, 3
  %532 = shl i32 %531, 30
  %533 = or i32 %522, %532
  %534 = shl i32 %533, 32
  %535 = zext i32 %534 to i64
  %536 = load i64, i64* %14, align 8
  %537 = or i64 %536, %535
  store i64 %537, i64* %14, align 8
  %538 = load i32, i32* %13, align 4
  %539 = add i32 %538, 3
  store i32 %539, i32* %13, align 4
  br label %540

; <label>:540:                                    ; preds = %492, %455
  br label %541

; <label>:541:                                    ; preds = %540, %434
  %542 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %543 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %542, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.45, i32 0, i32 0))
  %544 = load i64, i64* %14, align 8
  %545 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %543, i64 %544)
  %546 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %545, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %547 = load i32, i32* %13, align 4
  %548 = load i32, i32* %7, align 4
  %549 = add i32 %548, %547
  store i32 %549, i32* %7, align 4
  br label %550

; <label>:550:                                    ; preds = %541, %275
  br label %551

; <label>:551:                                    ; preds = %550, %242
  br label %552

; <label>:552:                                    ; preds = %551
  %553 = load i32, i32* %11, align 4
  %554 = add nsw i32 %553, 1
  store i32 %554, i32* %11, align 4
  br label %72

; <label>:555:                                    ; preds = %72
  %556 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.46, i32 0, i32 0))
  %557 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %556, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %558 = load i8**, i8*** @dfi_reg, align 8
  %559 = getelementptr inbounds i8*, i8** %558, i64 2
  %560 = load i8*, i8** %559, align 8
  %561 = bitcast i8* %560 to i32*
  %562 = getelementptr inbounds i32, i32* %561, i64 0
  %563 = load i32, i32* %562, align 4
  %564 = and i32 %563, 65535
  store i32 %564, i32* %15, align 4
  store i32 0, i32* %16, align 4
  br label %565

; <label>:565:                                    ; preds = %610, %555
  %566 = load i32, i32* %16, align 4
  %567 = load i32, i32* %15, align 4
  %568 = icmp slt i32 %566, %567
  br i1 %568, label %569, label %613

; <label>:569:                                    ; preds = %565
  %570 = load i32, i32* %16, align 4
  %571 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 signext %570)
  %572 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %571, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.34, i32 0, i32 0))
  %573 = load i8**, i8*** @dfi_reg, align 8
  %574 = getelementptr inbounds i8*, i8** %573, i64 2
  %575 = load i8*, i8** %574, align 8
  %576 = bitcast i8* %575 to i32*
  %577 = load i32, i32* %16, align 4
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds i32, i32* %576, i64 %578
  %580 = load i32, i32* %579, align 4
  %581 = and i32 %580, 65535
  store i32 %581, i32* %17, align 4
  br label %582

; <label>:582:                                    ; preds = %605, %569
  %583 = load i32, i32* %17, align 4
  %584 = load i8**, i8*** @dfi_reg, align 8
  %585 = getelementptr inbounds i8*, i8** %584, i64 2
  %586 = load i8*, i8** %585, align 8
  %587 = bitcast i8* %586 to i32*
  %588 = load i32, i32* %16, align 4
  %589 = sext i32 %588 to i64
  %590 = getelementptr inbounds i32, i32* %587, i64 %589
  %591 = load i32, i32* %590, align 4
  %592 = ashr i32 %591, 16
  %593 = icmp slt i32 %583, %592
  br i1 %593, label %594, label %608

; <label>:594:                                    ; preds = %582
  %595 = load i8**, i8*** @dfi_reg, align 8
  %596 = getelementptr inbounds i8*, i8** %595, i64 2
  %597 = load i8*, i8** %596, align 8
  %598 = bitcast i8* %597 to i32*
  %599 = load i32, i32* %17, align 4
  %600 = sext i32 %599 to i64
  %601 = getelementptr inbounds i32, i32* %598, i64 %600
  %602 = load i32, i32* %601, align 4
  %603 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 signext %602)
  %604 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %603, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.47, i32 0, i32 0))
  br label %605

; <label>:605:                                    ; preds = %594
  %606 = load i32, i32* %17, align 4
  %607 = add nsw i32 %606, 1
  store i32 %607, i32* %17, align 4
  br label %582

; <label>:608:                                    ; preds = %582
  %609 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %610

; <label>:610:                                    ; preds = %608
  %611 = load i32, i32* %16, align 4
  %612 = add nsw i32 %611, 1
  store i32 %612, i32* %16, align 4
  br label %565

; <label>:613:                                    ; preds = %565
  %614 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.48, i32 0, i32 0))
  %615 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %614, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  store i32 0, i32* %18, align 4
  br label %616

; <label>:616:                                    ; preds = %631, %613
  %617 = load i32, i32* %18, align 4
  %618 = icmp slt i32 %617, 25
  br i1 %618, label %619, label %634

; <label>:619:                                    ; preds = %616
  %620 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3decRSt8ios_base)
  %621 = load i32, i32* %18, align 4
  %622 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %620, i32 signext %621)
  %623 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %622, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.34, i32 0, i32 0))
  %624 = load i32*, i32** @dfi_reg_4, align 8
  %625 = load i32, i32* %18, align 4
  %626 = sext i32 %625 to i64
  %627 = getelementptr inbounds i32, i32* %624, i64 %626
  %628 = load i32, i32* %627, align 4
  %629 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %623, i32 signext %628)
  %630 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %629, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  br label %631

; <label>:631:                                    ; preds = %619
  %632 = load i32, i32* %18, align 4
  %633 = add nsw i32 %632, 1
  store i32 %633, i32* %18, align 4
  br label %616

; <label>:634:                                    ; preds = %616
  ret void
}

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"*, i32 signext) #1

; Function Attrs: noinline optnone
define linkonce_odr dso_local dereferenceable(216) %"class.std::ios_base"* @_ZSt3decRSt8ios_base(%"class.std::ios_base"* dereferenceable(216)) #5 comdat {
  %2 = alloca %"class.std::ios_base"*, align 8
  store %"class.std::ios_base"* %0, %"class.std::ios_base"** %2, align 8
  %3 = load %"class.std::ios_base"*, %"class.std::ios_base"** %2, align 8
  %4 = call signext i32 @_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_(%"class.std::ios_base"* %3, i32 signext 2, i32 signext 74)
  %5 = load %"class.std::ios_base"*, %"class.std::ios_base"** %2, align 8
  ret %"class.std::ios_base"* %5
}

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEs(%"class.std::basic_ostream"*, i16 signext) #1

; Function Attrs: noinline optnone
define dso_local void @_Z18dfi_rocc_stlddebugj(i32 signext) #5 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %4 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.49, i32 0, i32 0))
  %5 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSt8ios_baseS0_E(%"class.std::basic_ostream"* %4, %"class.std::ios_base"* (%"class.std::ios_base"*)* @_ZSt3hexRSt8ios_base)
  %6 = load i32, i32* %2, align 4
  %7 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEj(%"class.std::basic_ostream"* %5, i32 signext %6)
  %8 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %7, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  store i32 0, i32* %3, align 4
  br label %9

; <label>:9:                                      ; preds = %13, %1
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %10, 100000
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %9
  br label %13

; <label>:13:                                     ; preds = %12
  %14 = load i32, i32* %3, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %3, align 4
  br label %9

; <label>:16:                                     ; preds = %9
  ret void
}

; Function Attrs: noinline optnone
define linkonce_odr dso_local signext i32 @_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_(%"class.std::ios_base"*, i32 signext, i32 signext) #5 comdat align 2 {
  %4 = alloca %"class.std::ios_base"*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %"class.std::ios_base"* %0, %"class.std::ios_base"** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %8 = load %"class.std::ios_base"*, %"class.std::ios_base"** %4, align 8
  %9 = getelementptr inbounds %"class.std::ios_base", %"class.std::ios_base"* %8, i32 0, i32 3
  %10 = load i32, i32* %9, align 8
  store i32 %10, i32* %7, align 4
  %11 = load i32, i32* %6, align 4
  %12 = call signext i32 @_ZStcoSt13_Ios_Fmtflags(i32 signext %11)
  %13 = getelementptr inbounds %"class.std::ios_base", %"class.std::ios_base"* %8, i32 0, i32 3
  %14 = call dereferenceable(4) i32* @_ZStaNRSt13_Ios_FmtflagsS_(i32* dereferenceable(4) %13, i32 signext %12)
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %6, align 4
  %17 = call signext i32 @_ZStanSt13_Ios_FmtflagsS_(i32 signext %15, i32 signext %16)
  %18 = getelementptr inbounds %"class.std::ios_base", %"class.std::ios_base"* %8, i32 0, i32 3
  %19 = call dereferenceable(4) i32* @_ZStoRRSt13_Ios_FmtflagsS_(i32* dereferenceable(4) %18, i32 signext %17)
  %20 = load i32, i32* %7, align 4
  ret i32 %20
}

; Function Attrs: noinline optnone
define linkonce_odr dso_local dereferenceable(4) i32* @_ZStaNRSt13_Ios_FmtflagsS_(i32* dereferenceable(4), i32 signext) #5 comdat {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32*, i32** %3, align 8
  %6 = load i32, i32* %5, align 4
  %7 = load i32, i32* %4, align 4
  %8 = call signext i32 @_ZStanSt13_Ios_FmtflagsS_(i32 signext %6, i32 signext %7)
  %9 = load i32*, i32** %3, align 8
  store i32 %8, i32* %9, align 4
  ret i32* %9
}

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local signext i32 @_ZStcoSt13_Ios_Fmtflags(i32 signext) #4 comdat {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = xor i32 %3, -1
  ret i32 %4
}

; Function Attrs: noinline optnone
define linkonce_odr dso_local dereferenceable(4) i32* @_ZStoRRSt13_Ios_FmtflagsS_(i32* dereferenceable(4), i32 signext) #5 comdat {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32*, i32** %3, align 8
  %6 = load i32, i32* %5, align 4
  %7 = load i32, i32* %4, align 4
  %8 = call signext i32 @_ZStorSt13_Ios_FmtflagsS_(i32 signext %6, i32 signext %7)
  %9 = load i32*, i32** %3, align 8
  store i32 %8, i32* %9, align 4
  ret i32* %9
}

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local signext i32 @_ZStanSt13_Ios_FmtflagsS_(i32 signext, i32 signext) #4 comdat {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = load i32, i32* %4, align 4
  %7 = and i32 %5, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local signext i32 @_ZStorSt13_Ios_FmtflagsS_(i32 signext, i32 signext) #4 comdat {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = load i32, i32* %4, align 4
  %7 = or i32 %5, %6
  ret i32 %7
}

; Function Attrs: noinline
define internal void @_GLOBAL__sub_I_dfi_inst.cc() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nounwind }
attributes #8 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind readnone }
attributes #10 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
!2 = !{i32 2771}
!3 = !{i32 2826}
!4 = !{i32 2976}
!5 = !{i32 15346}
!6 = !{i32 15372}
!7 = !{i32 15522}
!8 = !{i32 16471}
!9 = !{i32 16526}
!10 = !{i32 16676}
!11 = !{i32 17440}
