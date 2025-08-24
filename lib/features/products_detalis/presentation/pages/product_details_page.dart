import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/presentation/pages/widgets/product_details_bloc_builder.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/presentation/view_model/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({super.key});
  final  String productId = "6745129a90ab40a068540353";
  final viewModel = getIt<ProductsDetalis>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          viewModel..doIntent(GetSpecificProductEvent(productId: productId)),
      child: const Scaffold(
        body: ProductDetailsBlocBuilder(),
      ),
    );
  }
}
