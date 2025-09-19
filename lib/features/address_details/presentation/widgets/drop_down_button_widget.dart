import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/validators.dart';

class DropDownButtonWidget extends StatelessWidget {
  const DropDownButtonWidget({
    super.key,
    required this.label,
    required this.list,
    this.onChanged,
    this.value,
  });

  final String label;
  final List<String> list;
  final String? value;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: DropdownButtonFormField<String>(
        validator: Validations.validateRequired,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 10.h,
          ),
        ),
        initialValue: value?.isNotEmpty == true ? value : null,
        hint: Text(list.isNotEmpty ? list[0] : label),
        items: list.map((e) {
          return DropdownMenuItem(value: e, child: Text(e));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
