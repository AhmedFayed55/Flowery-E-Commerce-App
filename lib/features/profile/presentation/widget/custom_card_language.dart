import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final Icon icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: SizedBox(
        height: 70.h,
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Row(
                children: [
                  Text(title, style: Theme.of(context).textTheme.bodySmall),
                  const Spacer(),
                  icon,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
