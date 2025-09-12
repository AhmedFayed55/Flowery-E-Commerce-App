import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedAddressListViewItem extends StatelessWidget {
  const SavedAddressListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(0, 3),
            blurRadius: 3.0,
            spreadRadius: 0.0,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      padding: REdgeInsets.all(16),
      margin: REdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(
                    "City",
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(fontSize: 16.sp),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.red,
                    ),
                  ),
                  const Icon(Icons.mode_edit_outline),
                ],
              ),
            ],
          ),
          Text(
            "Area",
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
