import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/view_model/profile_setting_cubit.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/view_model/profile_setting_event.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/view_model/profile_setting_state.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/widget/custom_buttom_sheet.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/widget/custom_notification_switch.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/widget/custom_row.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/widget/profile_bar.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/widget/section_data_user.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/widget/version_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  @override
  void initState() {
        context.read<ProfileSettingCubit>().doIntent(SumitProflieSetting());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProfileSettingCubit, ProfileSettingState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return Center(child: Text(state.errorMessage));
            }
            return Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Skeletonizer(enabled: state.isLoadding==true?true:false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ProfileBar(numberNoti: 0),
                    SectionDataUser(
                      email: state.userEntity?.email ?? '',
                      imageUrl: state.userEntity?.photo ?? '',
                      userName: state.userEntity?.firstName ?? '',
                    ),
                    const Divider(),
                   CustomNotificationSwitch(
                      onChanged: (value) {
                        context.read<ProfileSettingCubit>().doIntent(
                          ToggleNotificationEvent(value),
                        );
                      },
                      title: lang.notification,
                      valueNoti: state.enableNotification,
                      onPressed: () {},
                    ),
                    const Divider(),
                    CustomRow(
                      firstIcon: const Icon(Icons.translate),
                      title: lang.language,
                      lastWidget: Text(
                        state.localizationCode == Constants.arKey
                            ? lang.arabic
                            : lang.english,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: context.read<ProfileSettingCubit>(),
                            child: const CustomButtomSheet(),
                          ),
                        );
                      },
                    ),
                    CustomRow(
                      firstIcon: null,
                      title: lang.about_us,
                      onPressed: () {
                        context.pushNamed(
                          AppRoutes.aboutUs,
                          arguments: state.aboutUsList,
                        );
                      },
                    ),
                    CustomRow(
                      firstIcon: null,
                      title: lang.terms_conditions,
                      onPressed: () {
                        context.pushNamed(
                          AppRoutes.terms,
                          arguments: state.terms,
                        );
                      },
                    ),
                    const Divider(),
                    CustomRow(
                      firstIcon: const Icon(Icons.logout_outlined),
                      title: lang.logout,
                      lastWidget: const Icon(Icons.logout_rounded),
                      //logout action
                      onPressed: () {},
                    ),
                    const Spacer(),
                    VersionWidget(
                      buildNumber: state.buildNumber,
                      version: state.version,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
