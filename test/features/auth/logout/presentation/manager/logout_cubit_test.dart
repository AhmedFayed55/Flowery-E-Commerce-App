import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/domain/entities/logout_response_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/domain/use_cases/logout_use_case.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/presentation/manager/logout_cubit.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/presentation/manager/logout_event.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/presentation/manager/logout_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_cubit_test.mocks.dart';

@GenerateMocks([LogoutUseCase])
void main() {
  group("Change Password View Model test ", () {
    final LogoutUseCase useCase = MockLogoutUseCase();

    final LogoutResponseEntity response = LogoutResponseEntity(message: "Good");

    final ApiResult<LogoutResponseEntity> successResponse =
        ApiSuccessResult<LogoutResponseEntity>(data: response);
    final ApiResult<LogoutResponseEntity> errorResponse = ApiErrorResult(
      failure: Failure(errorMessage: "Something went wrong"),
    );

    provideDummy<ApiResult<LogoutResponseEntity>>(successResponse);

    blocTest<LogoutCubit, LogoutState>(
      "call doIntent with SubmitLogoutEvent then call _submitChangePassword and return success",
      build: () {
        when(useCase.invoke()).thenAnswer((_) async => successResponse);
        return LogoutCubit(useCase);
      },
      act: (viewModel) async => await viewModel.doIntent(SubmitLogoutEvent()),
      expect: () => [
        const LogoutState(isLoading: true),
        const LogoutState(isLoading: false, isSuccess: true),
      ],
      verify: (_) => verify(useCase.invoke()).called(1),
    );

    blocTest<LogoutCubit, LogoutState>(
      "call doIntent with SubmitLogoutEvent then call _submitChangePassword and return error",
      build: () {
        when(useCase.invoke()).thenAnswer((_) async => errorResponse);
        return LogoutCubit(useCase);
      },
      act: (viewModel) async => await viewModel.doIntent(SubmitLogoutEvent()),
      expect: () => [
        const LogoutState(isLoading: true),
        const LogoutState(isLoading: false, errorMsg: "Something went wrong"),
      ],
      verify: (_) => verify(useCase.invoke()).called(1),
    );
  });
}
