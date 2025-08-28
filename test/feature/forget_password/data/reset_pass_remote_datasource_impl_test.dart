import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/datasources/remote/reset_pass_remote_datasource_impl.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/reset_pass_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'email_verify_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  late MockApiServices mockApiServices;
  late String mockEmail;
  late String mockErrorMessage;
  late String mockNewPassword;
  late ResetPasswordRemoteDataSourceImpl resetPasswordRemoteDataSourceImpl;

  setUpAll(() {
    mockApiServices = MockApiServices();
    mockEmail = "mostafa123@gmail.com";
    mockErrorMessage = "ErrorMessage";
    mockNewPassword = "123456789";
    resetPasswordRemoteDataSourceImpl = ResetPasswordRemoteDataSourceImpl(
      apiServices: mockApiServices,
    );
  });
  //
  group("Test ResetPasswordRemoteDataSourceImpl in Data Layer", () {
    /// Success
    test("success case for resetPassword with ApiSuccessResult", () async {
      /// Arrange
      var mockResetPasswordModel = ResetPasswordModel();
      when(
        mockApiServices.resetPassword({
          "email": mockEmail,
          "newPassword": mockNewPassword,
        }),
      ).thenAnswer((_) async => mockResetPasswordModel);

      /// Act
      var result = await resetPasswordRemoteDataSourceImpl.resetPassword(
        mockEmail,
        mockNewPassword,
      );

      /// Assert
      expect(result, isA<ApiSuccessResult<ResetPasswordModel>>());
      ApiSuccessResult<ResetPasswordModel> successResult =
          result as ApiSuccessResult<ResetPasswordModel>;
      expect(successResult.data, equals(mockResetPasswordModel));

      verify(
        mockApiServices
          ..resetPassword({"email": mockEmail, "newPassword": mockNewPassword}),
      ).called(1);
    });

    /// ErrorDioException
    test(
      "ErrorDioException case for resetPassword with ApiErrorResult",
      () async {
        var mockDioException = DioException(
          requestOptions: RequestOptions(),
          message: mockErrorMessage,
        );
        final serverFailureFromDioError = ServerFailure.fromDioError(
          dioException: mockDioException,
        );

        /// Arrange
        when(
          mockApiServices.resetPassword({
            "email": mockEmail,
            "newPassword": mockNewPassword,
          }),
        ).thenThrow(mockDioException);

        /// Act
        var result = await resetPasswordRemoteDataSourceImpl.resetPassword(
          mockEmail,
          mockNewPassword,
        );

        /// Assert
        expect(result, isA<ApiErrorResult<ResetPasswordModel>>());
        ApiErrorResult<ResetPasswordModel> errorResult =
            result as ApiErrorResult<ResetPasswordModel>;
        expect(
          errorResult.failure.errorMessage,
          equals(serverFailureFromDioError.errorMessage),
        );

        verify(
          mockApiServices.resetPassword({
            "email": mockEmail,
            "newPassword": mockNewPassword,
          }),
        ).called(1);
      },
    );

    /// ErrorException
    test("ErrorException case for resetPassword with ApiErrorResult", () async {
      Failure mockFailure = Failure(
        errorMessage: Exception(mockErrorMessage).toString(),
      );

      /// Arrange
      when(
        mockApiServices.resetPassword({
          "email": mockEmail,
          "newPassword": mockNewPassword,
        }),
      ).thenThrow(mockFailure.errorMessage);

      /// Act
      var result = await resetPasswordRemoteDataSourceImpl.resetPassword(
        mockEmail,
        mockNewPassword,
      );

      /// Assert
      expect(result, isA<ApiErrorResult<ResetPasswordModel>>());
      ApiErrorResult<ResetPasswordModel> errorResult =
          result as ApiErrorResult<ResetPasswordModel>;
      expect(
        errorResult.failure.errorMessage,
        equals(mockFailure.errorMessage),
      );

      verify(
        mockApiServices.resetPassword({
          "email": mockEmail,
          "newPassword": mockNewPassword,
        }),
      ).called(1);
    });
  });
}
