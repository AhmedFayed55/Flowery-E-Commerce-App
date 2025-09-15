import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/user_address_data_entity.dart';

class SavedAddressListViewItem extends StatelessWidget {
  const SavedAddressListViewItem({
    super.key,
    required this.address,
    required this.remove,
  });

  final UserAddressDataEntity address;
  final void Function() remove;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 3),
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
                  const Icon(Icons.location_on_outlined),
                  Text(
                    address.city ?? '',
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(fontSize: 16.sp),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: remove,
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
            address.street ?? '',
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
