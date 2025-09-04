import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/datasources/remote/email_verify_remote_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/email_verify_model.dart';

import 'email_verify_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  late MockApiServices mockApiServices;
  late String mockCode;
  late String mockErrorMessage;
  late EmailVerifyRemoteDataSourceImpl emailVerifyRemoteDataSourceImpl;

  setUpAll(() {
    mockApiServices = MockApiServices();
    mockCode = "123456";
    mockErrorMessage = "Error message";
    emailVerifyRemoteDataSourceImpl = EmailVerifyRemoteDataSourceImpl(
      apiServices: mockApiServices,
    );
  });

  group("Test EmailVerifyRemoteDataSourceImpl in Data Layer", () {
    /// Success
    test("success case for emailVerify with ApiSuccessResult", () async {
      final mockEmailVerifyModel = EmailVerifyModel();

      /// Arrange
      when(
        mockApiServices.verifyResetCode({"resetCode": mockCode}),
      ).thenAnswer((_) async => mockEmailVerifyModel);

      /// Act
      var result = await emailVerifyRemoteDataSourceImpl.emailVerify(mockCode);

      /// Assert
      expect(result, isA<ApiSuccessResult<EmailVerifyModel>>());
      ApiSuccessResult<EmailVerifyModel> successResult =
          result as ApiSuccessResult<EmailVerifyModel>;
      expect(successResult.data, equals(mockEmailVerifyModel));

      verify(
        mockApiServices.verifyResetCode({"resetCode": mockCode}),
      ).called(1);
    });

    /// ErrorDioException
    test(
      "ErrorDioException case for emailVerify with ApiErrorResult",
      () async {
        const String mockErrorMessage = "Error message";
        final mockDioException = DioException(
          requestOptions: RequestOptions(),
          message: mockErrorMessage,
        );
        final ServerFailure mockServerFailureFromDioError =
            ServerFailure.fromDioError(dioException: mockDioException);

        /// Arrange
        when(
          mockApiServices.verifyResetCode({"resetCode": mockCode}),
        ).thenThrow(mockDioException);

        /// Act
        var result = await emailVerifyRemoteDataSourceImpl.emailVerify(
          mockCode,
        );

        /// Assert
        expect(result, isA<ApiErrorResult<EmailVerifyModel>>());
        ApiErrorResult<EmailVerifyModel> errorResult =
            result as ApiErrorResult<EmailVerifyModel>;
        expect(
          errorResult.failure.errorMessage,
          equals(mockServerFailureFromDioError.errorMessage),
        );

        verify(
          mockApiServices.verifyResetCode({"resetCode": mockCode}),
        ).called(1);
      },
    );

    /// ErrorException
    test("ErrorException case for emailVerify with ApiErrorResult", () async {
      Failure mockFailure = Failure(
        errorMessage: Exception(mockErrorMessage).toString(),
      );

      /// Arrange
      when(
        mockApiServices.verifyResetCode({"resetCode": mockCode}),
      ).thenThrow(Exception(mockErrorMessage));

      /// Act
      var result = await emailVerifyRemoteDataSourceImpl.emailVerify(mockCode);

      /// Assert
      expect(result, isA<ApiErrorResult<EmailVerifyModel>>());
      ApiErrorResult<EmailVerifyModel> errorResult =
          result as ApiErrorResult<EmailVerifyModel>;
      expect(
        errorResult.failure.errorMessage,
        equals(mockFailure.errorMessage),
      );

      verify(
        mockApiServices.verifyResetCode({"resetCode": mockCode}),
      ).called(1);
    });
  });
}
