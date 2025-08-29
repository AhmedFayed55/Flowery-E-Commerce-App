import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/features/main_layout/tabs/home_screen/domain/view_model/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/occasion_entity.dart';

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
                onTap: ()=>context.pushNamed(AppRoutes.occasions,arguments:{
                  "occasions": context.read<HomeBloc>().occasion,
                  "index": index,
                }, ),
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
