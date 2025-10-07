import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriverInfoCard extends StatelessWidget {
  final String driverName;

  const DriverInfoCard({super.key, required this.driverName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        // Driver Avatar
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: Icon(Icons.person, color: AppColors.pink, size: 30.sp),
        ),
        SizedBox(width: 12.w),

        // Driver Name + Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                driverName,
                style: theme.textTheme.displayMedium?.copyWith(
                  color: AppColors.black,
                ), // fontSize: 16.sp, fontWeight: medium
              ),
              SizedBox(height: 2.h),
              Text(
                'Is your delivery hero for today',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.white[80],
                ), // fontSize: 12.sp, fontWeight: regular
              ),
            ],
          ),
        ),

        // Call + Chat buttons
        Row(
          children: [
            GestureDetector(
              onTap: () {
                // TODO: open Call
              },
              child: SvgPicture.asset(
                AppImages.phoneIcon,
                width: 24.sp,
                height: 24.sp,
              ),
            ),
            SizedBox(width: 10.w),
            GestureDetector(
              onTap: () {
                // TODO: open Whatsapp
              },
              child: SvgPicture.asset(
                AppImages.whatsappIcon,
                width: 24.sp,
                height: 24.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
