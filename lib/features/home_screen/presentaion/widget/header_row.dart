import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flutter/material.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    super.key,
    required this.nameSection,
    required this.onPressed,
  });
  final String nameSection;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(nameSection, style: Theme.of(context).textTheme.labelMedium),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppLocalizations.of(context)!.view_all,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: AppColors.pink,
            ),
          ),
        ),
      ],
    );
  }
}
