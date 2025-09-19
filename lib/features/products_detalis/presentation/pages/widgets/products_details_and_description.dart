import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/entites/product_entity.dart';
import 'package:flutter/material.dart';

class ProductsDetailsAndDescription extends StatelessWidget {
  const ProductsDetailsAndDescription({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    var trans = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    '${trans.egp} ${product.priceAfterDiscount!}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  horizontalSpace(8),
                  Text(
                    '${product.price!}',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              Row(
                children: [
                  Text(
                    "${trans.status}: ",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    product.quantity! <= 0
                        ? trans.out_of_stock
                        : trans.in_stock,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(4),

          Text(
            trans.all_products_include_tax,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: Colors.grey.shade500),
          ),
          verticalSpace(8),

          Text(
            product.title!,
            style: Theme.of(context).textTheme.displayMedium!,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(24),
          Text(
            '${trans.description}\n',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            maxLines: 10,
            product.description!,
            style: Theme.of(context).textTheme.displaySmall!,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
