import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/email_verify_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/forget_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/reset_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/usecases/email_verify_usecase.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/usecases/forget_pass_usecase.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/usecases/reset_pass_usecase.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_event.dart';
import 'package:injectable/injectable.dart';
import 'forget_pass_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  EmailVerifyUseCase emailVerifyUseCase;
  ResetPasswordUseCase resetPasswordUseCase;


  ForgetPasswordCubit({
    required this.forgetPasswordUseCase,
    required this.emailVerifyUseCase,
    required this.resetPasswordUseCase,
  }) : super(ForgetPasswordState.initial());

  void doIntent(ForgetPasswordEvent event) {
    switch (event) {
      case GetForgetPasswordEvent():
        _forgetPassword(event.email);
        break;
      case GetEmailVerificationEvent():
        _emailVerify(event.code);
        break;
      case GetResetPasswordEvent():
        _resetPassword(event.email,event.newPassword);
        break;
      case GetIsResendOtpEvent():
        _isResend(event.email);
        break;
    }
  }


  Future<void> _resetPassword(String email, String newPassword) async {
    emit(
      state.copyWith(
        isLoadingState: true,
      ),
    );
    ApiResult<ResetPasswordModel> result = await resetPasswordUseCase.call(email,newPassword);
    switch (result) {
      case ApiSuccessResult<ResetPasswordModel>():
        emit(
          state.copyWith(
            isLoadingState: false,
            isSuccessState: true,
          ),
        );
      case ApiErrorResult<ResetPasswordModel>():
        emit(
          state.copyWith(
            isLoadingState: false,
            isErrorState: true,
            errorMessage: result.failure.errorMessage,
          ),
        );
    }
  }


  Future<void> _emailVerify(String code) async {
    emit(
      state.copyWith(
        isLoadingState: true,
        isSuccessState: false,
        isErrorState: false,
      ),
    );
    ApiResult<EmailVerifyModel> result = await emailVerifyUseCase.call(code);
    switch (result) {
      case ApiSuccessResult<EmailVerifyModel>():
        emit(
          state.copyWith(
            isLoadingState: false,
            isSuccessState: true,
            isErrorState: false,
            // forgetPasswordModelState: result.data,
          ),
        );
      case ApiErrorResult<EmailVerifyModel>():
        emit(
          state.copyWith(
            isLoadingState: false,
            isErrorState: true,
            errorMessage: result.failure.errorMessage,
          ),
        );
    }
  }

  Future<void> _forgetPassword(String email) async {
    emit(
      state.copyWith(
        isLoadingState: true,
        isSuccessState: false,
        isErrorState: false,
      ),
    );
    ApiResult<ForgetPasswordModel> result = await forgetPasswordUseCase.call(
      email,
    );
    switch (result) {
      case ApiSuccessResult<ForgetPasswordModel>():
        emit(
          state.copyWith(
            isLoadingState: false,
            isSuccessState: true,
            isErrorState: false,
          ),
        );
      case ApiErrorResult<ForgetPasswordModel>():
        emit(
          state.copyWith(
            isLoadingState: false,
            isErrorState: true,
            errorMessage: result.failure.errorMessage,
          ),
        );
    }
  }
  Future<void> _isResend(String email) async {
    await forgetPasswordUseCase.call(email,);
    emit(state.copyWith(isErrorState: false));
  }


}
