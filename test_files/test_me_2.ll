; ModuleID = 'test_me_2.bc'
source_filename = "test_me.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"My main job is to 'wow' you...\0A\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"-- running [%d].\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"time_spent: %lf\0A\00", align 1
@0 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@1 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@2 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@3 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@4 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@5 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@6 = private unnamed_addr constant [12 x i8] c"Output: %d\0A\00"
@7 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@8 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@9 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@10 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@11 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@12 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@13 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@14 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@15 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@16 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@17 = private unnamed_addr constant [12 x i8] c"Output: %d\0A\00"
@18 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@19 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@20 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@21 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@22 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@23 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@24 = private unnamed_addr constant [12 x i8] c"Output: %d\0A\00"
@25 = private unnamed_addr constant [12 x i8] c"Output: %d\0A\00"
@26 = private unnamed_addr constant [12 x i8] c"Output: %d\0A\00"
@27 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@28 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@29 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@30 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@31 = private unnamed_addr constant [7 x i8] c"[ERR]\0A\00"
@32 = private unnamed_addr constant [14 x i8] c"[PASS] ~ OK.\0A\00"
@33 = private unnamed_addr constant [12 x i8] c"Output: %d\0A\00"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @wow() #0 {
entry:
  %canary = add i32 251, 557
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  %check_canary = add i32 251, 557
  %res = icmp eq i32 %canary, %check_canary
  br i1 %res, label %term.bypass, label %term.kill

while.cond:                                       ; preds = %term.bypass21, %term.bypass
  %canary3 = add i32 521, 792
  %0 = load i32, i32* %i, align 4
  %canary5 = xor i32 %0, %canary3
  %cmp = icmp slt i32 %0, 10
  %canary6 = xor i32 %0, %canary5
  %check_canary4 = add i32 521, 792
  %res7 = icmp eq i32 %canary6, %check_canary4
  br i1 %res7, label %term.bypass10, label %term.kill8

while.body:                                       ; preds = %term.bypass10
  %canary12 = add i32 415, 866
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0))
  %1 = load i32, i32* %i, align 4
  %canary14 = xor i32 %1, %canary12
  %inc = add nsw i32 %1, 1
  %canary15 = xor i32 %inc, %canary14
  store i32 %inc, i32* %i, align 4
  %canary16 = xor i32 %1, %canary15
  %canary17 = xor i32 %inc, %canary16
  %check_canary13 = add i32 415, 866
  %res18 = icmp eq i32 %canary17, %check_canary13
  br i1 %res18, label %term.bypass21, label %term.kill19

term.kill:                                        ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @0, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass:                                      ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @1, i32 0, i32 0))
  br label %while.cond

term.kill8:                                       ; preds = %while.cond
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @2, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass10:                                    ; preds = %while.cond
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @3, i32 0, i32 0))
  br i1 %cmp, label %while.body, label %while.end

term.kill19:                                      ; preds = %while.body
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @4, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass21:                                    ; preds = %while.body
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @5, i32 0, i32 0))
  br label %while.cond

while.end:                                        ; preds = %term.bypass10
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @6, i32 0, i32 0), i32 5)
  %canary23 = add i32 335, 435
  %check_canary24 = add i32 335, 435
  %res25 = icmp eq i32 %canary23, %check_canary24
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @holy_smokes() #0 {
entry:
  %canary = add i32 251, 557
  %i = alloca i32, align 4
  store i32 100, i32* %i, align 4
  %check_canary = add i32 251, 557
  %res = icmp eq i32 %canary, %check_canary
  br i1 %res, label %term.bypass, label %term.kill

for.cond:                                         ; preds = %term.bypass41, %term.bypass
  %canary4 = add i32 521, 792
  %0 = load i32, i32* %i, align 4
  %canary6 = xor i32 %0, %canary4
  %cmp = icmp sgt i32 %0, 0
  %canary7 = xor i32 %0, %canary6
  %check_canary5 = add i32 521, 792
  %res8 = icmp eq i32 %canary7, %check_canary5
  br i1 %res8, label %term.bypass11, label %term.kill9

for.body:                                         ; preds = %term.bypass11
  %canary13 = add i32 415, 866
  %call = call i64 @time(i64* null) #5
  %conv = trunc i64 %call to i32
  call void @srand(i32 %conv) #5
  %call1 = call i32 @rand() #5
  %rem = srem i32 %call1, 100
  %canary15 = xor i32 %rem, %canary13
  %cmp2 = icmp eq i32 %rem, 23
  %canary16 = xor i32 %rem, %canary15
  %check_canary14 = add i32 415, 866
  %res17 = icmp eq i32 %canary16, %check_canary14
  br i1 %res17, label %term.bypass20, label %term.kill18

if.then:                                          ; preds = %term.bypass20
  %canary22 = add i32 335, 435
  call void @exit(i32 -1) #4
  %check_canary23 = add i32 335, 435
  %res24 = icmp eq i32 %canary22, %check_canary23
  unreachable

if.end:                                           ; preds = %term.bypass20
  %canary25 = add i32 78, 342
  %check_canary26 = add i32 78, 342
  %res27 = icmp eq i32 %canary25, %check_canary26
  br i1 %res27, label %term.bypass30, label %term.kill28

for.inc:                                          ; preds = %term.bypass30
  %canary32 = add i32 137, 609
  %1 = load i32, i32* %i, align 4
  %canary34 = xor i32 %1, %canary32
  %dec = add nsw i32 %1, -1
  %canary35 = xor i32 %dec, %canary34
  store i32 %dec, i32* %i, align 4
  %canary36 = xor i32 %1, %canary35
  %canary37 = xor i32 %dec, %canary36
  %check_canary33 = add i32 137, 609
  %res38 = icmp eq i32 %canary37, %check_canary33
  br i1 %res38, label %term.bypass41, label %term.kill39

term.kill:                                        ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @7, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass:                                      ; preds = %entry
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @8, i32 0, i32 0))
  br label %for.cond

term.kill9:                                       ; preds = %for.cond
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @9, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass11:                                    ; preds = %for.cond
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @10, i32 0, i32 0))
  br i1 %cmp, label %for.body, label %for.end

term.kill18:                                      ; preds = %for.body
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @11, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass20:                                    ; preds = %for.body
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @12, i32 0, i32 0))
  br i1 %cmp2, label %if.then, label %if.end

term.kill28:                                      ; preds = %if.end
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @13, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass30:                                    ; preds = %if.end
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @14, i32 0, i32 0))
  br label %for.inc

term.kill39:                                      ; preds = %for.inc
  %call40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @15, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass41:                                    ; preds = %for.inc
  %call42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @16, i32 0, i32 0))
  br label %for.cond

for.end:                                          ; preds = %term.bypass11
  %call46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @17, i32 0, i32 0), i32 5)
  %canary43 = add i32 791, 203
  %check_canary44 = add i32 791, 203
  %res45 = icmp eq i32 %canary43, %check_canary44
  ret void
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @foo(i32 %a1, i32 %a2) #0 {
entry:
  %canary = add i32 251, 557
  %retval = alloca float, align 4
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  %0 = load i32, i32* %a1.addr, align 4
  %canary1 = xor i32 %0, %canary
  %cmp = icmp sle i32 %0, 0
  %canary2 = xor i32 %0, %canary1
  %check_canary = add i32 251, 557
  %res = icmp eq i32 %canary2, %check_canary
  br i1 %res, label %term.bypass, label %term.kill

if.then:                                          ; preds = %term.bypass
  %canary5 = add i32 521, 792
  %1 = load i32, i32* %a2.addr, align 4
  %canary7 = xor i32 %1, %canary5
  %conv = sitofp i32 %1 to double
  %mul = fmul double %conv, 3.124000e+00
  %conv8 = fptosi double %mul to i32
  %canary9 = xor i32 %conv8, %canary7
  %conv1 = fptrunc double %mul to float
  store float %conv1, float* %retval, align 4
  %canary10 = xor i32 %1, %canary9
  %canary11 = xor i32 %conv8, %canary10
  %check_canary6 = add i32 521, 792
  %res12 = icmp eq i32 %canary11, %check_canary6
  br i1 %res12, label %term.bypass15, label %term.kill13

if.else:                                          ; preds = %term.bypass
  %canary17 = add i32 415, 866
  %2 = load i32, i32* %a1.addr, align 4
  %canary19 = xor i32 %2, %canary17
  %3 = load i32, i32* %a2.addr, align 4
  %canary20 = xor i32 %3, %canary19
  %sub = sub nsw i32 %2, %3
  %canary21 = xor i32 %sub, %canary20
  %4 = load i32, i32* %a2.addr, align 4
  %canary22 = xor i32 %4, %canary21
  %call = call float @foo(i32 %sub, i32 %4)
  store float %call, float* %retval, align 4
  %canary23 = xor i32 %2, %canary22
  %canary24 = xor i32 %3, %canary23
  %canary25 = xor i32 %sub, %canary24
  %canary26 = xor i32 %4, %canary25
  %check_canary18 = add i32 415, 866
  %res27 = icmp eq i32 %canary26, %check_canary18
  br i1 %res27, label %term.bypass30, label %term.kill28

term.kill:                                        ; preds = %entry
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @18, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass:                                      ; preds = %entry
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @19, i32 0, i32 0))
  br i1 %cmp, label %if.then, label %if.else

term.kill13:                                      ; preds = %if.then
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @20, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass15:                                    ; preds = %if.then
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @21, i32 0, i32 0))
  br label %return

term.kill28:                                      ; preds = %if.else
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @22, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass30:                                    ; preds = %if.else
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @23, i32 0, i32 0))
  br label %return

return:                                           ; preds = %term.bypass30, %term.bypass15
  %call38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @24, i32 0, i32 0), i32 5)
  %canary32 = add i32 335, 435
  %5 = load float, float* %retval, align 4
  %conv34 = fptosi float %5 to i32
  %canary35 = xor i32 %conv34, %canary32
  %canary36 = xor i32 %conv34, %canary35
  %check_canary33 = add i32 335, 435
  %res37 = icmp eq i32 %canary36, %check_canary33
  ret float %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @bar(i32 %a1) #0 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @25, i32 0, i32 0), i32 5)
  %canary = add i32 251, 557
  %a1.addr = alloca i32, align 4
  store i32 %a1, i32* %a1.addr, align 4
  %0 = load i32, i32* %a1.addr, align 4
  %canary1 = xor i32 %0, %canary
  %conv = sitofp i32 %0 to double
  %mul = fmul double 1.230000e+02, %conv
  %conv2 = fptosi double %mul to i32
  %canary3 = xor i32 %conv2, %canary1
  %conv1 = fptrunc double %mul to float
  %canary4 = xor i32 %0, %canary3
  %canary5 = xor i32 %conv2, %canary4
  %check_canary = add i32 251, 557
  %res = icmp eq i32 %canary5, %check_canary
  ret float %conv1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @square_n(i32 %n) #0 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @26, i32 0, i32 0), i32 5)
  %canary = add i32 251, 557
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %canary1 = xor i32 %0, %canary
  %1 = load i32, i32* %n.addr, align 4
  %canary2 = xor i32 %1, %canary1
  %mul = mul nsw i32 %0, %1
  %canary3 = xor i32 %mul, %canary2
  %canary4 = xor i32 %0, %canary3
  %canary5 = xor i32 %1, %canary4
  %canary6 = xor i32 %mul, %canary5
  %check_canary = add i32 251, 557
  %res = icmp eq i32 %canary6, %check_canary
  ret i32 %mul
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @binary_search(float %node_val) #0 {
entry:
  %canary = add i32 251, 557
  %retval = alloca i32, align 4
  %node_val.addr = alloca float, align 4
  store float %node_val, float* %node_val.addr, align 4
  %0 = load float, float* %node_val.addr, align 4
  %conv = fptosi float %0 to i32
  %canary1 = xor i32 %conv, %canary
  %cmp = fcmp olt float %0, 2.000000e+01
  %canary2 = xor i32 %conv, %canary1
  %check_canary = add i32 251, 557
  %res = icmp eq i32 %canary2, %check_canary
  br i1 %res, label %term.bypass, label %term.kill

if.then:                                          ; preds = %term.bypass
  %canary4 = add i32 521, 792
  store i32 0, i32* %retval, align 4
  %check_canary5 = add i32 521, 792
  %res6 = icmp eq i32 %canary4, %check_canary5
  br i1 %res6, label %term.bypass9, label %term.kill7

if.else:                                          ; preds = %term.bypass
  %canary11 = add i32 415, 866
  store i32 1, i32* %retval, align 4
  %check_canary12 = add i32 415, 866
  %res13 = icmp eq i32 %canary11, %check_canary12
  br i1 %res13, label %term.bypass16, label %term.kill14

term.kill:                                        ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @27, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass:                                      ; preds = %entry
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @28, i32 0, i32 0))
  br i1 %cmp, label %if.then, label %if.else

term.kill7:                                       ; preds = %if.then
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @29, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass9:                                     ; preds = %if.then
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @30, i32 0, i32 0))
  br label %return

term.kill14:                                      ; preds = %if.else
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @31, i32 0, i32 0))
  call void @llvm.trap()
  unreachable

term.bypass16:                                    ; preds = %if.else
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @32, i32 0, i32 0))
  br label %return

return:                                           ; preds = %term.bypass16, %term.bypass9
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @33, i32 0, i32 0), i32 5)
  %canary18 = add i32 335, 435
  %1 = load i32, i32* %retval, align 4
  %canary20 = xor i32 %1, %canary18
  %canary21 = xor i32 %1, %canary20
  %check_canary19 = add i32 335, 435
  %res22 = icmp eq i32 %canary21, %check_canary19
  ret i32 %1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %time_spent = alloca double, align 8
  %begin = alloca i64, align 8
  %end = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  %call = call i64 @clock() #5
  store i64 %call, i64* %begin, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 12)
  call void @wow()
  %call2 = call float @foo(i32 100, i32 1)
  %call3 = call i64 @clock() #5
  store i64 %call3, i64* %end, align 8
  %0 = load i64, i64* %end, align 8
  %1 = load i64, i64* %begin, align 8
  %sub = sub nsw i64 %0, %1
  %conv = sitofp i64 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  store double %div, double* %time_spent, align 8
  %2 = load double, double* %time_spent, align 8
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0), double %2)
  ret i32 1
}

; Function Attrs: nounwind
declare dso_local i64 @clock() #2

; Function Attrs: noreturn nounwind
declare void @llvm.trap() #4

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 328283)"}
