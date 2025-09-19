import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/presentation/pages/widgets/product_details_bloc_builder.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/presentation/view_model/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../add_to_cart/presentation/view_model/add_to_cart_cubit.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({super.key, required this.productId});
  final String productId;
  final viewModel = getIt<ProductsDetalis>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              viewModel
                ..doIntent(GetSpecificProductEvent(productId: productId)),
        ),
        BlocProvider(create: (context) => getIt<AddToCartCubit>()),
      ],
      child: const Scaffold(body: ProductDetailsBlocBuilder()),
    );
  }
}
