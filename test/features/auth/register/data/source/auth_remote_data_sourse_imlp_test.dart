import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/mapper/to_register_body_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/register_respone_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/user.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_body.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_respone.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/source/auth_remote_data_sourse_imlp.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_remote_data_sourse_imlp_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  group('Test AuthRemoteDataSourseImlp', () {
    MockApiServices mockApiServices = MockApiServices();
    AuthRemoteDataSourseImlp authRemoteDataSourseImlp =
        AuthRemoteDataSourseImlp(mockApiServices);

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
    RegisterResponeDto registerResponeDto = RegisterResponeDto(
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

    test(
      'when i call register method with Right RegisterBody data should return ApiResult<RegisterRespone>',
      () async {
        when(
          mockApiServices.register(any),
        ).thenAnswer((_) async => registerResponeDto);

        var result = await authRemoteDataSourseImlp.register(toRegisterBodyDTo(registerBody));
        verify(mockApiServices.register(any)).called(1);
        expect(result, isA<RegisterResponeDto>());
        expect(result.message, equals(registerRespone.message));
      },
    );

  });
}
