import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/view_model/profile_setting_cubit.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/view_model/profile_setting_event.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/widget/custom_card_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtomSheet extends StatelessWidget {
  
  const CustomButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
      var lang =AppLocalizations.of(context)!;

    final cubit = context.watch<ProfileSettingCubit>();
    final cubitState = cubit.state.localizationCode;

    return SizedBox(
      height: 270.h,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 5.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              indent: 120.w,
              endIndent: 120.w,
              thickness: 4.h,
              radius: BorderRadius.all(Radius.circular(4.sp)),
              color: AppColors.black,
            ),

            Text(
            lang.change_language  ,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            CustomCard(
              title: lang.english,
              icon: Icon(
                cubitState == Constants.enKey
                    ? Icons.radio_button_on
                    : Icons.radio_button_off,
                color: cubitState == Constants.enKey
                    ? AppColors.pink
                    : AppColors.darkGrey,
              ),
              onTap: () {
                context.read<ProfileSettingCubit>().doIntent(
                  ChangeLanguageEvent(Constants.enKey),
                );
                context.pop();
              },
            ),
            CustomCard(
              title: lang.arabic,
              icon: Icon(
                cubitState == Constants.arKey
                    ? Icons.radio_button_on
                    : Icons.radio_button_off,
                color: cubitState == Constants.arKey
                    ? AppColors.pink
                    : AppColors.darkGrey,
              ),
              onTap: () {
                context.read<ProfileSettingCubit>().doIntent(
                  ChangeLanguageEvent(Constants.arKey),
                );
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
