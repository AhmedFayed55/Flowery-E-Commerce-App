import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_response_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/use_cases/change_password_use_case.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/presentation/manager/change_password_event.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/presentation/manager/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._useCase) : super(ChangePasswordState());

  final ChangePasswordUseCase _useCase;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  doIntent(ChangePasswordEvent event) {
    switch (event) {
      case SubmitChangePasswordEvent():
        return _submitChangePassword();
    }
  }

  Future<void> _submitChangePassword() async {
    state.copyWith(errorMessage: null, isSuccess: false);
      emit(state.copyWith(isLoading: true));

      final result = await _useCase.invoke(
        ChangePasswordRequestEntity(
          password: passwordController.text,
          newPassword: newPasswordController.text,
        ),
      );
      switch (result) {
        case ApiSuccessResult<ChangePasswordResponseEntity>():
          emit(state.copyWith(isLoading: false, isSuccess: true));
          break;
        case ApiErrorResult<ChangePasswordResponseEntity>():
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: result.failure.errorMessage,
            ),
          );
          break;
      }
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    return super.close();
  }
}
