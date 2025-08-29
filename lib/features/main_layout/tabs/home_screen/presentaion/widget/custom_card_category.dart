import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/category_entity.dart';

class CustomCardCategory extends StatelessWidget {
  const CustomCardCategory({
    super.key,
    required this.itemCategory,
    required this.onTap,
  });
  final List<CategoryEntity> itemCategory;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: double.infinity,
      child: ListView.separated(
        itemCount: itemCategory.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsetsGeometry.only(left: 10.w, right: 10.w),
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 70.w,
                  height: 65.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightPink,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: Center(
                    child: Image.network(
                      itemCategory[index].image,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ),
              ),
              Text(
                itemCategory[index].name.substring(
                  0,
                  itemCategory[index].name.length >= 9
                      ? 9
                      : itemCategory[index].name.length,
                ),
                style: Theme.of(
                  context,
                ).textTheme.labelSmall!.copyWith(color: AppColors.black),
              ),
            ],
          );
        },
      ),
    );
  }
}
