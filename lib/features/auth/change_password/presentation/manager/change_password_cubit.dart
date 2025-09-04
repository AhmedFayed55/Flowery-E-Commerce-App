import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/change_password_request_entity.dart';
import '../../domain/entities/change_password_response_entity.dart';
import '../../domain/use_cases/change_password_use_case.dart';
import 'change_password_event.dart';
import 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._useCase) : super(const ChangePasswordState());

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
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

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
