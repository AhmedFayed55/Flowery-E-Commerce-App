import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flowers_ecommerce_app/features/track_order/presentaion/models/tracking_step.dart';

class TrackingTimeline extends StatelessWidget {
  final List<TrackingStep> steps;

  const TrackingTimeline({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final isFirst = index == 0;
        final isLast = index == steps.length - 1;

        return TimelineTile(
          alignment: TimelineAlign.start,
          isFirst: isFirst,
          isLast: isLast,

          // الخط قبل وبعد الدايرة
          beforeLineStyle: LineStyle(
            color: index == 0
                ? Colors.transparent
                : (steps[index - 1].isCompleted
                      ? AppColors.pink
                      : AppColors.white[60]!),
            thickness: 2.w,
          ),
          afterLineStyle: LineStyle(
            color: isLast
                ? Colors.transparent
                : (step.isCompleted ? AppColors.pink : AppColors.white[60]!),
            thickness: 2.w,
          ),

          // شكل الدايرة (المؤشر)
          indicatorStyle: IndicatorStyle(
            width: 20.w,
            height: 20.w,
            indicator: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.pink, width: 1.5.w),
                color: step.isCompleted ? AppColors.white : AppColors.white,
              ),
              child: Center(
                child: Icon(
                  Icons.circle,
                  size: 14.sp,
                  color: step.isCompleted ? AppColors.pink : AppColors.white,
                ),
              ),
            ),
          ),

          // محتوى كل خطوة
          endChild: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: theme
                      .textTheme
                      .titleSmall, // fontSize: 14.sp, fontWeight: medium, color: black
                ),
                SizedBox(height: 4.h),
                Text(
                  step.timestamp,
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: AppColors.white[90],
                  ), // fontSize: 13.sp, fontWeight: regular
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
