import 'package:flowers_ecommerce_app/features/auth/change_password/data/models/mapper/change_password_request_maper.dart';
import 'package:flowers_ecommerce_app/features/auth/change_password/data/models/request/change_password_request_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/change_password/domain/entities/change_password_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when use toChangePasswordRequestDto with null values '
      'should return ChangePasswordRequestDto with null values', () {
    ChangePasswordRequestEntity entity = const ChangePasswordRequestEntity(
      password: null,
      newPassword: null,
    );

    ChangePasswordRequestDto dto = toChangePasswordRequestDto(entity);

    expect(dto.password, null);
    expect(dto.newPassword, null);
  });

  test('when use toChangePasswordRequestDto with non-null values '
      'should return ChangePasswordRequestDto with correct values', () {
    ChangePasswordRequestEntity entity = const ChangePasswordRequestEntity(
      password: "11",
      newPassword: "22",
    );

    ChangePasswordRequestDto dto = toChangePasswordRequestDto(entity);

    expect(dto.password, entity.password);
    expect(dto.newPassword, entity.newPassword);
  });
}
