import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/app_images.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key, required this.numberNoti});
  final int numberNoti;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(5.w),
          child: SvgPicture.asset(
            AppImages.flowerPhoto,
            width: 12.w,
            height: 12.h,
          ),
        ),
        Text(
          AppLocalizations.of(context)!.flower,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Spacer(),
        NotificationWidget(numberOfNotification: numberNoti),
      ],
    );
  }
}
