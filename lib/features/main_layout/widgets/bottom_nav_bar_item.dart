import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
  });

  final String label;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 7.h,
      children: [
        SvgPicture.asset(
            colorFilter: ColorFilter.mode(isSelected ? theme.primaryColor : theme.colorScheme.onPrimaryFixed
                , BlendMode.srcIn),
            height: 24.h, width: 24.w, icon),
        Text(label,style: theme.textTheme.bodySmall!.copyWith(
            color: isSelected ? theme.primaryColor : theme.colorScheme.onPrimaryFixed
        ),),
      ],
    );
  }
}