import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/presentation/manager/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../manager/logout_event.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogoutCubit>(),
      child: Scaffold(
        body: InkWell(
          onTap: () => getIt<LogoutCubit>().doIntent(SubmitLogoutEvent()),
          child: Expanded(
            child: Row(
              children: [
                const Icon(Icons.logout),
                Text(AppLocalizations.of(context)!.logout),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.logout),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void logout(context) {
  showDialog(context: context, builder: (context) => const LogoutDialog());
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Center(
        child: Text("LOGOUT", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      content: const Text("Confirm logout!!", textAlign: TextAlign.center),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: const BorderSide(color: Colors.black26),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الديالوج
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text("Cancel"),
              ),
            ),

            // Logout button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // هنا تحط كود تسجيل الخروج
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text("Logout"),
              ),
            ),
          ],
        ),

        // Cancel button
      ],
    );
  }
}
