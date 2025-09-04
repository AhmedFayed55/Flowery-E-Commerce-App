import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  final String? selectedGender;
  final Function(String?) onClicked;

  const GenderSelection({
    super.key,
    required this.selectedGender,
    required this.onClicked,
  });

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return RadioGroup(
      groupValue: widget.selectedGender,
      onChanged: widget.onClicked,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              AppLocalizations.of(context)!.gender,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          horizontalSpace(30),
          Expanded(
            flex: 2,
            child: RadioListTile(
              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.pink;
                }
                return AppColors.pink;
              }),
              contentPadding: EdgeInsets.zero,
              value: AppLocalizations.of(context)!.female,
              title: Text(
                AppLocalizations.of(context)!.female,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: RadioListTile(
              contentPadding: EdgeInsets.zero,
              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.pink;
                }
                return AppColors.pink;
              }),
              value: AppLocalizations.of(context)!.male,
              title: Text(
                AppLocalizations.of(context)!.male,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
