import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_response_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/use_cases/change_password_use_case.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/presentation/manager/change_password_cubit.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/presentation/manager/change_password_event.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/presentation/manager/change_password_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'change_password_cubit_test.mocks.dart';

@GenerateMocks([ChangePasswordUseCase])
void main() {
  group("Change Password View Model test ", () {
    final ChangePasswordUseCase useCase = MockChangePasswordUseCase();
    final ChangePasswordCubit viewModel = ChangePasswordCubit(useCase);

    final ChangePasswordResponseEntity response = ChangePasswordResponseEntity(
      message: "Good",
      token: "jsbljknmf",
    );

    final ChangePasswordRequestEntity request = ChangePasswordRequestEntity(
      password: "1",
      newPassword: "2",
    );

    final ApiResult<ChangePasswordResponseEntity> successResponse =
        ApiSuccessResult<ChangePasswordResponseEntity>(data: response);
    final ApiResult<ChangePasswordResponseEntity> errorResponse =
        ApiErrorResult(failure: Failure(errorMessage: "Something went wrong"));

    provideDummy<ApiResult<ChangePasswordResponseEntity>>(successResponse);

    blocTest<ChangePasswordCubit, ChangePasswordState>(
      "call doIntent with SubmitChangePasswordEvent then call _submitChangePassword and return success",
      build: () {
        when(useCase.invoke(request)).thenAnswer((_) async => successResponse);
        return viewModel;
      },
      act: (viewModel) {
        viewModel.passwordController.text = "1";
        viewModel.newPasswordController.text = "2";
        viewModel.doIntent(SubmitChangePasswordEvent());
      },
      expect: () => [
        ChangePasswordState(isLoading: true),
        ChangePasswordState(isLoading: false, isSuccess: true),
      ],
      verify: (_) => verify(useCase.invoke(request)).called(1),
    );


    blocTest<ChangePasswordCubit, ChangePasswordState>(
      "call doIntent with SubmitChangePasswordEvent then call _submitChangePassword and return error",
      build: () {
        when(useCase.invoke(request)).thenAnswer((_) async => errorResponse);
        return viewModel;
      },
      act: (viewModel) {
        viewModel.passwordController.text = "1";
        viewModel.newPasswordController.text = "2";
        viewModel.doIntent(SubmitChangePasswordEvent());
      },
      expect: () => [
        ChangePasswordState(isLoading: true),
        ChangePasswordState(isLoading: false, errorMessage: "Something went wrong"),
      ],
      verify: (_) => verify(useCase.invoke(request)).called(1),
    );


  });
}
