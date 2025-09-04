import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/core/helpers/dialogue_utils.dart';
import 'package:flowers_ecommerce_app/core/helpers/flutter_toast.dart';
import 'package:flowers_ecommerce_app/core/helpers/validators.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/presentation/manager/change_password_cubit.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/presentation/manager/change_password_event.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/presentation/manager/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/custom_text_form_field.dart';
import '../../../../../core/di/di.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => getIt<ChangePasswordCubit>(),
      child: Builder(
          builder: (context) {
            final viewModel = context.read<ChangePasswordCubit>();
            return Scaffold(
              appBar: AppBar(
                title: Text(localizations.reset_password),
                leading: const Icon(Icons.arrow_back_ios_new),
              ),
              body: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    spacing: 24.h,
                    children: [
                      CustomTextFormField(
                        controller: viewModel.passwordController,
                        label: localizations.current_password,
                        hint: localizations.current_password,
                      ),
                      CustomTextFormField(
                        validator: Validations.validatePassword,
                        controller: viewModel.newPasswordController,
                        label: localizations.new_password,
                        hint: localizations.new_password,
                      ),
                      CustomTextFormField(
                        controller: viewModel.confirmNewPasswordController,
                        label: localizations.confirm_password,
                        hint: localizations.confirm_password,
                      ),
                      BlocConsumer<ChangePasswordCubit,ChangePasswordState>(
                        listener: (context, state) {
                          if (state.errorMessage != null) {
                            DialogueUtils.showMessage(
                              context: context, message: state.errorMessage!,
                              ngeActionName: AppLocalizations.of(context)!.ok,);
                          }
                          if (state.isSuccess) {
                            ToastMessage.toastMsg(AppLocalizations.of(context)!
                                .password_changed_successfully);
                            context.pushNamedAndRemoveUntil(AppRoutes.login, predicate: (route) => true);
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                              onPressed:() {
                                if (viewModel.formKey.currentState!.validate()) {
                                viewModel.doIntent(SubmitChangePasswordEvent());
                                }
                              },
                              child: state.isLoading && !state.isSuccess && state.errorMessage == null
                                  ? CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary,)
                                  :
                              Text(localizations.update,));
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }

}
