import 'dart:io';

import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/helpers/validators.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/edit_profile_request.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/cubit/edit_profile_event.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/cubit/edit_profile_state.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/widgets/gender_selection.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/widgets/image_picker.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/widgets/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileCubit editProfileCubit = getIt.get<EditProfileCubit>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _selectedGender;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // @override
  // void initState() {
  //   firstNameController.text = "model";
  //   lastNameController.text = "model";
  //   emailController.text = "model";
  //   phoneController.text = "model";
  //   passwordController.text = "model";
  //   editProfileCubit.state.pickedImage = File("model");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => editProfileCubit,
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state.isSuccess) {
            showDialog(context: context, builder: (context) {
              return const SuccessDialog();
            },);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.keyboard_arrow_left),
                onPressed: () {
                  /// navigate to main profile
                },
              ),
              scrolledUnderElevation: 0,
              elevation: 0,
              title: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.edit_profile,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(fontSize: 20.sp),
                  ),
                  const Spacer(),
                  Badge(child: Icon(Icons.notifications_none, size: 24.sp)),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                       const ProfileImagePicker(),
                      verticalSpace(24),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return AppLocalizations.of(context)!.first_name_is_required;
                                }
                                return null;
                              },
                              controller: firstNameController,
                              decoration: InputDecoration(
                                label: Text(
                                  AppLocalizations.of(context)!.first_name,
                                ),
                              ),
                            ),
                          ),
                          horizontalSpace(17),
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return AppLocalizations.of(context)!.last_name_is_required;
                                }
                                return null;
                              },
                              controller: lastNameController,
                              decoration: InputDecoration(
                                label: Text(
                                  AppLocalizations.of(context)!.last_name,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(24),
                      TextFormField(
                        validator: (value) {
                          return Validations.validateEmail(
                            emailController.text,
                          );
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          label: Text(AppLocalizations.of(context)!.email),
                        ),
                      ),
                      verticalSpace(24),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          return Validations.validatePhoneNumber(
                            phoneController.text,
                          );
                        },
                        controller: phoneController,
                        decoration: InputDecoration(
                          label: Text(
                            AppLocalizations.of(context)!.phone_number,
                          ),
                        ),
                      ),
                      verticalSpace(24),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        readOnly: true,
                        obscuringCharacter: "★",
                        decoration: InputDecoration(
                          suffixIcon: TextButton(
                            onPressed: () {
                              /// navigate to reset password screen
                            },
                            child: Text(AppLocalizations.of(context)!.change),
                          ),
                          label: Text(AppLocalizations.of(context)!.password),
                        ),
                      ),
                      verticalSpace(24),
                      GenderSelection(
                        selectedGender: _selectedGender,
                        onClicked: _onGenderChanged,
                      ),
                      verticalSpace(48),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            editProfileCubit.doIntent(
                              UpdateProfileEvent(
                                editProfileRequest: EditProfileRequest(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  email: emailController.text,
                                  phoneNumber: phoneController.text,
                              ),
                            ),);
                            editProfileCubit.doIntent(UploadPhotoEvent(file: state.pickedImage ?? File("")));
                          }
                        },
                        child: state.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.white,
                                ),
                              )
                            : Text(AppLocalizations.of(context)!.update),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onGenderChanged(String? value) {
    setState(() => _selectedGender = value);
  }
}
