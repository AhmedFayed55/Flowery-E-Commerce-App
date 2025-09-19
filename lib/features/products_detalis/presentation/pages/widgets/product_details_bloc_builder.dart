import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/presentation/pages/widgets/product_details_body.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/presentation/view_model/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ProductDetailsBlocBuilder extends StatelessWidget {
  const ProductDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var trans = AppLocalizations.of(context)!;
    return Stack(
      children: [
        BlocBuilder<ProductsDetalis, ProductDetailsState>(
          builder: (context, state) {
            if (state.isSuccess) {
              return ProductDetailsBody(product: state.product!);
            } else if (state.isFailure) {
              return Center(child: Text(state.errorMessage!));
            } else {
              return Center(
                child: Shimmer(
                  child: Text(
                    trans.loading,
                    style: const TextStyle(fontSize: 40, color: Colors.grey),
                  ),
                ),
              );
            }
          },
        ),
        Positioned(
          top: 48,
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 26,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
