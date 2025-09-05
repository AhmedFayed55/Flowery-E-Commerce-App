import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/presentation/manager/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../widgets/logout_alert_dialogue.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogoutCubit>(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: Text(AppLocalizations.of(context)!.logout),
              trailing: const Icon(Icons.logout),
              onTap: () => _logout(context),
            ),
          ),
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
