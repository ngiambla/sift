; ModuleID = 'test_me_2.bc'
source_filename = "test_me.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"My main job is to 'wow' you...\0A\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"-- running [%d].\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"time_spent: %lf\0A\00", align 1
@0 = private unnamed_addr constant [12 x i8] c"Output: %d\0A\00"
@1 = private unnamed_addr constant [12 x i8] c"Output: %d\0A\00"
@2 = private unnamed_addr constant [12 x i8] c"Output: %d\0A\00"
@3 = private unnamed_addr constant [12 x i8] c"Output: %d\0A\00"
@4 = private unnamed_addr constant [12 x i8] c"Output: %d\0A\00"
@5 = private unnamed_addr constant [12 x i8] c"Output: %d\0A\00"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @wow() #0 {
entry:
  %canary = add i32 776, 24
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  %check_canary = add i32 776, 24
  %res = icmp eq i32 %canary, %check_canary
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %canary1 = add i32 186, 42
  %0 = load i32, i32* %i, align 4
  %canary3 = xor i32 %0, %canary1
  %cmp = icmp slt i32 %0, 10
  %canary4 = xor i32 %0, %canary3
  %check_canary2 = add i32 186, 42
  %res5 = icmp eq i32 %canary4, %check_canary2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %canary7 = add i32 198, 482
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0))
  %1 = load i32, i32* %i, align 4
  %canary9 = xor i32 %1, %canary7
  %inc = add nsw i32 %1, 1
  %canary10 = xor i32 %inc, %canary9
  store i32 %inc, i32* %i, align 4
  %canary11 = xor i32 %1, %canary10
  %canary12 = xor i32 %inc, %canary11
  %check_canary8 = add i32 198, 482
  %res13 = icmp eq i32 %canary12, %check_canary8
  br label %while.cond

term.kill:                                        ; No predecessors!
  call void @llvm.trap()
  unreachable

term.kill6:                                       ; No predecessors!
  %canary15 = add i32 173, 998
  call void @llvm.trap()
  %check_canary16 = add i32 173, 998
  %res17 = icmp eq i32 %canary15, %check_canary16
  unreachable

term.kill14:                                      ; No predecessors!
  call void @llvm.trap()
  unreachable

term.kill18:                                      ; No predecessors!
  %canary19 = add i32 305, 85
  call void @llvm.trap()
  %check_canary20 = add i32 305, 85
  %res21 = icmp eq i32 %canary19, %check_canary20
  unreachable

term.kill22:                                      ; No predecessors!
  call void @llvm.trap()
  unreachable

while.end:                                        ; preds = %while.cond
  %canary23 = add i32 251, 805
  %check_canary24 = add i32 251, 805
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @0, i32 0, i32 0), i32 5)
  %res25 = icmp eq i32 %canary23, %check_canary24
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @holy_smokes() #0 {
entry:
  %canary = add i32 776, 24
  %i = alloca i32, align 4
  store i32 100, i32* %i, align 4
  %check_canary = add i32 776, 24
  %res = icmp eq i32 %canary, %check_canary
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %canary1 = add i32 186, 42
  %0 = load i32, i32* %i, align 4
  %canary3 = xor i32 %0, %canary1
  %cmp = icmp sgt i32 %0, 0
  %canary4 = xor i32 %0, %canary3
  %check_canary2 = add i32 186, 42
  %res5 = icmp eq i32 %canary4, %check_canary2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %canary7 = add i32 198, 482
  %call = call i64 @time(i64* null) #5
  %conv = trunc i64 %call to i32
  call void @srand(i32 %conv) #5
  %call1 = call i32 @rand() #5
  %rem = srem i32 %call1, 100
  %canary9 = xor i32 %rem, %canary7
  %cmp2 = icmp eq i32 %rem, 23
  %canary10 = xor i32 %rem, %canary9
  %check_canary8 = add i32 198, 482
  %res11 = icmp eq i32 %canary10, %check_canary8
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %canary13 = add i32 173, 998
  call void @exit(i32 -1) #4
  %check_canary14 = add i32 173, 998
  %res15 = icmp eq i32 %canary13, %check_canary14
  unreachable

if.end:                                           ; preds = %for.body
  %canary17 = add i32 305, 85
  %check_canary18 = add i32 305, 85
  %res19 = icmp eq i32 %canary17, %check_canary18
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %canary21 = add i32 251, 805
  %1 = load i32, i32* %i, align 4
  %canary23 = xor i32 %1, %canary21
  %dec = add nsw i32 %1, -1
  %canary24 = xor i32 %dec, %canary23
  store i32 %dec, i32* %i, align 4
  %canary25 = xor i32 %1, %canary24
  %canary26 = xor i32 %dec, %canary25
  %check_canary22 = add i32 251, 805
  %res27 = icmp eq i32 %canary26, %check_canary22
  br label %for.cond

term.kill:                                        ; No predecessors!
  call void @llvm.trap()
  unreachable

term.kill6:                                       ; No predecessors!
  %canary29 = add i32 590, 504
  call void @llvm.trap()
  %check_canary30 = add i32 590, 504
  %res31 = icmp eq i32 %canary29, %check_canary30
  unreachable

term.kill12:                                      ; No predecessors!
  call void @llvm.trap()
  unreachable

term.kill16:                                      ; No predecessors!
  %canary33 = add i32 602, 631
  call void @llvm.trap()
  %check_canary34 = add i32 602, 631
  %res35 = icmp eq i32 %canary33, %check_canary34
  unreachable

term.kill20:                                      ; No predecessors!
  call void @llvm.trap()
  unreachable

term.kill28:                                      ; No predecessors!
  %canary37 = add i32 350, 208
  call void @llvm.trap()
  %check_canary38 = add i32 350, 208
  %res39 = icmp eq i32 %canary37, %check_canary38
  unreachable

term.kill32:                                      ; No predecessors!
  call void @llvm.trap()
  unreachable

term.kill36:                                      ; No predecessors!
  %canary41 = add i32 845, 618
  call void @llvm.trap()
  %check_canary42 = add i32 845, 618
  %res43 = icmp eq i32 %canary41, %check_canary42
  unreachable

term.kill40:                                      ; No predecessors!
  call void @llvm.trap()
  unreachable

term.kill44:                                      ; No predecessors!
  %canary45 = add i32 563, 275
  call void @llvm.trap()
  %check_canary46 = add i32 563, 275
  %res47 = icmp eq i32 %canary45, %check_canary46
  unreachable

term.kill48:                                      ; No predecessors!
  call void @llvm.trap()
  unreachable

for.end:                                          ; preds = %for.cond
  %canary49 = add i32 849, 787
  %check_canary50 = add i32 849, 787
  %call52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @1, i32 0, i32 0), i32 5)
  %res51 = icmp eq i32 %canary49, %check_canary50
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
  %canary = add i32 776, 24
  %retval = alloca float, align 4
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  %0 = load i32, i32* %a1.addr, align 4
  %canary1 = xor i32 %0, %canary
  %cmp = icmp sle i32 %0, 0
  %canary2 = xor i32 %0, %canary1
  %check_canary = add i32 776, 24
  %res = icmp eq i32 %canary2, %check_canary
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %canary3 = add i32 186, 42
  %1 = load i32, i32* %a2.addr, align 4
  %canary5 = xor i32 %1, %canary3
  %conv = sitofp i32 %1 to double
  %mul = fmul double %conv, 3.124000e+00
  %conv6 = fptosi double %mul to i32
  %canary7 = xor i32 %conv6, %canary5
  %conv1 = fptrunc double %mul to float
  store float %conv1, float* %retval, align 4
  %canary8 = xor i32 %1, %canary7
  %canary9 = xor i32 %conv6, %canary8
  %check_canary4 = add i32 186, 42
  %res10 = icmp eq i32 %canary9, %check_canary4
  br label %return

if.else:                                          ; preds = %entry
  %canary12 = add i32 198, 482
  %2 = load i32, i32* %a1.addr, align 4
  %canary14 = xor i32 %2, %canary12
  %3 = load i32, i32* %a2.addr, align 4
  %canary15 = xor i32 %3, %canary14
  %sub = sub nsw i32 %2, %3
  %canary16 = xor i32 %sub, %canary15
  %4 = load i32, i32* %a2.addr, align 4
  %canary17 = xor i32 %4, %canary16
  %call = call float @foo(i32 %sub, i32 %4)
  store float %call, float* %retval, align 4
  %canary18 = xor i32 %2, %canary17
  %canary19 = xor i32 %3, %canary18
  %canary20 = xor i32 %sub, %canary19
  %canary21 = xor i32 %4, %canary20
  %check_canary13 = add i32 198, 482
  %res22 = icmp eq i32 %canary21, %check_canary13
  br label %return

term.kill:                                        ; No predecessors!
  call void @llvm.trap()
  unreachable

term.kill11:                                      ; No predecessors!
  %canary24 = add i32 173, 998
  call void @llvm.trap()
  %check_canary25 = add i32 173, 998
  %res26 = icmp eq i32 %canary24, %check_canary25
  unreachable

term.kill23:                                      ; No predecessors!
  call void @llvm.trap()
  unreachable

term.kill27:                                      ; No predecessors!
  %canary28 = add i32 305, 85
  call void @llvm.trap()
  %check_canary29 = add i32 305, 85
  %res30 = icmp eq i32 %canary28, %check_canary29
  unreachable

term.kill31:                                      ; No predecessors!
  call void @llvm.trap()
  unreachable

return:                                           ; preds = %if.else, %if.then
  %canary32 = add i32 251, 805
  %5 = load float, float* %retval, align 4
  %conv34 = fptosi float %5 to i32
  %canary35 = xor i32 %conv34, %canary32
  %canary36 = xor i32 %conv34, %canary35
  %check_canary33 = add i32 251, 805
  %call38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @2, i32 0, i32 0), i32 5)
  %res37 = icmp eq i32 %canary36, %check_canary33
  ret float %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @bar(i32 %a1) #0 {
entry:
  %canary = add i32 776, 24
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
  %check_canary = add i32 776, 24
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @3, i32 0, i32 0), i32 5)
  %res = icmp eq i32 %canary5, %check_canary
  ret float %conv1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @square_n(i32 %n) #0 {
entry:
  %canary = add i32 776, 24
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
  %check_canary = add i32 776, 24
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @4, i32 0, i32 0), i32 5)
  %res = icmp eq i32 %canary6, %check_canary
  ret i32 %mul
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @binary_search(float %node_val) #0 {
entry:
  %canary = add i32 776, 24
  %retval = alloca i32, align 4
  %node_val.addr = alloca float, align 4
  store float %node_val, float* %node_val.addr, align 4
  %0 = load float, float* %node_val.addr, align 4
  %conv = fptosi float %0 to i32
  %canary1 = xor i32 %conv, %canary
  %cmp = fcmp olt float %0, 2.000000e+01
  %canary2 = xor i32 %conv, %canary1
  %check_canary = add i32 776, 24
  %res = icmp eq i32 %canary2, %check_canary
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %canary3 = add i32 186, 42
  store i32 0, i32* %retval, align 4
  %check_canary4 = add i32 186, 42
  %res5 = icmp eq i32 %canary3, %check_canary4
  br label %return

if.else:                                          ; preds = %entry
  %canary7 = add i32 198, 482
  store i32 1, i32* %retval, align 4
  %check_canary8 = add i32 198, 482
  %res9 = icmp eq i32 %canary7, %check_canary8
  br label %return

term.kill:                                        ; No predecessors!
  call void @llvm.trap()
  unreachable

term.kill6:                                       ; No predecessors!
  %canary11 = add i32 173, 998
  call void @llvm.trap()
  %check_canary12 = add i32 173, 998
  %res13 = icmp eq i32 %canary11, %check_canary12
  unreachable

term.kill10:                                      ; No predecessors!
  call void @llvm.trap()
  unreachable

term.kill14:                                      ; No predecessors!
  %canary15 = add i32 305, 85
  call void @llvm.trap()
  %check_canary16 = add i32 305, 85
  %res17 = icmp eq i32 %canary15, %check_canary16
  unreachable

term.kill18:                                      ; No predecessors!
  call void @llvm.trap()
  unreachable

return:                                           ; preds = %if.else, %if.then
  %canary19 = add i32 251, 805
  %1 = load i32, i32* %retval, align 4
  %canary21 = xor i32 %1, %canary19
  %canary22 = xor i32 %1, %canary21
  %check_canary20 = add i32 251, 805
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @5, i32 0, i32 0), i32 5)
  %res23 = icmp eq i32 %canary22, %check_canary20
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
  %call2 = call i64 @clock() #5
  store i64 %call2, i64* %end, align 8
  %0 = load i64, i64* %end, align 8
  %1 = load i64, i64* %begin, align 8
  %sub = sub nsw i64 %0, %1
  %conv = sitofp i64 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  store double %div, double* %time_spent, align 8
  %2 = load double, double* %time_spent, align 8
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0), double %2)
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
