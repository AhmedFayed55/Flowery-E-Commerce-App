import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/forget_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/repository/forget_pass_repo_contract.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/usecases/forget_pass_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'forget_pass_usecase_test.mocks.dart';

@GenerateMocks([ForgetPasswordRepoContract])
void main() {
  late String email;
  late String mockErrorMessage;
  late MockForgetPasswordRepoContract mockForgetPasswordRepoContract;
  late ForgetPasswordUseCase forgetPasswordUseCase;

  setUpAll(() {
    email = "Mostafa123@gmail.com";
    mockErrorMessage = "Error Message";
    mockForgetPasswordRepoContract = MockForgetPasswordRepoContract();
    forgetPasswordUseCase = ForgetPasswordUseCase(
      forgetPasswordRepoContract: mockForgetPasswordRepoContract,
    );
  });

  group("Test ForgetPasswordUseCase in Domain Layer", () {
    test("Success Case for ForgetPassword with ApiSuccessResult", () async {
      var mockSuccessResult = ApiSuccessResult<ForgetPasswordModel>(
        data: ForgetPasswordModel(),
      );
      provideDummy<ApiResult<ForgetPasswordModel>>(mockSuccessResult);

      /// Arrange
      when(
        mockForgetPasswordRepoContract.forgetPassword(email),
      ).thenAnswer((_) async => mockSuccessResult);

      /// Act
      var result = await forgetPasswordUseCase.call(email);

      /// Assert
      expect(result, isA<ApiSuccessResult<ForgetPasswordModel>>());
      ApiSuccessResult<ForgetPasswordModel> successResult =
          result as ApiSuccessResult<ForgetPasswordModel>;
      expect(successResult.data, equals(mockSuccessResult.data));

      verify(mockForgetPasswordRepoContract.forgetPassword(email)).called(1);
    });

    /// Error
    test("Error Case for ForgetPasswordUseCase with ApiErrorResult", () async {
      var mockFailure = Failure(errorMessage: mockErrorMessage);
      var mockErrorResult = ApiErrorResult<ForgetPasswordModel>(
        failure: mockFailure,
      );
      provideDummy<ApiResult<ForgetPasswordModel>>(mockErrorResult);

      /// Arrange
      when(mockForgetPasswordRepoContract.forgetPassword(email)).thenAnswer(
        (_) async => ApiErrorResult<ForgetPasswordModel>(failure: mockFailure),
      );

      /// Act
      var result = await forgetPasswordUseCase.call(email);

      /// Assert
      expect(result, isA<ApiErrorResult<ForgetPasswordModel>>());
      ApiErrorResult<ForgetPasswordModel> errorResult =
          result as ApiErrorResult<ForgetPasswordModel>;
      expect(
        errorResult.failure.errorMessage,
        equals(mockErrorResult.failure.errorMessage),
      );

      verify(mockForgetPasswordRepoContract.forgetPassword(email)).called(1);
    });
  });
}
