; ModuleID = 'test_me_2.bc'
source_filename = "test_me.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"My main job is to 'wow' you...\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"time_spent: %lf\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @wow() #0 {
entry:
  %canary = add i32 41, 51
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  %check_canary = add i32 41, 51
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %canary1 = add i32 95, 43
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  %check_canary2 = add i32 95, 43
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %canary3 = add i32 88, 32
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0))
  %1 = load i32, i32* %i, align 4
  %inc = add nsw i32 %1, 1
  %canary5 = xor i32 %inc, %canary3
  store i32 %inc, i32* %i, align 4
  %check_canary4 = add i32 88, 32
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %canary6 = add i32 58, 13
  %check_canary7 = add i32 58, 13
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @square_n(i32 %n) #0 {
entry:
  %canary = add i32 41, 51
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %1 = load i32, i32* %n.addr, align 4
  %mul = mul nsw i32 %0, %1
  %canary1 = xor i32 %mul, %canary
  %check_canary = add i32 41, 51
  ret i32 %mul
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @binary_search(float %node_val) #0 {
entry:
  %canary = add i32 41, 51
  %retval = alloca i32, align 4
  %node_val.addr = alloca float, align 4
  store float %node_val, float* %node_val.addr, align 4
  %0 = load float, float* %node_val.addr, align 4
  %cmp = fcmp olt float %0, 2.000000e+01
  %check_canary = add i32 41, 51
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %canary1 = add i32 95, 43
  store i32 0, i32* %retval, align 4
  %check_canary2 = add i32 95, 43
  br label %return

if.else:                                          ; preds = %entry
  %canary3 = add i32 88, 32
  store i32 1, i32* %retval, align 4
  %check_canary4 = add i32 88, 32
  br label %return

return:                                           ; preds = %if.else, %if.then
  %canary5 = add i32 58, 13
  %1 = load i32, i32* %retval, align 4
  %check_canary6 = add i32 58, 13
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
  %call = call i64 @clock() #3
  store i64 %call, i64* %begin, align 8
  call void @wow()
  %call1 = call i64 @clock() #3
  store i64 %call1, i64* %end, align 8
  %0 = load i64, i64* %end, align 8
  %1 = load i64, i64* %begin, align 8
  %sub = sub nsw i64 %0, %1
  %conv = sitofp i64 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  store double %div, double* %time_spent, align 8
  %2 = load double, double* %time_spent, align 8
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0), double %2)
  ret i32 1
}

; Function Attrs: nounwind
declare dso_local i64 @clock() #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 328283)"}
