import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.firstIcon,
    required this.title,
    required this.onPressed,
    this.lastWidget
  });

  final Widget? firstIcon;
  final String? title;
  final void Function()? onPressed;
  final Widget? lastWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            if (firstIcon != null) firstIcon!,
            if (title != null)
              Padding(
                padding: EdgeInsets.all(5.sp),
                child: Text(
                  title!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.black),
                ),
              ),
            const Spacer(),
            lastWidget??const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.darkGrey,
            ),
          ],
        ),
      ),
    );
  }
}
