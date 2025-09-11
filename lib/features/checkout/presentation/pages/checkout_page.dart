import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/entities/cart.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/entities/cart_item.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/entities/product.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/entities/user_cart.dart';
import 'package:flowers_ecommerce_app/features/checkout/presentation/pages/widgets/gift_section.dart';
import 'package:flowers_ecommerce_app/features/checkout/presentation/view_model/cubit/checkout/checkout_cubit.dart';
import 'package:flowers_ecommerce_app/features/checkout/presentation/view_model/cubit/checkout/checkout_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart'; // لو بتستخدم getIt
import 'widgets/delivery_address_section.dart';
import 'widgets/payment_method_section.dart';
import 'widgets/order_summary_section.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key});
  final UserCart userCart = UserCart(
    numOfCartItems: 1,
    message: 'success',
    cart: Cart(
      id: "68c02e7ea8bca307f9e30b07",
      appliedCoupons: [],
      totalPrice: 440,
      cartItems: [
        CartItem(
          id: "68c02e7ea8bca307f9e30b08",
          quantity: 2,
          price: 220,
          product: Product(
            id: "673e2f701159920171828164",
            title: "Fuchsia Brilliance Vase",
            slug: "fuchsia-brilliance-vase",
            description:
                "Discover the elegance of Fuchsia Roses in a Glass Vase, the perfect luxury gift for any occasion. This stunning arrangement showcases the vibrant beauty of fuchsia roses, creating a captivating display that adds a touch of sophistication to any setting. Ideal for birthdays, anniversaries, or just because this luxurious arrangement is sure to impress. Order now to enjoy the best luxury flower delivery and make your special moments unforgettable. Indulge in luxury gifts online with this exquisite floral arrangement.",
            imgCover:
                "https://flower.elevateegy.com/uploads/5165a2c1-3e6c-44db-96f3-97ee83a29da9-cover_image.png",
            images: [
              "https://flower.elevateegy.com/uploads/535a663d-b5de-497b-aa4b-cfde74ab7f92-image_one.png",
              "https://flower.elevateegy.com/uploads/172e848c-e43b-4f1b-8cf9-d4e4ef90101c-image_three.png",
            ],
            price: 220,
            priceAfterDiscount: 112,
            quantity: 966,
            category: "673c46fd1159920171827c85",
            occasion: "673b351e1159920171827ae5",
            rateAvg: 5,
            rateCount: 0,
            sold: 34,
            isSuperAdmin: true,
            createdAt: DateTime.parse("2024-11-20T18:50:24.117Z"),
            updatedAt: DateTime.parse("2025-09-09T13:17:02.355Z"),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CheckoutCubit>()..doIntent(GetLoggedUserAddresses()), 
      child: _CheckoutView(userCart),
    );
  }
}

class _CheckoutView extends StatelessWidget {
  const _CheckoutView(this.userCart);
  final UserCart userCart;

  @override
  Widget build(BuildContext context) {
    final trans = AppLocalizations.of(context)!;
    return Scaffold(
      
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title:  Text(trans .checkout),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  trans.delevery_time,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Spacer(),
                Text(
                  trans.schedule ,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.copyWith(color: AppColors.pink),
                ),
              ],
            ),
          ),
          verticalSpace(16.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(Icons.access_time_rounded, color: AppColors.black),
                Text(
                  "Instant,",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  "Arrive by 03 Sep 2024, 11:00 AM ",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: AppColors.green),
                ),
              ],
            ),
          ),
          verticalSpace(24.h),
          customDivider(),
          verticalSpace(24.h),
          const DeliveryAddressSection(),
          customDivider(),
          verticalSpace(24.h),
          const PaymentMethodSection(),
          verticalSpace(24.h),
          customDivider(),
          const GiftSection(),
          verticalSpace(24.h),
          customDivider(),
          verticalSpace(24.h),
          OrderSummarySection(userCart: userCart),
        ],
      ),
    );
  }

  Widget customDivider() {
    return Container(
      height: 24.h,
      color: AppColors.darkGrey.withValues(alpha: 0.1),
    );
  }
}
