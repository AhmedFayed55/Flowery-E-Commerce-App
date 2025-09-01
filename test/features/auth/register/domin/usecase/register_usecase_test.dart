import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_body.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_respone.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/repo/auth_repo.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/usecase/register_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_usecase_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  test(
    'when call register usecase with valid data should return ApiResult<RegisterRespone>',
    () async {
      MockAuthRepo authRepo = MockAuthRepo();
      RegisterUsecase registerUsecase = RegisterUsecase(authRepo: authRepo);
      RegisterBody registerBody = RegisterBody(
        firstName: 'name',
        lastName: 'lastName',
        email: 'emailTest@gmail.com',
        password: 'password@123',
        rePassword: 'Password@123',
        phone: '+20123456789',
        gender: 'male',
      );

      RegisterRespone registerRespone = RegisterRespone(
       'message',
        
      );
      var excepted = ApiSuccessResult<RegisterRespone>(data: registerRespone);
      provideDummy<ApiResult<RegisterRespone>>(excepted);

      when(authRepo.register(registerBody)).thenAnswer((_) async => excepted);

      final result = await registerUsecase.invok(registerBody);
      result as ApiSuccessResult<RegisterRespone>;
      verify(authRepo.register(registerBody)).called(1);

      expect(result, isA<ApiSuccessResult<RegisterRespone>>());
      expect(result.data, equals(registerRespone));
    },
  );
}
