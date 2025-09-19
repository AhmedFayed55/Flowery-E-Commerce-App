import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.location),
        horizontalSpace(4),
        Text(
          'Deliver to',
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColors.darkGrey),
        ),
        horizontalSpace(4),
        Text(
          '2XVP+XC - Sheikh Zayed.....',
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColors.black),
        ),
        horizontalSpace(8),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(AppImages.arrowDown, width: 24.w),
        ),
      ],
    );
  }
}
