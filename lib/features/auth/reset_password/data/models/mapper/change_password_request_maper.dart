import 'package:flowers_ecommerce_app/features/auth/reset_password/data/models/request/change_password_request_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_request_entity.dart';

ChangePasswordRequestDto toChangePasswordRequestDto(ChangePasswordRequestEntity entity) => ChangePasswordRequestDto(
  password: entity.password,
  newPassword: entity.newPassword
);