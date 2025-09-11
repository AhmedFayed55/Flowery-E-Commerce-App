import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/utils/font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends SearchDelegate {
  // String query;
  // SearchScreen({required this.query});

  // Dummy Data
  final List<String> dummyProducts = [
    "Apple iPhone 15",
    "Samsung Galaxy S24",
    "Xiaomi Redmi Note 13",
    "Macbook Pro",
    "Dell XPS 13",
    "Sony Headphones",
    "Smart Watch",
    "Gaming Laptop",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.search),onPressed: (){
        showResults(context);
      },)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // final cubit = context.read<CategoryCubit>();
    final results = dummyProducts.where((product) {
      return product.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return GridView.builder(
      itemCount: results.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 163.w / 229.h,
        mainAxisSpacing: 17,
        crossAxisSpacing: 17,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
        );
        // final product = results[index];
        // return ProductItem(product: product);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final cubit = context.read<CategoryCubit>();
    final results = dummyProducts.where((product) {
      return product.toLowerCase().contains(query.toLowerCase());
    }).toList();
    if(query.isNotEmpty){
      return GridView.builder(
        itemCount: results.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 163.w / 229.h,
          mainAxisSpacing: 17,
          crossAxisSpacing: 17,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(results[index]),
          );
          // final product = results[index];
          // return ProductItem(product: product);
        },
      );
    }else{
      return Center(child: Text("Search For Any Product You Want"),);
    }

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
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.darkGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.darkGrey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.red),
        ),
      ),
    );
  }

}