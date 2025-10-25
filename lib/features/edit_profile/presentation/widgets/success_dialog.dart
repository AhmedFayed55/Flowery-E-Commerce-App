import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.zero,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.green),
            onPressed: () => {context.pop(), context.pop()},
            child: Text(
              AppLocalizations.of(context)!.ok,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15.r),
      ),
      icon: CircleAvatar(
        backgroundColor: AppColors.green,
        radius: 50.r,
        child: Icon(Icons.check, size: 50.sp, color: AppColors.white),
      ),
    );
  }
}
