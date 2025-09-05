import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
class VersionWidget extends StatelessWidget {
  const VersionWidget({
    super.key,
    required this.buildNumber,
    required this.version,
  });
  final String version;
  final String buildNumber;

  @override
  Widget build(BuildContext context) {
    return Text(
      "v $version - ($buildNumber)",
      style: Theme.of(
        context,
      ).textTheme.bodySmall!.copyWith(color: AppColors.darkGrey),
    );
  }
}
