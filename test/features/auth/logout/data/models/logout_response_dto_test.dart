import 'package:flowers_ecommerce_app/features/auth/logout/data/models/logout_response_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/domain/entities/logout_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'when call toLogoutResponseEntity with null values should return LogoutResponseEntity with null values',
    () {
      final LogoutResponseDto dto = LogoutResponseDto(message: null);

      final LogoutResponseEntity entity = dto.toLogoutResponseEntity();

      expect(entity.message, null);
    },
  );

  test(
    'when call toLogoutResponseEntity with non-Null values should return LogoutResponseEntity with correct values',
    () {
      final LogoutResponseDto dto = LogoutResponseDto(message: "Hello");

      final LogoutResponseEntity entity = dto.toLogoutResponseEntity();

      expect(entity.message, dto.message);
    },
  );
}
