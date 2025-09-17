import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/user_cart.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/pages/widgets/cart_summary.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/pages/widgets/carts_list_view_builder.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/pages/widgets/location_widget.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key, required this.userCart});
  final UserCart userCart;

  int getItemCount(UserCart cart) {
    int count = 0;
    cart.cart.cartItems?.forEach((item) {
      count += item.quantity ?? 0;
    });
    return count;
  }

  @override
  Widget build(BuildContext context) {
    var trans = AppLocalizations.of(context)!;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Text('${trans.cart} '),
                Text(
                  '(${getItemCount(userCart)} ${trans.items})',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LocationWidget(),
                verticalSpace(24.h),

                const CartsListViewBuilder(),
                verticalSpace(8.h),

                const CartSummary(),
              ],
            ),
          ),
        );
      },
    );
  }
}
