import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/entites/product_entity.dart';
import 'package:flutter/material.dart';

class ProductsDetailsAndDescription extends StatelessWidget {
  const ProductsDetailsAndDescription({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'EGP ${product.priceAfterDiscount!}',
                        style: Theme.of(context).textTheme.displayLarge!,
                      ),
                      horizontalSpace(8),
                      Text(
                        '${product.price!}',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(4),
                  Text(
                    'All prices include tax',
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(color: Colors.grey.shade500),
                  ),
                ],
              ),
              const Spacer(),
          
              Text("Status: ", style: Theme.of(context).textTheme.displayMedium!),
              Text(
                product.quantity! <= 0 ? "out of stock" : "In stock",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(),
              ),
            ],
          ),
          verticalSpace(8),
          Text(
            product.title!,
            style: Theme.of(context).textTheme.displayMedium!,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(24),
          Text('Description\n', style: Theme.of(context).textTheme.displayMedium),
          Text(
            product.description!,
            style: Theme.of(context).textTheme.displaySmall!,
          ),
           

        ],
      ),
    );
  }
}
