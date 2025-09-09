import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Lottie.asset(
              AppImages.successlotti,
              repeat: true, // يتكرر ولا مرة واحدة
              reverse: false, // يعكس ولا لا
              animate: true,
            ),
            Text(
              AppLocalizations.of(context)!.your_oredr_placed,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "${AppLocalizations.of(context)!.successfully}!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            verticalSpace(30),
            ElevatedButton(
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.track_order),
            ),
          ],
        ),
      ),
    );
  }
}
