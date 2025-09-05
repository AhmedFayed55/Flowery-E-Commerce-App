import 'package:flowers_ecommerce_app/features/profile/presentation/widget/custom_row.dart';
import 'package:flutter/material.dart';

class CustomNotificationSwitch extends StatelessWidget {
  const CustomNotificationSwitch({
    super.key,
    required this.onChanged,
    required this.onPressed,
    required this.title,
    required this.valueNoti,
  });
  final String title;
  final bool valueNoti;
  final void Function()? onPressed;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomRow(
      firstIcon: Switch(value: valueNoti, onChanged: onChanged),
      title: title,
      onPressed: onPressed,
    );
  }
}
