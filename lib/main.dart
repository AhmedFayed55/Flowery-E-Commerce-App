import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/routing/route_generator.dart';
import 'config/theme/app_theme.dart';
import 'core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/helpers/shared_pref.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/view_model/profile_setting_cubit.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/view_model/profile_setting_event.dart';

import 'features/profile/presentation/view_model/profile_setting_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  final savedLocale =
      getIt<SharedPrefHelper>().getData(key: Constants.languageCode)
          as String? ??
      Constants.enKey;

  runApp(
    BlocProvider(
      create: (_) =>
          getIt<ProfileSettingCubit>()
            ..doIntent(ChangeLanguageEvent(savedLocale)),
      child: const FlowersEcommerce(),
    ),
  );
}

class FlowersEcommerce extends StatelessWidget {
  const FlowersEcommerce({super.key});

  @override
  Widget build(BuildContext context) {
    final isRemember =
        getIt<SharedPrefHelper>().getData(key: Constants.isRemeber) as bool? ??
        false;

    return BlocBuilder<ProfileSettingCubit, ProfileSettingState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              locale: Locale(state.localizationCode),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: AppRoutes.searchScreen,
              // isRemember
              //     ? AppRoutes.mainLayout
              //     : AppRoutes.login,
              // theme: AppTheme.lightTheme,
            );
          },
        );
      },
    );
  }
}
