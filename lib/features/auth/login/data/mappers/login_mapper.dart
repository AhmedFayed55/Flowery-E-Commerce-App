import 'package:flowers_ecommerce_app/features/auth/login/data/model/request/login_request_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/login_request_entity.dart';

LoginRequestDto toDto(LoginRequestEntity loginRequestEntity) {
  return LoginRequestDto(
    email: loginRequestEntity.email,
    password: loginRequestEntity.password,
  );
}
