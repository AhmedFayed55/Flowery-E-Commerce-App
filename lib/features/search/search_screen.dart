import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/products_entity.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_state.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends SearchDelegate {
  final CategoryCubit categoryCubit;

  SearchScreen({
    super.searchFieldLabel,
    super.searchFieldStyle,
    super.searchFieldDecorationTheme,
    super.keyboardType,
    super.textInputAction,
    super.autocorrect,
    super.enableSuggestions,
    required this.categoryCubit,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          showResults(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider.value(
      value: categoryCubit,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          final results = state.allProducts.where((product) {
            return product.title!.toLowerCase().contains(query.toLowerCase());
          }).toList();
          return _buildProductSearch(context, query, results);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider.value(
      value: categoryCubit,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          final results = state.allProducts.where((product) {
            return product.title!.toLowerCase().contains(query.toLowerCase());
          }).toList();
          return _buildProductSearch(context, query, results);
        },
      ),
    );
  }
}

/// Shared Widget
Widget _buildProductSearch(
  BuildContext context,
  String query,
  List<ProductsEntity> results,
) {
  if (query.isEmpty) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.search_For_Any_Product_You_Want,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 15.sp,
          color: AppColors.pink,
        ),
      ),
    );
  } else if (results.isEmpty) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.no_product_found,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 15.sp,
          color: AppColors.pink,
        ),
      ),
    );
  } else {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 163.w / 229.h,
          mainAxisSpacing: 17,
          crossAxisSpacing: 17,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final product = results[index];
          return ProductItem(product: product);
          // return null;
        },
      ),
    );
  }
}