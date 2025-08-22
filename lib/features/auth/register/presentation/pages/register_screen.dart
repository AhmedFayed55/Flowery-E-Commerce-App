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
  const RegisterScreen({super.key});

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
  final viewModel = getIt.get<RegisterCubit>();


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
      viewModel.doIntent(
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
    final trans = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 26),
            onPressed: () {},
          ),
          title: Text(trans.register),
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
                          label: trans.first_name,
                          hint: trans.enter_first_name,
                          validator: Validations.validateName,
                        ),
                      ),
                      horizontalSpace(17),
                      Expanded(
                        child: CustomTextFormField(
                          controller: lastNameController,
                          label: trans.last_name,
                          hint: trans.enter_last_name,
                          validator: Validations.validateName,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  CustomTextFormField(
                    controller: emailController,
                    label: trans.email,
                    hint: trans.enter_your_email,
                    validator: Validations.validateEmail,
                  ),
                  verticalSpace(24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: passwordController,
                          label: trans.password,
                          hint: trans.enter_your_password,
                          obsecureTxt: true,
                          validator: Validations.validatePassword,
                        ),
                      ),
                      horizontalSpace(17),
                      Expanded(
                        child: CustomTextFormField(
                          controller: confirmPasswordController,
                          label: trans.confirm_password,
                          hint: trans.confirm_password,
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
                    label: trans.phone_number,
                    hint: trans.enter_phone_number,
                    validator: Validations.validatePhoneNumber,
                  ),
                  verticalSpace(24),
                  Row(
                    children: [
                      Text(
                        trans.gender,
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
                        trans.agree_to_our,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      horizontalSpace(5),
                      Text(
                        trans.terms_conditions,
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
                            trans.register_successfully,
                            backgroundColor: AppColors.green,
                            textColor: AppColors.white,
                          );
                          //naivigate to login screen
                          return Text(trans.register);
                        } else if (state.isFailure) {
                          ToastMessage.toastMsg(
                            state.errorMessage!,
                            backgroundColor: AppColors.red,
                            textColor: AppColors.white,
                          );
                          return Text(trans.register);
                        } else {
                          return Text(trans.register);
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
