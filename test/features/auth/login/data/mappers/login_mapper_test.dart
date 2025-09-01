import 'package:flowers_ecommerce_app/features/auth/login/data/mappers/login_mapper.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/request/login_request_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/login_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when use toDto should return LoginRequestDto', () {
    LoginRequestEntity loginRequestEntity = const LoginRequestEntity(
      email: 'yahya22@',
      password: 'yahya22!',
    );

    LoginRequestDto loginRequestDto =const LoginRequestDto(email: 'yahya22@', password: 'yahya22!');

   var result= toDto(loginRequestEntity);
   expect(result, equals(loginRequestDto));
  });
}
