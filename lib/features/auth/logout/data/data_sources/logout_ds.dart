import 'package:flowers_ecommerce_app/features/auth/logout/data/models/logout_response_dto.dart';

abstract interface class LogoutDataSource {
  Future<LogoutResponseDto> logout();
}
