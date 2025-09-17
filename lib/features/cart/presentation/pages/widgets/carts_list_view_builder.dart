import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/pages/widgets/cart.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/view_model/cubit/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartsListViewBuilder extends StatelessWidget {
  const CartsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var trans = AppLocalizations.of(context)!;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final userCart = state.userCart;
        if (userCart == null || userCart.cart.cartItems == null) {
          return Center(child: Text(trans.your_cart_is_empty));
        }
        final cartItems = userCart.cart.cartItems!;

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.44,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: cartItems.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: CartItemCard(
                userItem: cartItems[index],
                onDelete: () {
                  final productId = cartItems[index].product!.id!;

                  context.read<CartCubit>().doIntent(
                    DeleteCartItemEvent(productId),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
