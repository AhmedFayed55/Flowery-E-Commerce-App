import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/widgets/gender_selection.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? _selectedGender;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              const ImagePicker(),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.first_name),
                      ),
                    ),
                  ),
                  horizontalSpace(17),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.last_name),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.email),
                ),
              ),
              verticalSpace(24),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.phone_number),
                ),
              ),
              verticalSpace(24),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: "★", //"\u2605"
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
                  /// update clickable
                },
                child: Text(AppLocalizations.of(context)!.update),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onGenderChanged(String? value) {
    setState(() => _selectedGender = value);
  }
}
