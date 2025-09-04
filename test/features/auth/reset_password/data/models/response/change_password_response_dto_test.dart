import 'package:flowers_ecommerce_app/features/auth/reset_password/data/models/response/change_password_response_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'when use toEntity with null values should return ChangePasswordResponseEntity with null values',
        () {
      ChangePasswordResponseDto dto = ChangePasswordResponseDto(
        message: null, token: null
      );

      ChangePasswordResponseEntity entity = dto.toChangePasswordResponseEntityEntity();

      expect(entity.token, null);
      expect(entity.message, null);
    },
  );

  test(
    'when use toEntity with non-null values should return ChangePasswordResponseEntity with correct values',
        () {
      ChangePasswordResponseDto dto = ChangePasswordResponseDto(
          message: "Hello", token: "advsbsdbss256s2vs"
      );

      ChangePasswordResponseEntity entity = dto.toChangePasswordResponseEntityEntity();

      expect(entity.message, dto.message);
      expect(entity.token, dto.token);
    },
  );
}