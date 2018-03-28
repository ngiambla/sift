; ModuleID = 'test_me.c'
source_filename = "test_me.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"My main job is to 'wow' you...\0A\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"-- running [%d].\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"time_spent: %lf\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @wow() #0 {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0))
  %1 = load i32, i32* %i, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @holy_smokes() #0 {
entry:
  %i = alloca i32, align 4
  store i32 100, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call i64 @time(i64* null) #4
  %conv = trunc i64 %call to i32
  call void @srand(i32 %conv) #4
  %call1 = call i32 @rand() #4
  %rem = srem i32 %call1, 100
  %cmp2 = icmp eq i32 %rem, 23
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #5
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %1 = load i32, i32* %i, align 4
  %dec = add nsw i32 %1, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
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
  %retval = alloca float, align 4
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  %0 = load i32, i32* %a1.addr, align 4
  %cmp = icmp sle i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a2.addr, align 4
  %conv = sitofp i32 %1 to double
  %mul = fmul double %conv, 3.124000e+00
  %conv1 = fptrunc double %mul to float
  store float %conv1, float* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %a1.addr, align 4
  %3 = load i32, i32* %a2.addr, align 4
  %sub = sub nsw i32 %2, %3
  %4 = load i32, i32* %a2.addr, align 4
  %call = call float @foo(i32 %sub, i32 %4)
  store float %call, float* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %5 = load float, float* %retval, align 4
  ret float %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @bar(i32 %a1) #0 {
entry:
  %a1.addr = alloca i32, align 4
  store i32 %a1, i32* %a1.addr, align 4
  %0 = load i32, i32* %a1.addr, align 4
  %conv = sitofp i32 %0 to double
  %mul = fmul double 1.230000e+02, %conv
  %conv1 = fptrunc double %mul to float
  ret float %conv1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @square_n(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %1 = load i32, i32* %n.addr, align 4
  %mul = mul nsw i32 %0, %1
  ret i32 %mul
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @binary_search(float %node_val) #0 {
entry:
  %retval = alloca i32, align 4
  %node_val.addr = alloca float, align 4
  store float %node_val, float* %node_val.addr, align 4
  %0 = load float, float* %node_val.addr, align 4
  %cmp = fcmp olt float %0, 2.000000e+01
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %retval, align 4
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
  %call = call i64 @clock() #4
  store i64 %call, i64* %begin, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 12)
  call void @wow()
  %call2 = call float @foo(i32 100, i32 1)
  %call3 = call i64 @clock() #4
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

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 328283)"}
