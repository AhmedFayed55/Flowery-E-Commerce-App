import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/helpers/dialogue_utils.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/helpers/validators.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/entity/email_verify_args.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_cubit.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_event.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordCubit forgetPasswordCubit = getIt
      .get<ForgetPasswordCubit>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => forgetPasswordCubit,
      child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state.isSuccessState == true) {
            Navigator.pushNamed(
              context,
              AppRoutes.emailVerification,
              arguments: EmailVerifyArgs(
                forgetPasswordCubit,
                emailController.text,
              ),
            );
          }
          if (state.isErrorState == true) {
            DialogueUtils.showAlertDialog(context, state.errorMessage);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            title: Text(AppLocalizations.of(context)!.password)),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    verticalSpace(40),
                    Text(
                      AppLocalizations.of(context)!.forget_password,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    verticalSpace(16),
                    Text(
                      AppLocalizations.of(
                        context,
                      )!.please_enter_your_email_associated_to_your_account,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    verticalSpace(32),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        return Validations.validateEmail(email);
                      },
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.email),
                        hintText: AppLocalizations.of(
                          context,
                        )!.enter_your_email,
                      ),
                    ),
                    verticalSpace(48),
                    BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              forgetPasswordCubit.doIntent(
                                GetForgetPasswordEvent(
                                  email: emailController.text,
                                ),
                              );
                            }
                          },
                          child: state.isLoadingState == true
                              ? const CircularProgressIndicator(
                                  color: AppColors.white,
                                )
                              : Text(AppLocalizations.of(context)!.confirm),
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
    emailController.dispose();
    super.dispose();
  }
}
