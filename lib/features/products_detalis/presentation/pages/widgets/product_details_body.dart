import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/entites/product_entity.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/presentation/pages/widgets/image_and_dots_indecator_builder.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/presentation/pages/widgets/products_details_and_description.dart';
import 'package:flutter/material.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key, required this.product});
  final ProductEntity product;

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.50,
          child: ImageAndDotsIndecatorBuilder(images: widget.product.images!),
        ),
        verticalSpace(16),
        ProductsDetailsAndDescription(product: widget.product),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(onPressed: () {
            //Add to cart logic
          }, child: const Text('Add to cart')),
        ),
        verticalSpace(31),
      ],
    );
  }
}

