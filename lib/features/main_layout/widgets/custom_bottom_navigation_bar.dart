import 'package:flowers_ecommerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/l10n/translations/app_localizations.dart';
import 'bottom_nav_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    final List<String> labels = [
      locale.home,
      locale.categories,
      locale.cart,
      locale.profile,
    ];
    final List<String> icons = [
      AppImages.homeIcon,
      AppImages.categoriesIcon,
      AppImages.cartIcon,
      AppImages.profileIcon,
    ];
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 16,vertical: 6.5) ,
      height: 56.h,
      width: 375.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          labels.length,
          (index) => InkWell(
            onTap: () => onTap(index),
            child: BottomNavBarItem(
              label: labels[index],
              icon: icons[index],
              isSelected: currentIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}


