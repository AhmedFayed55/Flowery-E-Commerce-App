import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/reset_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/repository/reset_pass_repo_contract.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/usecases/reset_pass_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'reset_password_usecase_test.mocks.dart';

@GenerateMocks([ResetPasswordRepoContract])
void main() {
  late String email;
  late String newPassword;
  late String mockErrorMessage;
  late MockResetPasswordRepoContract mockResetPasswordRepoContract;
  late ResetPasswordUseCase resetPasswordUseCase;

  setUpAll(() {
    email = "Mostafa123@gmail.com";
    newPassword = "123456789";
    mockErrorMessage = "Error Message";
    mockResetPasswordRepoContract = MockResetPasswordRepoContract();
    resetPasswordUseCase = ResetPasswordUseCase(resetPasswordRepoContract: mockResetPasswordRepoContract);
  });

  group("Test ResetPasswordUseCase in Domain Layer", (){
    test("Success Case for ForgetPassword with ApiSuccessResult", () async {
      var mockSuccessResult = ApiSuccessResult<ResetPasswordModel>(
        data: ResetPasswordModel(),
      );
      provideDummy<ApiResult<ResetPasswordModel>>(mockSuccessResult);

      /// Arrange
      when(
        mockResetPasswordRepoContract.resetPassword(email,newPassword),
      ).thenAnswer((_) async => mockSuccessResult);

      /// Act
      var result = await resetPasswordUseCase.call(email,newPassword);

      /// Assert
      expect(result, isA<ApiSuccessResult<ResetPasswordModel>>());
      ApiSuccessResult<ResetPasswordModel> successResult =
      result as ApiSuccessResult<ResetPasswordModel>;
      expect(successResult.data, equals(mockSuccessResult.data));

      verify(mockResetPasswordRepoContract.resetPassword(email,newPassword)).called(1);
    });

    /// Error
    test("Error Case for ResetPasswordUseCase with ApiErrorResult", () async {
      var mockFailure = Failure(errorMessage: mockErrorMessage);
      var mockErrorResult = ApiErrorResult<ResetPasswordModel>(failure: mockFailure,);
      provideDummy<ApiResult<ResetPasswordModel>>(mockErrorResult);

      /// Arrange
      when(
        mockResetPasswordRepoContract.resetPassword(email,newPassword),
      ).thenAnswer((_) async => ApiErrorResult<ResetPasswordModel>(failure: mockFailure));

      /// Act
      var result = await resetPasswordUseCase.call(email,newPassword);

      /// Assert
      expect(result, isA<ApiErrorResult<ResetPasswordModel>>());
      ApiErrorResult<ResetPasswordModel> errorResult =
      result as ApiErrorResult<ResetPasswordModel>;
      expect(errorResult.failure.errorMessage, equals(mockFailure.errorMessage));

      verify(mockResetPasswordRepoContract.resetPassword(email,newPassword)).called(1);
    });
  });

}
