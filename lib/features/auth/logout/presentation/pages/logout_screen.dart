import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/presentation/manager/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/di.dart';
import '../widgets/logout_alert_dialogue.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogoutCubit>(),
      child: Center(
        child: ListTile(
          leading: Icon(Icons.logout, color: AppColors.darkGrey, size: 16.sp),
          title: Text(
            AppLocalizations.of(context)!.logout,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.black),
          ),
          trailing: Icon(Icons.logout, color: AppColors.darkGrey, size: 24.sp),
          onTap: () => _logout(context),
        ),
      ),
    );
  }
}

void _logout(context) {
  showDialog(
    context: context,
    builder: (_) {
      return BlocProvider.value(
        value: getIt<LogoutCubit>(),
        child: const LogoutAlertDialogue(),
      );
    },
  );
}
