import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 40.r,
          child: Icon(Icons.person, size: 30.sp),
        ),
        InkWell(
          onTap: () {
            /// update profile image
          },
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadiusGeometry.circular(5.r),
              color: AppColors.white[50],
            ),
            child: const Icon(Icons.camera_alt_outlined, size: 20),
          ),
        ),
      ],
    );
  }
}
