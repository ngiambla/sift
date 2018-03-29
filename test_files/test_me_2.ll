; ModuleID = 'test_me_2.bc'
source_filename = "test_me.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"My main job is to 'wow' you...\0A\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"-- running [%d].\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"time_spent: %lf\0A\00", align 1
@0 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@1 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@2 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@3 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@4 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@5 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@6 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@7 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@8 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@9 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@10 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@11 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@12 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@13 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@14 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@15 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@16 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@17 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@18 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@19 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@20 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@21 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@22 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@23 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@24 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@25 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@26 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@27 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@28 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@29 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@30 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@31 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@32 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@33 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@34 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@35 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@36 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@37 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@38 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@39 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"
@40 = private unnamed_addr constant [32 x i8] c"[err] - canary does not match.\0A\00"
@41 = private unnamed_addr constant [21 x i8] c"[pass] status ~ OK.\0A\00"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @wow() #0 {
entry:
  %canary = add i32 350, 548
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  %check_canary = add i32 350, 548
  %res = icmp eq i32 %canary, %check_canary
  br i1 %res, label %term.bypass, label %term.kill

while.cond:                                       ; preds = %term.bypass21, %term.bypass
  %canary3 = add i32 936, 115
  %0 = load i32, i32* %i, align 4
  %canary5 = xor i32 %0, %canary3
  %cmp = icmp slt i32 %0, 10
  %canary6 = xor i32 %0, %canary5
  %check_canary4 = add i32 936, 115
  %res7 = icmp eq i32 %canary6, %check_canary4
  br i1 %res7, label %term.bypass10, label %term.kill8

while.body:                                       ; preds = %term.bypass10
  %canary12 = add i32 957, 374
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0))
  %1 = load i32, i32* %i, align 4
  %canary14 = xor i32 %1, %canary12
  %inc = add nsw i32 %1, 1
  %canary15 = xor i32 %inc, %canary14
  store i32 %inc, i32* %i, align 4
  %canary16 = xor i32 %1, %canary15
  %canary17 = xor i32 %inc, %canary16
  %check_canary13 = add i32 957, 374
  %res18 = icmp eq i32 %canary17, %check_canary13
  br i1 %res18, label %term.bypass21, label %term.kill19

while.end:                                        ; preds = %term.bypass10
  %canary23 = add i32 735, 57
  %check_canary24 = add i32 735, 57
  %res25 = icmp eq i32 %canary23, %check_canary24
  br i1 %res25, label %term.bypass28, label %term.kill26

term.kill:                                        ; preds = %entry, %term.kill
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @0, i32 0, i32 0))
  br label %term.kill

term.bypass:                                      ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @1, i32 0, i32 0))
  br label %while.cond

term.kill8:                                       ; preds = %while.cond, %term.kill8
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @2, i32 0, i32 0))
  br label %term.kill8

term.bypass10:                                    ; preds = %while.cond
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @3, i32 0, i32 0))
  br i1 %cmp, label %while.body, label %while.end

term.kill19:                                      ; preds = %while.body, %term.kill19
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @4, i32 0, i32 0))
  br label %term.kill19

term.bypass21:                                    ; preds = %while.body
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @5, i32 0, i32 0))
  br label %while.cond

term.kill26:                                      ; preds = %while.end, %term.kill26
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @6, i32 0, i32 0))
  br label %term.kill26

term.bypass28:                                    ; preds = %while.end
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @7, i32 0, i32 0))
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @holy_smokes() #0 {
entry:
  %canary = add i32 350, 548
  %i = alloca i32, align 4
  store i32 100, i32* %i, align 4
  %check_canary = add i32 350, 548
  %res = icmp eq i32 %canary, %check_canary
  br i1 %res, label %term.bypass, label %term.kill

for.cond:                                         ; preds = %term.bypass41, %term.bypass
  %canary4 = add i32 936, 115
  %0 = load i32, i32* %i, align 4
  %canary6 = xor i32 %0, %canary4
  %cmp = icmp sgt i32 %0, 0
  %canary7 = xor i32 %0, %canary6
  %check_canary5 = add i32 936, 115
  %res8 = icmp eq i32 %canary7, %check_canary5
  br i1 %res8, label %term.bypass11, label %term.kill9

for.body:                                         ; preds = %term.bypass11
  %canary13 = add i32 957, 374
  %call = call i64 @time(i64* null) #5
  %conv = trunc i64 %call to i32
  call void @srand(i32 %conv) #5
  %call1 = call i32 @rand() #5
  %rem = srem i32 %call1, 100
  %canary15 = xor i32 %rem, %canary13
  %cmp2 = icmp eq i32 %rem, 23
  %canary16 = xor i32 %rem, %canary15
  %check_canary14 = add i32 957, 374
  %res17 = icmp eq i32 %canary16, %check_canary14
  br i1 %res17, label %term.bypass20, label %term.kill18

if.then:                                          ; preds = %term.bypass20
  %canary22 = add i32 735, 57
  call void @exit(i32 -1) #4
  %check_canary23 = add i32 735, 57
  %res24 = icmp eq i32 %canary22, %check_canary23
  unreachable

if.end:                                           ; preds = %term.bypass20
  %canary25 = add i32 985, 971
  %check_canary26 = add i32 985, 971
  %res27 = icmp eq i32 %canary25, %check_canary26
  br i1 %res27, label %term.bypass30, label %term.kill28

for.inc:                                          ; preds = %term.bypass30
  %canary32 = add i32 722, 821
  %1 = load i32, i32* %i, align 4
  %canary34 = xor i32 %1, %canary32
  %dec = add nsw i32 %1, -1
  %canary35 = xor i32 %dec, %canary34
  store i32 %dec, i32* %i, align 4
  %canary36 = xor i32 %1, %canary35
  %canary37 = xor i32 %dec, %canary36
  %check_canary33 = add i32 722, 821
  %res38 = icmp eq i32 %canary37, %check_canary33
  br i1 %res38, label %term.bypass41, label %term.kill39

for.end:                                          ; preds = %term.bypass11
  %canary43 = add i32 566, 773
  %check_canary44 = add i32 566, 773
  %res45 = icmp eq i32 %canary43, %check_canary44
  br i1 %res45, label %term.bypass48, label %term.kill46

term.kill:                                        ; preds = %entry, %term.kill
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @8, i32 0, i32 0))
  br label %term.kill

term.bypass:                                      ; preds = %entry
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @9, i32 0, i32 0))
  br label %for.cond

term.kill9:                                       ; preds = %for.cond, %term.kill9
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @10, i32 0, i32 0))
  br label %term.kill9

term.bypass11:                                    ; preds = %for.cond
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @11, i32 0, i32 0))
  br i1 %cmp, label %for.body, label %for.end

term.kill18:                                      ; preds = %for.body, %term.kill18
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @12, i32 0, i32 0))
  br label %term.kill18

term.bypass20:                                    ; preds = %for.body
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @13, i32 0, i32 0))
  br i1 %cmp2, label %if.then, label %if.end

term.kill28:                                      ; preds = %if.end, %term.kill28
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @14, i32 0, i32 0))
  br label %term.kill28

term.bypass30:                                    ; preds = %if.end
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @15, i32 0, i32 0))
  br label %for.inc

term.kill39:                                      ; preds = %for.inc, %term.kill39
  %call40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @16, i32 0, i32 0))
  br label %term.kill39

term.bypass41:                                    ; preds = %for.inc
  %call42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @17, i32 0, i32 0))
  br label %for.cond

term.kill46:                                      ; preds = %for.end, %term.kill46
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @18, i32 0, i32 0))
  br label %term.kill46

term.bypass48:                                    ; preds = %for.end
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @19, i32 0, i32 0))
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
  %canary = add i32 350, 548
  %retval = alloca float, align 4
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  %0 = load i32, i32* %a1.addr, align 4
  %canary1 = xor i32 %0, %canary
  %cmp = icmp sle i32 %0, 0
  %canary2 = xor i32 %0, %canary1
  %check_canary = add i32 350, 548
  %res = icmp eq i32 %canary2, %check_canary
  br i1 %res, label %term.bypass, label %term.kill

if.then:                                          ; preds = %term.bypass
  %canary5 = add i32 936, 115
  %1 = load i32, i32* %a2.addr, align 4
  %canary7 = xor i32 %1, %canary5
  %conv = sitofp i32 %1 to double
  %mul = fmul double %conv, 3.124000e+00
  %cnry.conv = fptosi double %mul to i32
  %canary8 = xor i32 %cnry.conv, %canary7
  %conv1 = fptrunc double %mul to float
  store float %conv1, float* %retval, align 4
  %canary9 = xor i32 %1, %canary8
  %canary10 = xor i32 %cnry.conv, %canary9
  %check_canary6 = add i32 936, 115
  %res11 = icmp eq i32 %canary10, %check_canary6
  br i1 %res11, label %term.bypass14, label %term.kill12

if.else:                                          ; preds = %term.bypass
  %canary16 = add i32 957, 374
  %2 = load i32, i32* %a1.addr, align 4
  %canary18 = xor i32 %2, %canary16
  %3 = load i32, i32* %a2.addr, align 4
  %canary19 = xor i32 %3, %canary18
  %sub = sub nsw i32 %2, %3
  %canary20 = xor i32 %sub, %canary19
  %4 = load i32, i32* %a2.addr, align 4
  %canary21 = xor i32 %4, %canary20
  %call = call float @foo(i32 %sub, i32 %4)
  store float %call, float* %retval, align 4
  %canary22 = xor i32 %2, %canary21
  %canary23 = xor i32 %3, %canary22
  %canary24 = xor i32 %sub, %canary23
  %canary25 = xor i32 %4, %canary24
  %check_canary17 = add i32 957, 374
  %res26 = icmp eq i32 %canary25, %check_canary17
  br i1 %res26, label %term.bypass29, label %term.kill27

return:                                           ; preds = %term.bypass29, %term.bypass14
  %canary31 = add i32 735, 57
  %5 = load float, float* %retval, align 4
  %cnry.conv33 = fptosi float %5 to i32
  %canary34 = xor i32 %cnry.conv33, %canary31
  %canary35 = xor i32 %cnry.conv33, %canary34
  %check_canary32 = add i32 735, 57
  %res36 = icmp eq i32 %canary35, %check_canary32
  br i1 %res36, label %term.bypass39, label %term.kill37

term.kill:                                        ; preds = %entry, %term.kill
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @20, i32 0, i32 0))
  br label %term.kill

term.bypass:                                      ; preds = %entry
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @21, i32 0, i32 0))
  br i1 %cmp, label %if.then, label %if.else

term.kill12:                                      ; preds = %if.then, %term.kill12
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @22, i32 0, i32 0))
  br label %term.kill12

term.bypass14:                                    ; preds = %if.then
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @23, i32 0, i32 0))
  br label %return

term.kill27:                                      ; preds = %if.else, %term.kill27
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @24, i32 0, i32 0))
  br label %term.kill27

term.bypass29:                                    ; preds = %if.else
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @25, i32 0, i32 0))
  br label %return

term.kill37:                                      ; preds = %return, %term.kill37
  %call38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @26, i32 0, i32 0))
  br label %term.kill37

term.bypass39:                                    ; preds = %return
  %call40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @27, i32 0, i32 0))
  ret float %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @bar(i32 %a1) #0 {
entry:
  %canary = add i32 350, 548
  %a1.addr = alloca i32, align 4
  store i32 %a1, i32* %a1.addr, align 4
  %0 = load i32, i32* %a1.addr, align 4
  %canary1 = xor i32 %0, %canary
  %conv = sitofp i32 %0 to double
  %mul = fmul double 1.230000e+02, %conv
  %cnry.conv = fptosi double %mul to i32
  %canary2 = xor i32 %cnry.conv, %canary1
  %conv1 = fptrunc double %mul to float
  %canary3 = xor i32 %0, %canary2
  %canary4 = xor i32 %cnry.conv, %canary3
  %check_canary = add i32 350, 548
  %res = icmp eq i32 %canary4, %check_canary
  br i1 %res, label %term.bypass, label %term.kill

term.kill:                                        ; preds = %entry, %term.kill
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @28, i32 0, i32 0))
  br label %term.kill

term.bypass:                                      ; preds = %entry
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @29, i32 0, i32 0))
  ret float %conv1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @doubleDown() #0 {
entry:
  %canary = add i32 350, 548
  %check_canary = add i32 350, 548
  %res = icmp eq i32 %canary, %check_canary
  br i1 %res, label %term.bypass, label %term.kill

term.kill:                                        ; preds = %entry, %term.kill
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @30, i32 0, i32 0))
  br label %term.kill

term.bypass:                                      ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @31, i32 0, i32 0))
  ret double 0x40C7AC8020C49BA6
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @square_n(i32 %n) #0 {
entry:
  %canary = add i32 350, 548
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
  %check_canary = add i32 350, 548
  %res = icmp eq i32 %canary6, %check_canary
  br i1 %res, label %term.bypass, label %term.kill

term.kill:                                        ; preds = %entry, %term.kill
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @32, i32 0, i32 0))
  br label %term.kill

term.bypass:                                      ; preds = %entry
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @33, i32 0, i32 0))
  ret i32 %mul
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @binary_search(float %node_val) #0 {
entry:
  %canary = add i32 350, 548
  %retval = alloca i32, align 4
  %node_val.addr = alloca float, align 4
  store float %node_val, float* %node_val.addr, align 4
  %0 = load float, float* %node_val.addr, align 4
  %cnry.conv = fptosi float %0 to i32
  %canary1 = xor i32 %cnry.conv, %canary
  %cmp = fcmp olt float %0, 2.000000e+01
  %canary2 = xor i32 %cnry.conv, %canary1
  %check_canary = add i32 350, 548
  %res = icmp eq i32 %canary2, %check_canary
  br i1 %res, label %term.bypass, label %term.kill

if.then:                                          ; preds = %term.bypass
  %canary4 = add i32 936, 115
  store i32 0, i32* %retval, align 4
  %check_canary5 = add i32 936, 115
  %res6 = icmp eq i32 %canary4, %check_canary5
  br i1 %res6, label %term.bypass9, label %term.kill7

if.else:                                          ; preds = %term.bypass
  %canary11 = add i32 957, 374
  store i32 1, i32* %retval, align 4
  %check_canary12 = add i32 957, 374
  %res13 = icmp eq i32 %canary11, %check_canary12
  br i1 %res13, label %term.bypass16, label %term.kill14

return:                                           ; preds = %term.bypass16, %term.bypass9
  %canary18 = add i32 735, 57
  %1 = load i32, i32* %retval, align 4
  %canary20 = xor i32 %1, %canary18
  %canary21 = xor i32 %1, %canary20
  %check_canary19 = add i32 735, 57
  %res22 = icmp eq i32 %canary21, %check_canary19
  br i1 %res22, label %term.bypass25, label %term.kill23

term.kill:                                        ; preds = %entry, %term.kill
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @34, i32 0, i32 0))
  br label %term.kill

term.bypass:                                      ; preds = %entry
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @35, i32 0, i32 0))
  br i1 %cmp, label %if.then, label %if.else

term.kill7:                                       ; preds = %if.then, %term.kill7
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @36, i32 0, i32 0))
  br label %term.kill7

term.bypass9:                                     ; preds = %if.then
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @37, i32 0, i32 0))
  br label %return

term.kill14:                                      ; preds = %if.else, %term.kill14
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @38, i32 0, i32 0))
  br label %term.kill14

term.bypass16:                                    ; preds = %if.else
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @39, i32 0, i32 0))
  br label %return

term.kill23:                                      ; preds = %return, %term.kill23
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @40, i32 0, i32 0))
  br label %term.kill23

term.bypass25:                                    ; preds = %return
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @41, i32 0, i32 0))
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
