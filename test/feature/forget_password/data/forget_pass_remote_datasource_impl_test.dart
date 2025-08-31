import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/datasources/remote/forget_pass_remote_datasource_impl.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/forget_pass_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'email_verify_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  late MockApiServices mockApiServices;
  late String mockErrorMessage;
  late String mockEmail;
  late ForgetPasswordRemoteDataSourceImpl forgetPasswordRemoteDataSourceImpl;

  /// ForgetPassword

  setUpAll(() {
    mockApiServices = MockApiServices();
    forgetPasswordRemoteDataSourceImpl = ForgetPasswordRemoteDataSourceImpl(
      apiServices: mockApiServices,
    );
    mockEmail = "Mostafa123@gmail.com";
    mockErrorMessage = "Error message";
  });

  group(
    "Test ForgetPasswordRemoteDataSourceImpl in Data Layer",
    () {
      /// Success
      test("success case for forgetPassword with ApiSuccessResult", () async {
        final mockForgetPasswordModel = ForgetPasswordModel();

        // arrange
        when(
          mockApiServices.forgetPassword({"email": mockEmail}),
        ).thenAnswer((_) async => mockForgetPasswordModel);

        // act
        var result = await forgetPasswordRemoteDataSourceImpl.forgetPassword(
          mockEmail,
        );

        // assert
        expect(result, isA<ApiSuccessResult<ForgetPasswordModel>>());
        ApiSuccessResult<ForgetPasswordModel> successResult =
            result as ApiSuccessResult<ForgetPasswordModel>;
        expect(successResult.data, equals(mockForgetPasswordModel));

        verify(mockApiServices.forgetPassword({"email": mockEmail})).called(1);
      });

      /// ErrorDioException
      test(
        "ErrorDioException case for forgetPassword with ApiErrorResult",
        () async {
          final mockDioException = DioException(
            requestOptions: RequestOptions(),
            message: mockErrorMessage,
          );
          final ServerFailure mockServerFailureFromDioError =
              ServerFailure.fromDioError(dioException: mockDioException);

          /// Arrange
          when(
            mockApiServices.forgetPassword({"email": mockEmail}),
          ).thenThrow(mockDioException);

          /// Act
          var result = await forgetPasswordRemoteDataSourceImpl.forgetPassword(
            mockEmail,
          );

          /// Assert
          expect(result, isA<ApiErrorResult<ForgetPasswordModel>>());
          ApiErrorResult<ForgetPasswordModel> errorResult =
              result as ApiErrorResult<ForgetPasswordModel>;
          expect(
            errorResult.failure.errorMessage,
            equals(mockServerFailureFromDioError.errorMessage),
          );

          verify(
            mockApiServices.forgetPassword({"email": mockEmail}),
          ).called(1);
        },
      );

      /// ErrorException
      test(
        "ErrorException case for forgetPassword with ApiErrorResult",
        () async {
          const String mockErrorMessage = "Error message";
          Failure mockFailure = Failure(
            errorMessage: Exception(mockErrorMessage).toString(),
          );

          /// Arrange
          when(
            mockApiServices.forgetPassword({"email": mockEmail}),
          ).thenThrow(mockFailure.errorMessage);

          /// Act
          var result = await forgetPasswordRemoteDataSourceImpl.forgetPassword(
            mockEmail,
          );

          /// Assert
          expect(result, isA<ApiErrorResult<ForgetPasswordModel>>());
          ApiErrorResult<ForgetPasswordModel> errorResult =
              result as ApiErrorResult<ForgetPasswordModel>;
          expect(
            errorResult.failure.errorMessage,
            equals(mockFailure.errorMessage),
          );

          verify(
            mockApiServices.forgetPassword({"email": mockEmail}),
          ).called(1);
        },
      );
    },
  );
}
