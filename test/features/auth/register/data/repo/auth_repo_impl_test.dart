import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/register_respone.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/user.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/source/auth_remote_data_sourse.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/repo/auth_repo_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  test(
    'when calling register, should return ApiResult<RegisterRespone>',
    () async {
      //arrange
      MockAuthRemoteDataSource mockAuthRemoteDataSource =
          MockAuthRemoteDataSource();
      AuthRepoImpl authRepoImpl = AuthRepoImpl(mockAuthRemoteDataSource);
      RegisterBody registerBody = RegisterBody(
        firstName: 'name',
        lastName: 'lastName',
        email: 'emailTest@gmail.com',
        password: 'password@123',
        rePassword: 'Password@123',
        phone: '+20123456789',
        gender: 'male',
      );

      RegisterRespone expected = RegisterRespone(
        message: 'message',
        token: 'token',
        user: User(
          id: '1',
          firstName: 'name',
          lastName: 'lastName',
          email: 'emailTest@gmail.com',
          role: 'customer',
          phone: '+20123456789',
          gender: 'male',
        ),
      );
     // var expected = ApiSuccessResult<RegisterRespone>(data: registerRespone);

      provideDummy<RegisterRespone>(expected);

      when(
        mockAuthRemoteDataSource.register(registerBody),
      ).thenAnswer((_) async => expected);
      //act
      var result = await authRepoImpl.register(registerBody);
      result as ApiSuccessResult<RegisterRespone>;

      //assert
      verify(mockAuthRemoteDataSource.register(registerBody)).called(1);
      expect(result, isA<ApiSuccessResult<RegisterRespone>>());
      expect(result.data.user, equals(expected.user));
    },
  );
}
