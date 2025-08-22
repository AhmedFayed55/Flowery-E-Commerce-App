import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/helpers/validators.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_cubit.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_event.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  String email;
   ResetPasswordScreen({super.key,required this.email});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final forgetPasswordCubit = context.read<ForgetPasswordCubit>();
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if(state.isSuccessState == true){
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false,
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context)!.password)),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    verticalSpace(40),
                    Text(
                      AppLocalizations.of(context)!.reset_password,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    verticalSpace(16),
                    Text(
                      AppLocalizations.of(
                        context,
                      )!.password_must_not_be_empty_and_must_contain_6_characters_with_upper_case_letter_and_one_number_at_least,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    verticalSpace(32),
                    TextFormField(
                      controller: newPasswordController,
                      validator: (newPassword) {
                        return Validations.confirmPassword(newPassword);
                      },
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.new_password),
                        hintText: AppLocalizations.of(context)!.enter_your_password,
                      ),
                    ),
                    verticalSpace(24),
                    TextFormField(
                      controller: confirmPasswordController,
                      validator: (confirmPassword) {
                        return Validations.confirmPassword(
                          confirmPassword,
                          newPasswordController.text,
                        );
                      },
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.confirm_password),
                        hintText: AppLocalizations.of(context)!.confirm_password,
                      ),
                    ),
                    verticalSpace(48),
                    BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              forgetPasswordCubit.doIntent(GetResetPasswordEvent(email: widget.email,newPassword: newPasswordController.text));
                            }
                          },
                          child: state.isLoadingState == true
                              ? const CircularProgressIndicator(
                            color: AppColors.white,
                          ) : Text(AppLocalizations.of(context)!.confirm),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
