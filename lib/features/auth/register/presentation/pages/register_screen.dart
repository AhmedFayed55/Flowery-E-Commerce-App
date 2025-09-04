import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/helpers/flutter_toast.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/helpers/validators.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/enums.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_body.dart';
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
  Genders _gender = Genders.male;
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
        RegisterSubmitEvent(
          RegisterBody(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            password: passwordController.text,
            rePassword: confirmPasswordController.text,
            phone: phoneController.text.contains('+20')
                ? phoneController.text
                : '+20${phoneController.text}',
            gender: _gender == Genders.male ? "male" : "female",
          ),
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
                        child: TextFormField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                            label: Text(trans.first_name),
                            hint: Text(trans.enter_first_name),
                          ),
                          validator: Validations.validateName,
                        ),
                      ),
                      horizontalSpace(17),
                      Expanded(
                        child: TextFormField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                            label: Text(trans.last_name),
                            hint: Text(trans.enter_last_name),
                          ),
                          validator: Validations.validateName,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text(trans.email),
                      hint: Text(trans.enter_your_email),
                    ),
                    validator: Validations.validateEmail,
                  ),
                  verticalSpace(24),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            label: Text(trans.password),
                            hint: Text(trans.enter_your_password),
                          ),
                          obscureText: true,
                          validator: Validations.validatePassword,
                        ),
                      ),
                      horizontalSpace(17),
                      Expanded(
                        child: TextFormField(
                          obscureText: true,
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            label: Text(trans.confirm_password),
                            hint: Text(trans.confirm_password),
                          ),
                          validator: (value) =>
                              Validations.validateConfirmPassword(
                                value,
                                passwordController.text,
                              ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      label: Text(trans.phone_number),
                      hint: Text(trans.enter_phone_number),
                    ),
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
                        child: RadioGroup<Genders>(
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value!;
                            });
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio<Genders>(
                                value: Genders.male,
                                // groupValue: _gender,
                                // onChanged: (value) {
                                //   setState(() {
                                //     _gender = value!;
                                //   });
                                // },
                              ),
                              Text(
                                "Male",
                                style: TextStyle(color: Colors.black),
                              ),

                              SizedBox(width: 16),

                              Radio<Genders>(
                                value: Genders.female,
                                // groupValue: _gender,
                                // onChanged: (value) {
                                //   setState(() {
                                //     _gender = value!;
                                //   });
                                // },
                              ),
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
                        if (state.isLoading) {
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
