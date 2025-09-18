import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/font_weight.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});
  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}


class _CustomBottomSheetState extends State<CustomBottomSheet> {

  String? _selected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    color: AppColors.darkGrey,
                  ),
                  width: 80.w,
                  height: 4.h,
                ),
              ),
              verticalSpace(16),
              Text(
                AppLocalizations.of(context)!.sort_by,
                style: TextStyle(
                  color: AppColors.pink,
                  fontSize: 20.sp,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
              verticalSpace(16),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return verticalSpace(16);
                  },
                  itemCount: state.listCategoryModel.length,
                  itemBuilder: (context, index) {
                    return RadioGroup(
                      groupValue: _selected,
                      onChanged: (value) {
                        setState(() {
                          _selected = value;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColors.darkGrey.withAlpha(100),
                              ),
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                            width: double.infinity,
                            child: RadioListTile(
                              controlAffinity: ListTileControlAffinity.trailing,
                              value: state.listCategoryModel[index].name,
                              title: Text(
                                state.listCategoryModel[index].name,
                                style: Theme.of(context).textTheme.displayMedium
                                    ?.copyWith(color: AppColors.black),
                              ),
                            ),
                          ),
                          // RadioListTile(value: "Female", title: Text("Male $index"),),
                        ],
                      ),
                    );
                  },
                ),
              ),
              verticalSpace(16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.tune),
                    horizontalSpace(10),
                    Text(AppLocalizations.of(context)!.filter),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
