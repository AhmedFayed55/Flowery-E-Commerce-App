import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/utils/app_images.dart';
import 'package:flowers_ecommerce_app/features/track_order/presentaion/models/tracking_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/driver_info_card.dart';
import '../widgets/tracking_timeline.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String driverName = "Muhamed";
    final String estimatedArrival = "03 Sep 2024, 11:00 AM";
    final int currentStep = 0;

    final List<TrackingStep> steps = [
      TrackingStep(
        title: "Received your order",
        timestamp: "03 Sep 2024 - 2:10",
        isCompleted: currentStep >= 0,
      ),
      TrackingStep(
        title: "Preparing your order",
        timestamp: "03 Sep 2024 - 2:10",
        isCompleted: currentStep >= 1,
      ),
      TrackingStep(
        title: "Out for delivery",
        timestamp: "03 Sep 2024 - 2:10",
        isCompleted: currentStep >= 2,
      ),
      TrackingStep(
        title: "Delivered",
        timestamp: "03 Sep 2024 - 2:10",
        isCompleted: currentStep >= 3,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 20.sp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Track order',
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            fontSize: 18.sp,
          ), // Using AppBar theme style
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  // Estimated arrival label
                  Text(
                    'Estimated arrival',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: AppColors.white[90],
                    ), // fontSize: 14.sp, fontWeight: medium
                  ),
                  SizedBox(height: 3.h),

                  // Estimated arrival time
                  Text(
                    estimatedArrival,
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: AppColors.black,
                    ), // fontSize: 16.sp, fontWeight: medium
                  ),

                  Divider(
                    color: AppColors.darkGrey,
                    thickness: 0.5,
                    indent: 8.w,
                    endIndent: 8.w,
                  ),

                  SizedBox(height: 20.h),
                  DriverInfoCard(driverName: driverName),
                  SizedBox(height: 22.h),

                  // Delivery car image
                  Center(
                    child: SvgPicture.asset(
                      AppImages.car,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 83.h,
                        width: 213.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(
                          Icons.local_shipping,
                          size: 60.sp,
                          color: AppColors.pink,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TrackingTimeline(steps: steps),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),

          // Show map button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: ElevatedButton(
              onPressed: () {
                // Handle map button press
              },
              child: Text(
                'Show map',
              ), // Using elevatedButtonTheme textStyle from theme
            ),
          ),
        ],
      ),
    );
  }
}
