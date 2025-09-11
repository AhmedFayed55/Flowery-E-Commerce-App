import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends SearchDelegate {
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
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // final cubit = context.read<CategoryCubit>();
    // final results = cubit.state.allProducts.where((product) {
    //   return product.toLowerCase().contains(query.toLowerCase());
    // }).toList();
    // return _buildSearchBody(context, query, results);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final cubit = context.read<CategoryCubit>();
    // final results = cubit.state.allProducts.where((product) {
    //   return product.toLowerCase().contains(query.toLowerCase());
    // }).toList();
    // return _buildSearchBody(context, query, results);
    return Container();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: AppFontWeight.regular,
          color: AppColors.white[70],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(color: AppColors.darkGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(color: AppColors.darkGrey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(color: AppColors.red),
        ),
      ),
    );
  }
}

/// Shared Widget
Widget _buildSearchBody(
  BuildContext context,
  String query,
  List<String> results,
) {
  if (query.isEmpty) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.search_For_Any_Product_You_Want,
        style: Theme.of(
          context,
        ).textTheme.labelSmall?.copyWith(color: AppColors.pink),
      ),
    );
  } else if (results.isEmpty) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.no_product_found,
        style: Theme.of(
          context,
        ).textTheme.labelSmall?.copyWith(color: AppColors.pink),
      ),
    );
  } else {
    return GridView.builder(
      itemCount: results.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 163.w / 229.h,
        mainAxisSpacing: 17,
        crossAxisSpacing: 17,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return null;
        // final product = results[index];
        // return ProductItem(product: product);
      },
    );
  }
}
