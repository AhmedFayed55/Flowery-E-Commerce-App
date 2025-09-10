import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/email_verify_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/forget_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/reset_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/usecases/email_verify_usecase.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/usecases/forget_pass_usecase.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/usecases/reset_pass_usecase.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_cubit.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/presentation/cubit/forget_pass_event.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'forget_pass_cubit_test.mocks.dart';

@GenerateMocks([
  ForgetPasswordUseCase,
  EmailVerifyUseCase,
  ResetPasswordUseCase,
])
void main() {
  late String email;
  late String code;
  late String newPassword;
  late MockForgetPasswordUseCase mockForgetPasswordUseCase;
  late MockEmailVerifyUseCase mockEmailVerifyUseCase;
  late MockResetPasswordUseCase mockResetPasswordUseCase;
  late ForgetPasswordCubit forgetPasswordCubit;

  setUp(() {
    email = "test@example.com";
    code = "123456789";
    newPassword = "******";
    mockForgetPasswordUseCase = MockForgetPasswordUseCase();
    mockEmailVerifyUseCase = MockEmailVerifyUseCase();
    mockResetPasswordUseCase = MockResetPasswordUseCase();
    forgetPasswordCubit = ForgetPasswordCubit(
      forgetPasswordUseCase: mockForgetPasswordUseCase,
      emailVerifyUseCase: mockEmailVerifyUseCase,
      resetPasswordUseCase: mockResetPasswordUseCase,
    );
  });

  /// GetForgetPasswordEvent
  group("Test Cases emits for GetForgetPasswordEvent", () {
    test(
      "Success Case emits ( loading + success ) states for GetForgetPasswordEvent",
      () async {
        ///Arrange

        var mockModel = ForgetPasswordModel();
        var successResult = ApiSuccessResult<ForgetPasswordModel>(
          data: mockModel,
        );
        provideDummy<ApiResult<ForgetPasswordModel>>(successResult);

        when(
          mockForgetPasswordUseCase.call(email),
        ).thenAnswer((_) async => successResult);

        ///Act

        await forgetPasswordCubit.doIntent(
          GetForgetPasswordEvent(email: email),
        );

        ///Assert
        expect(forgetPasswordCubit.state.isLoadingState, false);
        expect(forgetPasswordCubit.state.isSuccessState, true);
        expect(forgetPasswordCubit.state.isErrorState, false);

        verify(mockForgetPasswordUseCase.call(email)).called(1);
      },
    );
    test(
      "Error case emits ( loading + error ) states for GetForgetPasswordEvent",
      () async {
        var mocFailure = Failure(errorMessage: "Server Error");
        var errorResult = ApiErrorResult<ForgetPasswordModel>(
          failure: mocFailure,
        );
        provideDummy<ApiResult<ForgetPasswordModel>>(errorResult);

        when(
          mockForgetPasswordUseCase.call(email),
        ).thenAnswer((_) async => errorResult);

        await forgetPasswordCubit.doIntent(
          GetForgetPasswordEvent(email: email),
        );

        expect(forgetPasswordCubit.state.isLoadingState, false);
        expect(forgetPasswordCubit.state.isSuccessState, false);
        expect(forgetPasswordCubit.state.isErrorState, true);
        expect(
          forgetPasswordCubit.state.errorMessage,
          equals(mocFailure.errorMessage),
        );

        verify(mockForgetPasswordUseCase.call(email)).called(1);
      },
    );
  });

  /// GetEmailVerificationEvent
  group("Test Cases emits for GetEmailVerificationEvent", () {
    test(
      "Success Case emits ( loading + success ) states for GetEmailVerificationEvent",
      () async {
        ///Arrange
        var mockModel = EmailVerifyModel();
        var successResult = ApiSuccessResult<EmailVerifyModel>(data: mockModel);
        provideDummy<ApiResult<EmailVerifyModel>>(successResult);

        when(
          mockEmailVerifyUseCase.call(code),
        ).thenAnswer((_) async => successResult);

        ///Act

        await forgetPasswordCubit.doIntent(
          GetEmailVerificationEvent(code: code),
        );

        ///Assert
        expect(forgetPasswordCubit.state.isLoadingState, false);
        expect(forgetPasswordCubit.state.isSuccessState, true);
        expect(forgetPasswordCubit.state.isErrorState, false);

        verify(mockEmailVerifyUseCase.call(code)).called(1);
      },
    );
    test(
      "Error case emits ( loading + error ) states for GetEmailVerificationEvent",
      () async {
        var mocFailure = Failure(errorMessage: "Server Error");
        var errorResult = ApiErrorResult<EmailVerifyModel>(failure: mocFailure);
        provideDummy<ApiResult<EmailVerifyModel>>(errorResult);

        when(
          mockEmailVerifyUseCase.call(code),
        ).thenAnswer((_) async => errorResult);

        await forgetPasswordCubit.doIntent(
          GetEmailVerificationEvent(code: code),
        );

        expect(forgetPasswordCubit.state.isLoadingState, false);
        expect(forgetPasswordCubit.state.isSuccessState, false);
        expect(forgetPasswordCubit.state.isErrorState, true);
        expect(
          forgetPasswordCubit.state.errorMessage,
          equals(mocFailure.errorMessage),
        );

        verify(mockEmailVerifyUseCase.call(code)).called(1);
      },
    );
  });

  /// GetResetPasswordEvent
  group("Test Cases emits for GetResetPasswordEvent", () {
    test(
      "Success Case emits ( loading + success ) states for GetResetPasswordEvent",
      () async {
        ///Arrange
        var mockModel = ResetPasswordModel();
        var successResult = ApiSuccessResult<ResetPasswordModel>(
          data: mockModel,
        );
        provideDummy<ApiResult<ResetPasswordModel>>(successResult);

        when(
          mockResetPasswordUseCase.call(email, newPassword),
        ).thenAnswer((_) async => successResult);

        ///Act
        await forgetPasswordCubit.doIntent(
          GetResetPasswordEvent(email: email, newPassword: newPassword),
        );

        ///Assert
        expect(forgetPasswordCubit.state.isLoadingState, false);
        expect(forgetPasswordCubit.state.isSuccessState, true);
        expect(forgetPasswordCubit.state.isErrorState, false);

        verify(mockResetPasswordUseCase.call(email, newPassword)).called(1);
      },
    );
    test(
      "Error case emits ( loading + error ) states for GetResetPasswordEvent",
      () async {
        var mocFailure = Failure(errorMessage: "Server Error");
        var errorResult = ApiErrorResult<ResetPasswordModel>(
          failure: mocFailure,
        );
        provideDummy<ApiResult<ResetPasswordModel>>(errorResult);

        when(
          mockResetPasswordUseCase.call(email, newPassword),
        ).thenAnswer((_) async => errorResult);

        await forgetPasswordCubit.doIntent(
          GetResetPasswordEvent(email: email, newPassword: newPassword),
        );

        expect(forgetPasswordCubit.state.isLoadingState, false);
        expect(forgetPasswordCubit.state.isSuccessState, false);
        expect(forgetPasswordCubit.state.isErrorState, true);
        expect(
          forgetPasswordCubit.state.errorMessage,
          equals(mocFailure.errorMessage),
        );

        verify(mockResetPasswordUseCase.call(email, newPassword)).called(1);
      },
    );
  });
}
