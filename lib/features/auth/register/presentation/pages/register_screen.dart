import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/helpers/flutter_toast.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/helpers/validators.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body.dart';
import 'package:flowers_ecommerce_app/features/auth/register/presentation/pages/widgets/custom_form_field_button.dart';
import 'package:flowers_ecommerce_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flowers_ecommerce_app/features/auth/register/presentation/view_model/cubit/registr_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  final viewModel = getIt.get<RegisterCubit>();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String _gender = 'male';

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _submit() {
    if (formKey.currentState!.validate()) {
      widget.viewModel.doIntent(
        RegisterSubmitEvent(),
        RegisterBody(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          rePassword: confirmPasswordController.text,
          phone: phoneController.text.contains('+20')
              ? phoneController.text
              : '+20${phoneController.text}',
          gender: _gender,
        ),
      );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => widget.viewModel,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 26),
            onPressed: () {},
          ),
          title: Text(t.register),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  verticalSpace(8),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: firstNameController,
                          label: t.first_name,
                          hint: t.enter_first_name,
                          validator: Validations.validateName,
                        ),
                      ),
                      horizontalSpace(17),
                      Expanded(
                        child: CustomTextFormField(
                          controller: lastNameController,
                          label: t.last_name,
                          hint: t.enter_last_name,
                          validator: Validations.validateName,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  CustomTextFormField(
                    controller: emailController,
                    label: t.email,
                    hint: t.enter_your_email,
                    validator: Validations.validateEmail,
                  ),
                  verticalSpace(24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: passwordController,
                          label: t.password,
                          hint: t.enter_your_password,
                          obsecureTxt: true,
                          validator: Validations.validatePassword,
                        ),
                      ),
                      horizontalSpace(17),
                      Expanded(
                        child: CustomTextFormField(
                          controller: confirmPasswordController,
                          label: t.confirm_password,
                          hint: t.confirm_password,
                          validator: (value) =>
                              Validations.validateConfirmPassword(
                                value,
                                passwordController.text,
                              ),
                          obsecureTxt: true,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  CustomTextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    label: t.phone_number,
                    hint: t.enter_phone_number,
                    validator: Validations.validatePhoneNumber,
                  ),
                  verticalSpace(24),
                  Row(
                    children: [
                      Text(
                        t.gender,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      horizontalSpace(5),
                      Expanded(
                        child: RadioGroup<String>(
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value!;
                            });
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(value: 'male'),
                              Text(
                                "Male",
                                style: TextStyle(color: Colors.black),
                              ),

                              SizedBox(width: 16),

                              // Female
                              Radio(value: 'female'),
                              Text(
                                "Female",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(16),

                  Row(
                    children: [
                      Text(
                        t.agree_to_our,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      horizontalSpace(5),
                      Text(
                        t.terms_conditions,
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  verticalSpace(48),

                  ElevatedButton(
                    onPressed: _submit,
                    child: BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        if (state.isLoading ) {
                          return const CircularProgressIndicator(
                            color: AppColors.white,
                          );
                        } else if (state.isSuccess) {
                          ToastMessage.toastMsg(
                            t.register_successfully,
                            backgroundColor: AppColors.green,
                            textColor: AppColors.white,
                          );
                          //naivigate to login screen
                          return Text(t.register);
                        } else if (state.isFailure) {
                          ToastMessage.toastMsg(
                            state.errorMessage!,
                            backgroundColor: AppColors.red,
                            textColor: AppColors.white,
                          );
                          return Text(t.register);
                        } else {
                          return Text(t.register);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
