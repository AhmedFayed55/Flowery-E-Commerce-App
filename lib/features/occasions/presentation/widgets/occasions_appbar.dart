import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OccasionsAppbar extends StatelessWidget {
  const OccasionsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10.w,
          children: [
            const Icon(Icons.arrow_back_ios_new),
            Text(locale.occasion, style: theme.textTheme.bodyLarge,),
          ],
        ),
        Text("         ${locale.bloom_with}",style: theme.textTheme.labelSmall?.copyWith(
          fontWeight: AppFontWeight.medium
        ),)
      ],
    );
  }
}
