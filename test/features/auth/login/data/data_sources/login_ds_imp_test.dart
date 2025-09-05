import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/data_sources/login_ds_imp.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/request/login_request_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/responce/login_responce_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/responce/user_model_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_ds_imp_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  test('when call login is should call login from apiServices', () async {
    MockApiServices mockApiServices = MockApiServices();

    UserModelDto userModelDto = const UserModelDto(
     
      id: 'sss',
      firstName: 'yahya',
      lastName: 'mohamed',
      email: 'yahya22@gmail.com',
      gender: 'male',
      phone: '',
      photo: '',
      role: '',
      wishlist: [],
      addresses: [],
      createdAt: '',
    );

    LoginResponceDto loginResponceDto = LoginResponceDto(
      message: 'successs',
      user: userModelDto,
      token: 'token',
    );

    LoginDataSourceImp loginDataSourceImp = LoginDataSourceImp(mockApiServices);
    LoginRequestDto loginRequestDto = const LoginRequestDto(
      email: 'yahya22@gmail.com',
      password: 'Yahya22!',
    );

    when(
      mockApiServices.login(loginRequestDto),
    ).thenAnswer((_) async => loginResponceDto);

    var result = await loginDataSourceImp.login(loginRequestDto);

    verify(mockApiServices.login(loginRequestDto)).called(1);
    expect(result, equals(loginResponceDto));
  });
}
