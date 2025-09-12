import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.numberOfNotification});
  final int? numberOfNotification;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          //navigator to notification screnn
          onPressed: () {
              context.pushNamed(AppRoutes.notifications);
          },
          icon: const Icon(Icons.notifications_none, size: 30),
        ),

        Positioned(
          top: 7.h,
          right: 7.w,
          child: Container(
            constraints: BoxConstraints(minWidth: 20.w, maxHeight: 20.h),

            decoration: BoxDecoration(
              color: AppColors.red,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: Text(
              numberOfNotification.toString(),
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
