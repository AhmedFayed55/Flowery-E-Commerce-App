import 'package:flowers_ecommerce_app/features/most_selling/presentation/entites/products_entity.dart';
import 'package:flowers_ecommerce_app/features/most_selling/presentation/pages/widgets/product_cart.dart';
import 'package:flutter/widgets.dart';

class MostSellingProductsGridView extends StatelessWidget {
  const MostSellingProductsGridView({super.key , required this.products});
  final List<ProductsEntity> products ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
          childAspectRatio: 1.94/3,
          crossAxisSpacing: 17,
          mainAxisSpacing: 17
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCart(product: products[index]);
        },
      ),
    );
  }
}