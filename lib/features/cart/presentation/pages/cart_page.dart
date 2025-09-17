import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/services/token_service.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/pages/widgets/cart_bloc_builder.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var trans = AppLocalizations.of(context)!;
    if (!getIt.get<TokenService>().isTokenSaved) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(trans.you_should_login),
                verticalSpace(20),
                ElevatedButton(
                  onPressed: () {
                    context.pushReplacementNamed(AppRoutes.login);
                  },
                  child: Text(trans.login),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return CartBlocBuilder();
  }
}
