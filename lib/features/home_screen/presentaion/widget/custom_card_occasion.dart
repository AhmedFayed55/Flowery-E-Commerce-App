import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/occasion_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardOccasion extends StatelessWidget {
  const CustomCardOccasion({
    super.key,
    required this.itemOccasion,
    required this.onTap,
  });
  final List<OccasionEntity> itemOccasion;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      width: double.infinity,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
             Padding(padding: EdgeInsets.all(10.sp)),
        itemCount: itemOccasion.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Image.network(
                  itemOccasion[index].image,
                  fit: BoxFit.fill,
                  width: 130.w,
                  height: 150.h,
                ),
              ),
              Text(
                itemOccasion[index].name.substring(
                  0,
                  itemOccasion[index].name.length >= 20
                      ? 20
                      : itemOccasion[index].name.length,
                ),
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(fontSize: 14.sp),
              ),
            ],
          );
        },
      ),
    );
  }
}
