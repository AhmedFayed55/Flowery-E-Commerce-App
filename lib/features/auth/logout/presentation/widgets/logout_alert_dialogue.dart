import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/core/helpers/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/l10n/translations/app_localizations.dart';
import '../../../../../core/utils/font_weight.dart';
import '../manager/logout_cubit.dart';
import '../manager/logout_event.dart';
import '../manager/logout_state.dart';

class LogoutAlertDialogue extends StatelessWidget {
  const LogoutAlertDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        localizations.logout,
        textAlign: TextAlign.center,
        style: theme.textTheme.labelMedium!.copyWith(
          fontWeight: AppFontWeight.semiBold,
        ),
      ),
      content: Text(
        localizations.confirm_logout,
        textAlign: TextAlign.center,
        style: theme.textTheme.displayMedium!.copyWith(
          color: theme.colorScheme.secondary,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: BorderSide(color: theme.colorScheme.onSurface),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  localizations.cancel,
                  style: theme.textTheme.displaySmall!.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: BlocListener<LogoutCubit, LogoutState>(
                listener: (context, state) {
                  if (state.errorMsg != null) {
                    context.pop();
                    ToastMessage.toastMsg(
                      state.errorMsg!,
                      backgroundColor: theme.colorScheme.error,
                    );
                  }
                  if (state.isSuccess) {
                    context.pop();
                    context.pushNamedAndRemoveUntil(
                      AppRoutes.login,
                      predicate: (route) => true,
                    );
                    ToastMessage.toastMsg(localizations.logout_successfully);
                  }
                },
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () =>
                      context.read<LogoutCubit>().doIntent(SubmitLogoutEvent()),
                  child: Text(
                    localizations.logout,
                    style: theme.textTheme.displayMedium!.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
