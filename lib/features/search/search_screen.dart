// import 'package:flowers_ecommerce_app/config/theme/colors.dart';
// import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
// import 'package:flowers_ecommerce_app/core/utils/font_weight.dart';
// import 'package:flowers_ecommerce_app/features/categories/domain/entity/products_entity.dart';
// import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SearchScreen extends SearchDelegate {
//   final CategoryCubit cubit;

//   SearchScreen({
//     super.searchFieldLabel,
//     super.searchFieldStyle,
//     super.searchFieldDecorationTheme,
//     super.keyboardType,
//     super.textInputAction,
//     super.autocorrect,
//     super.enableSuggestions,
//     required this.cubit,
//   });

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.search),
//         onPressed: () {
//           showResults(context);
//         },
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return null;
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//    // final cubit = context.read<CategoryCubit>();
//     final results = cubit.state.allProducts.where((product) {
//       return product.title!.toLowerCase()
//       .contains(query.toLowerCase());
//     }).toList();
//     return _buildProductSearch(context, query, results);
//     //return Container();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//    // final cubit = context.read<CategoryCubit>();
//     final results = cubit.state.allProducts.where((product) {
//       return product.title!.toLowerCase().contains(query.toLowerCase());
//     }).toList();
//     return _buildProductSearch(context, query, results);
//     // return Container();
//   }

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     return ThemeData(
//       inputDecorationTheme: InputDecorationTheme(
//         hintStyle: TextStyle(
//           fontSize: 14.sp,
//           fontWeight: AppFontWeight.regular,
//           color: AppColors.white[70],
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(4.r),
//           borderSide: const BorderSide(color: AppColors.darkGrey),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(4.r),
//           borderSide: const BorderSide(color: AppColors.darkGrey),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(4.r),
//           borderSide: const BorderSide(color: AppColors.red),
//         ),
//       ),
//     );
//   }
// }

// /// Shared Widget
// Widget _buildProductSearch(
//   BuildContext context,
//   String query,
//   List<ProductsEntity> results,
// ) {
//   if (query.isEmpty) {
//     return Center(
//       child: Text(
//         AppLocalizations.of(context)!.search_For_Any_Product_You_Want,
//         style: Theme.of(
//           context,
//         ).textTheme.labelSmall?.copyWith(color: AppColors.pink),
//       ),
//     );
//   } else if (results.isEmpty) {
//     return Center(
//       child: Text(
//         AppLocalizations.of(context)!.no_product_found,
//         style: Theme.of(
//           context,
//         ).textTheme.labelSmall?.copyWith(color: AppColors.pink),
//       ),
//     );
//   } else {
//     return Column(
//       children: [
//         Expanded(
//           child: GridView.builder(
//             itemCount: results.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               childAspectRatio: 163.w / 229.h,
//               mainAxisSpacing: 17,
//               crossAxisSpacing: 17,
//               crossAxisCount: 2,
//             ),
//             itemBuilder: (context, index) {
//               return null;
//               // final product = results[index];
//               // return ProductItem(product: product);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/font_weight.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/products_entity.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends SearchDelegate {
  final CategoryCubit cubit;

  SearchScreen({
    super.searchFieldLabel,
    super.searchFieldStyle,
    super.searchFieldDecorationTheme,
    super.keyboardType,
    super.textInputAction,
    super.autocorrect,
    super.enableSuggestions,
    required this.cubit,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
            showSuggestions(context);
          }
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
      value: cubit,
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
      value: cubit,
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
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
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
      ),
    );
  }
}

/// Shared Widget to display products result
Widget _buildProductSearch(
  BuildContext context,
  String query,
  List<ProductsEntity> results,
) {
  if (query.isEmpty) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.search_For_Any_Product_You_Want,
        style: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: AppColors.pink),
      ),
    );
  } else if (results.isEmpty) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.no_product_found,
        style: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: AppColors.pink),
      ),
    );
  } else {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 17,
          crossAxisSpacing: 17,
          childAspectRatio: 163.w / 229.h,
        ),
        itemBuilder: (context, index) {
          final product = results[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                    child: Image.network(
                      product.image ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

