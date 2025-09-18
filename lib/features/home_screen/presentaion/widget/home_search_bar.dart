import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: Image.asset(AppImages.imagePhoto, width: 12.w, height: 12.h),
        ),
        Text(
          AppLocalizations.of(context)!.flower,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: SizedBox(
              height: 35.h,
              child: TextField(
                readOnly: true,
                onTap: () {
                  context.pushNamed(AppRoutes.searchScreen);
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      // ignore: deprecated_member_use
                      color: AppColors.darkGrey.withOpacity(.5),
                    ),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  hintText: AppLocalizations.of(context)!.search,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
