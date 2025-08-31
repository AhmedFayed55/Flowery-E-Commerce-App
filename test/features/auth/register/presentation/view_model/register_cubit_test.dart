import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_body.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_respone.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/usecase/register_usecase.dart';
import 'package:flowers_ecommerce_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flowers_ecommerce_app/features/auth/register/presentation/view_model/cubit/registr_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_cubit_test.mocks.dart';

@GenerateMocks([RegisterUsecase])
void main() {
  late MockRegisterUsecase registerUsecase;
  late RegisterBody registerBody;
  late RegisterRespone registerRespone;
  late ApiSuccessResult<RegisterRespone> successResult;

  setUp(() {
    registerUsecase = MockRegisterUsecase();
    registerBody = RegisterBody(
      firstName: 'name',
      lastName: 'lastName',
      email: 'emailTest@gmail.com',
      password: 'password@123',
      rePassword: 'Password@123',
      phone: '+20123456789',
      gender: 'male',
    );
    registerRespone = RegisterRespone(
      'message',
    );
    successResult = ApiSuccessResult<RegisterRespone>(data: registerRespone);

    
    provideDummy<ApiResult<RegisterRespone>>(successResult);
  });

  group('RegisterCubit Tests', () {
    blocTest<RegisterCubit, RegisterState>(
      'should emit [loading, success] when RegisterUsecase returns success',
      build: () {
        when(
          registerUsecase.invok(registerBody),
        ).thenAnswer((_) async => successResult);
        return RegisterCubit(registerUsecase);
      },
      act: (cubit) => cubit.doIntent(RegisterSubmitEvent(registerBody)),
      verify: (_) {
        verify(registerUsecase.invok(registerBody)).called(1);
      },
      expect: () => [
        RegisterState(
          isLoading: true,
          isSuccess: false,
          isFailure: false,
          errorMessage: '',
        ),
        RegisterState(
          isLoading: false,
          isSuccess: true,
          isFailure: false,
          errorMessage: '',
        ),
      ],
    );

    blocTest<RegisterCubit, RegisterState>(
      'should emit [loading, failure] when RegisterUsecase returns failure',
      build: () {
        final failureResult = ApiErrorResult<RegisterRespone>(
          failure: Failure(errorMessage: 'Error occurred'),
        );
        when(
          registerUsecase.invok(registerBody),
        ).thenAnswer((_) async => failureResult);
        return RegisterCubit(registerUsecase);
      },
      act: (cubit) => cubit.doIntent(RegisterSubmitEvent(registerBody)),
      verify: (_) {
        verify(registerUsecase.invok(registerBody)).called(1);
      },
      expect: () => [
        RegisterState(
          isLoading: true,
          isSuccess: false,
          isFailure: false,
          errorMessage: '',
        ),
        RegisterState(
          isLoading: false,
          isSuccess: false,
          isFailure: true,
          errorMessage: 'Error occurred',
        ),
      ],
    );
  });
}
