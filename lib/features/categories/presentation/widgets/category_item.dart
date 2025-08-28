import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final int index;

  const CategoryItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  state.listCategoryModel[index].image,
                  width: 147.w,
                  height: 131.h,
                  fit: BoxFit.fill,
                ),
              ),
              verticalSpace(8),
              Text(state.listCategoryModel[index].name),
              verticalSpace(4),
              Text("EGP 600"),
              const Spacer(),
              SizedBox(
                height: 30.h,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Icon(Icons.shopping_cart_outlined),
                      horizontalSpace(8),
                      const Text("Add to cart"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
