import 'package:flowers_ecommerce_app/core/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/l10n/translations/app_localizations.dart';
import '../manager/add_new_address_cubit/add_new_address_cubit.dart';
import '../manager/add_new_address_cubit/add_new_address_state.dart';
import 'drop_down_button_widget.dart';

class AddressDetailsTextFormFields extends StatefulWidget {
  const AddressDetailsTextFormFields({super.key});

  @override
  State<AddressDetailsTextFormFields> createState() =>
      _AddressDetailsTextFormFieldsState();
}

class _AddressDetailsTextFormFieldsState
    extends State<AddressDetailsTextFormFields> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final viewModel = context.read<AddressDetailsCubit>();
    return Column(
      spacing: 24.h,
      children: [
        CustomTextFormField(
          controller: viewModel.address,
          validator: Validations.validateRequired,
          hint: localizations.enter_the_address,
          label: localizations.address,
        ),
        CustomTextFormField(
          controller: viewModel.phone,
          validator: Validations.validatePhoneNumber,
          hint: localizations.phone_number,
          label: localizations.enter_the_phone_number,
        ),
        CustomTextFormField(
          controller: viewModel.username,
          validator: Validations.validateRequired,
          hint: localizations.recipient_name,
          label: localizations.enter_the_recipient_name,
        ),
        BlocBuilder<AddressDetailsCubit, AddressDetailsState>(
          builder: (context, state) {
            if (state.isLoadingGetPLaces ||
                state.errorGetCities != null ||
                state.errorGetAreas != null) {
              return Row(
                spacing: 17.w,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      label: localizations.city,
                      hint: localizations.city,
                    ),
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      label: localizations.area,
                      hint: localizations.area,
                    ),
                  ),
                ],
              );
            }
            return Row(
              spacing: 17.w,
              children: [
                DropDownButtonWidget(
                  label: localizations.city,
                  list: state.cities,
                  value: context.read<AddressDetailsCubit>().city.text,
                  onChanged: (val) {
                    context.read<AddressDetailsCubit>().updateSelectedCity(val);
                  },
                ),
                DropDownButtonWidget(
                  value: context.read<AddressDetailsCubit>().area.text,
                  onChanged: (val) {
                    context.read<AddressDetailsCubit>().updateSelectedArea(val);
                  },
                  label: localizations.area,
                  list: state.areas,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
