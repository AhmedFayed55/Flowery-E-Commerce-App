import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/login_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/user_entitiy.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/repositories/login_repo.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([LoginRepo])
void main() {
  test('when call usecase is should call loginRepo from Repo', () async {
    LoginRequestEntity loginRequestEntity = const LoginRequestEntity(
      email: 'yahya22@',
      password: 'yahya22!',
    );
    UserLoginEntity userEntity =const UserLoginEntity(
     
      firstName: 'yahya',
      lastName: 'mohamed',
      email: 'ym',
      gender: 'male',
      phone: '',
      photo: '',
      wishlist: [],
      addresses: [],
    );

    var expectedResult = ApiSuccessResult<UserLoginEntity>(data: userEntity);
    MockLoginRepo mockLoginRepo = MockLoginRepo();
    LoginUseCase loginUseCase = LoginUseCase(mockLoginRepo);
    var expectedResuilt = ApiSuccessResult<UserLoginEntity>(data: userEntity);
    provideDummy<ApiResult<UserLoginEntity>>(expectedResuilt);
    when(
      mockLoginRepo.loginRepo(loginRequestEntity),
    ).thenAnswer((_) async => expectedResult);

    final result = await loginUseCase.call(loginRequestEntity);

    verify(mockLoginRepo.loginRepo(loginRequestEntity)).called(1);
    expect(result, isA<ApiSuccessResult<UserLoginEntity>>());
  });
}
