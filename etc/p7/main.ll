; ModuleID = 'etc/p7/main.c'
source_filename = "etc/p7/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.array = private unnamed_addr constant <{ i32, i32, i32, i32, i32, i32, i32, [13 x i32] }> <{ i32 1, i32 4, i32 7, i32 9, i32 16, i32 56, i32 70, [13 x i32] zeroinitializer }>, align 16
@.str = private unnamed_addr constant [32 x i8] c"Element not found in the array \00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"Element found at index : %d\00", align 1

; Function Attrs: norecurse nounwind readonly sspstrong uwtable
define dso_local i32 @iterativeBinarySearch(i32* nocapture readonly %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp slt i32 %2, %1
  br i1 %5, label %23, label %6

6:                                                ; preds = %4, %16
  %7 = phi i32 [ %21, %16 ], [ %1, %4 ]
  %8 = phi i32 [ %20, %16 ], [ %2, %4 ]
  %9 = sub nsw i32 %8, %7
  %10 = sdiv i32 %9, 2
  %11 = add nsw i32 %10, %7
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32* %0, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !4
  %15 = icmp eq i32 %14, %3
  br i1 %15, label %23, label %16

16:                                               ; preds = %6
  %17 = icmp slt i32 %14, %3
  %18 = add nsw i32 %11, 1
  %19 = add nsw i32 %11, -1
  %20 = select i1 %17, i32 %8, i32 %19
  %21 = select i1 %17, i32 %18, i32 %7
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %6

23:                                               ; preds = %16, %6, %4
  %24 = phi i32 [ -1, %4 ], [ %11, %6 ], [ -1, %16 ]
  ret i32 %24
}

; Function Attrs: nofree nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
  br label %1

1:                                                ; preds = %11, %0
  %2 = phi i32 [ %16, %11 ], [ 0, %0 ]
  %3 = phi i32 [ %15, %11 ], [ 6, %0 ]
  %4 = sub nsw i32 %3, %2
  %5 = sdiv i32 %4, 2
  %6 = add nsw i32 %5, %2
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i32, i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32, [13 x i32] }>, <{ i32, i32, i32, i32, i32, i32, i32, [13 x i32] }>* @__const.main.array, i64 0, i32 0), i64 %7
  %9 = load i32, i32* %8, align 4, !tbaa !4
  %10 = icmp eq i32 %9, 16
  br i1 %10, label %18, label %11

11:                                               ; preds = %1
  %12 = icmp slt i32 %9, 16
  %13 = add nsw i32 %6, 1
  %14 = add nsw i32 %6, -1
  %15 = select i1 %12, i32 %3, i32 %14
  %16 = select i1 %12, i32 %13, i32 %2
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %20, label %1

18:                                               ; preds = %1
  %19 = icmp eq i32 %6, -1
  br i1 %19, label %20, label %22

20:                                               ; preds = %11, %18
  %21 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0))
  br label %24

22:                                               ; preds = %18
  %23 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i64 0, i64 0), i32 %6)
  br label %24

24:                                               ; preds = %22, %20
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

attributes #0 = { norecurse nounwind readonly sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 12.0.1"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
