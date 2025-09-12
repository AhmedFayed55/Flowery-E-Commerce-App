import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entity/products_entity.dart';

class ProductItem extends StatelessWidget {
  // final int index;
  final ProductsEntity product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
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
                  width: 140.w,
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
                      child: const Icon(Icons.error, size: 50, color: Colors.red),
                    );
                  },
                ),
              ),
              verticalSpace(8),
              Text(
                product.title?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              verticalSpace(4),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "EGP ${product.priceAfterDiscount ??""} ",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    TextSpan(
                      text:
                          "${product.price ?? ""}",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(
                      text: " 20%",
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(color: AppColors.green),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 20.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Add to Cart
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // عشان النص والأيقونة يتظبطوا في النص
      mainAxisSize: MainAxisSize.min, // يخلي ال
                    children: [
                      const Icon(Icons.shopping_cart_outlined),
                      horizontalSpace(8),
                      const Text("Add to cart"),
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
