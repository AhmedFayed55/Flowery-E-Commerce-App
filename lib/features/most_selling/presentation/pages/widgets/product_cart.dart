import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main_layout/tabs/home_screen/domain/entities/best_saller_entity.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key, required this.product});
  final BestSallerEntity product;

  String editTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String calculateDiscount(num price, num discountPrice) {
    double discount = ((price - discountPrice) / price) * 100;
    return "${discount.toStringAsFixed(0)}%";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 240.h,
      width: 165.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white[70]!),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: REdgeInsets.all(8),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            product.imgCover,
            width: 147.w,
            height: 131.h,
            fit: BoxFit.fill,
          ),
          Flexible(
            child: Padding(
              padding:  REdgeInsets.only(left: 13.5),
              child: Column(
                spacing: 4.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    editTitle(product.title),
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                  Row(
                    spacing: 5.w,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.egp,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        product.price.toInt().toString(),
                        style: theme.textTheme.titleSmall,
                      ),
                      verticalSpace(5),
                      Text(
                        product.priceAfterDiscount.toInt().toString(),
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: AppColors.darkGrey,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 11.sp
                        ),
                      ),
                      verticalSpace(5),
                      Text(
                        calculateDiscount(
                          product.price.toInt(),
                          product.priceAfterDiscount.toInt(),
                        ),
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(minimumSize: Size(150.w, 30.h)),
            child: Row(
              spacing: 5.w,
              children: [
                const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                Text(
                  AppLocalizations.of(context)!.add_to_cart,
                  style: theme.textTheme.bodyMedium ?.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}