import '../../../domain/entities/change_password_request_entity.dart';
import '../request/change_password_request_dto.dart';

ChangePasswordRequestDto toChangePasswordRequestDto(
  ChangePasswordRequestEntity entity,
) => ChangePasswordRequestDto(
  password: entity.password,
  newPassword: entity.newPassword,
);
