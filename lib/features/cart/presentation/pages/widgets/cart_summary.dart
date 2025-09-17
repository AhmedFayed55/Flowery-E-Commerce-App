import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/font_weight.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    var trans = AppLocalizations.of(context)!;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final userCart = state.userCart;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trans.subtotal,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  "${trans.egp} ${userCart?.cart.totalPrice ?? 0}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            verticalSpace(8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                 trans.delivery_fee ,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  "${trans.egp} 50",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            verticalSpace(16.h),
            const Divider(color: AppColors.darkGrey, thickness: 1),
            verticalSpace(8.h),
            Row(
              children: [
                Text(
                  trans.total,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  "${trans.egp} ${(userCart!.cart.totalPrice! + 50 ).toInt()}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            verticalSpace(24.h),
            ElevatedButton(onPressed: () {}, child:  Text(trans.checkout)),
          ],
        );
      },
    );
  }
}
