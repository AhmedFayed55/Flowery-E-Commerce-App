import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/font_weight.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/user_cart.dart';
import 'package:flowers_ecommerce_app/features/checkout/presentation/view_model/cubit/checkout/checkout_cubit.dart';
import 'package:flowers_ecommerce_app/features/checkout/presentation/view_model/cubit/checkout/checkout_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/theme/colors.dart';
import '../../../../../core/helpers/spacing.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key, required this.userCart});
  final UserCart userCart;

  @override
  Widget build(BuildContext context) {
    final trans = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                trans.subtotal,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: AppFontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Text(
                "${trans.egp} ${userCart.cart.totalPrice ?? 0}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                trans.delivery_fee,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: AppFontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Text(
                "${trans.egp} ${((userCart.cart.totalPrice ?? 0) * 0.1).toInt()}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: AppFontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const Spacer(),
              Text(
                "${trans.egp} ${userCart.cart.totalPrice! + ((userCart.cart.totalPrice ?? 0) * 0.1).toInt()}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: AppFontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          verticalSpace(24.h),
          BlocBuilder<CheckoutCubit, CheckoutState>(
            builder: (context, state) {
              final isGift = state.isGift;

              final isGiftInfoValid =
                  !isGift ||
                  ((state.giftStreet?.trim().isNotEmpty ?? false) &&
                      (state.giftPhone?.trim().isNotEmpty ?? false) &&
                      (state.giftCity?.trim().isNotEmpty ?? false));

              final isCheckoutInfoValid =
                  state.selectedPaymentMethod != null &&
                  state.selectedAddress != null;

              final isButtonEnabled = isGift
                  ? isGiftInfoValid
                  : isCheckoutInfoValid;

              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () =>
                            context.read<CheckoutCubit>().doIntent(PlaceOrder())
                      : null,
                  child: state.isSubmitting
                      ? const CircularProgressIndicator(color: Colors.white)
                      :  Text(trans.place_order),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
