import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/email_verify_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/repository/email_verify_repo_contract.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/usecases/email_verify_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'email_verify_usecase_test.mocks.dart';

@GenerateMocks([EmailVerifyRepoContract])
void main() {
  late String mockCode;
  late String mockErrorMessage;
  late MockEmailVerifyRepoContract mockEmailVerifyRepoContract;
  late EmailVerifyUseCase emailVerifyUseCase;

  setUpAll(() {
    mockCode = "123456";
    mockErrorMessage = "Error Message";
    mockEmailVerifyRepoContract = MockEmailVerifyRepoContract();
    emailVerifyUseCase = EmailVerifyUseCase(
      emailVerifyRepoContract: mockEmailVerifyRepoContract,
    );
  });

  group("Test EmailVerifyUseCase in Domain Layer", (){
    /// Success
    test("Success Case for EmailVerifyUseCase with ApiSuccessResult", () async {
      var mockSuccessResult = ApiSuccessResult<EmailVerifyModel>(
        data: EmailVerifyModel(),
      );
      provideDummy<ApiResult<EmailVerifyModel>>(mockSuccessResult);

      /// Arrange
      when(
        mockEmailVerifyRepoContract.emailVerify(mockCode),
      ).thenAnswer((_) async => mockSuccessResult);

      /// Act
      var result = await emailVerifyUseCase.call(mockCode);

      /// Assert
      expect(result, isA<ApiSuccessResult<EmailVerifyModel>>());
      ApiSuccessResult<EmailVerifyModel> successResult =
      result as ApiSuccessResult<EmailVerifyModel>;
      expect(successResult.data, equals(mockSuccessResult.data));

      verify(mockEmailVerifyRepoContract.emailVerify(mockCode)).called(1);
    });

    /// Error
    test("Error Case for EmailVerifyUseCase with ApiErrorResult", () async {

      var mockFailure = Failure(errorMessage: mockErrorMessage);
      var mockErrorResult = ApiErrorResult<EmailVerifyModel>(failure: mockFailure,);
      provideDummy<ApiResult<EmailVerifyModel>>(mockErrorResult);

      /// Arrange
      when(
        mockEmailVerifyRepoContract.emailVerify(mockCode),
      ).thenAnswer((_) async => ApiErrorResult<EmailVerifyModel>(failure: mockFailure));

      /// Act
      var result = await emailVerifyUseCase.call(mockCode);

      /// Assert
      expect(result, isA<ApiErrorResult<EmailVerifyModel>>());
      ApiErrorResult<EmailVerifyModel> errorResult =
      result as ApiErrorResult<EmailVerifyModel>;
      expect(errorResult.failure.errorMessage, equals(mockErrorResult.failure.errorMessage));

      verify(mockEmailVerifyRepoContract.emailVerify(mockCode)).called(1);
    });

  });
}
