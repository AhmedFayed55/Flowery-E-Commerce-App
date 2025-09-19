import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/flutter_toast.dart';
import '../../../add_to_cart/presentation/view_model/add_to_cart_cubit.dart';
import '../../../add_to_cart/presentation/view_model/add_to_cart_event.dart';
import '../../domain/entity/products_entity.dart';

class ProductItem extends StatelessWidget {
  final ProductsEntity product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var translate = AppLocalizations.of(context)!;
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        var cubit = context.read<CategoryCubit>();
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product.imgCover ?? "",
                  width: 147.w,
                  height: 131.h,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      height: 131.h,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      height: 131.h,
                      child: const Icon(
                        Icons.error,
                        size: 50,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
              verticalSpace(8),
              Text(
                product.title ?? "",
                style: Theme.of(context).textTheme.labelSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              verticalSpace(4),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "${AppLocalizations.of(context)!.egp} ${product.priceAfterDiscount ?? ""}  ",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    TextSpan(
                      text: "${product.price ?? ""}",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(
                      text:
                          "  ${cubit.getDiscountPercentage(product.price, product.priceAfterDiscount)}",
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(color: AppColors.green),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 30.h,
                child: ElevatedButton(
                  onPressed: () async {
                    final cubit = context.read<AddToCartCubit>();

                    await cubit.doIntent(AddProductToCart(product.id!));

                    final isSuccess = cubit.state.isSucsses;
                    if (isSuccess) {
                      ToastMessage.toastMsg(
                        translate.order_placed_success,
                        backgroundColor: AppColors.green,
                      );
                    } else {
                      ToastMessage.toastMsg(
                        cubit.state.errorMsg,
                        backgroundColor: AppColors.red,
                      );
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.shopping_cart_outlined),
                      horizontalSpace(8),
                      Text(
                        translate.add_to_Cart,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
