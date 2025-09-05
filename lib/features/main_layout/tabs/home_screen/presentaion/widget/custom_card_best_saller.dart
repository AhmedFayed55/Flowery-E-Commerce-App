import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/best_saller_entity.dart';

class CustomCardBestSaller extends StatelessWidget {
  const CustomCardBestSaller({
    super.key,
    required this.itemBestSeller,
    required this.onTap,
  });
  final List<BestSallerEntity> itemBestSeller;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.h,
      width: double.infinity,
      child: ListView.separated(
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsetsGeometry.only(left: 10.w, right: 10.w),
        ),
        itemCount: itemBestSeller.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  context.pushNamed(AppRoutes.productDetails,arguments: itemBestSeller[index].id);
                },
                child: Image.network(
                  itemBestSeller[index].imgCover,
                  fit: BoxFit.fill,
                  width: 130.w,
                  height: 140.h,
                ),
              ),
              Padding(
                padding: const EdgeInsetsGeometry.only(top: 4, bottom: 4),
                child: Text(
                  itemBestSeller[index].title.substring(
                    0,
                    itemBestSeller[index].title.length >= 20
                        ? 20
                        : itemBestSeller[index].title.length,
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Text(
                '${itemBestSeller[index].price.toInt()} ${AppLocalizations.of(context)!.egp}',
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
