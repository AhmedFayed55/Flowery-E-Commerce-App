import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/domain/entities/logout_response_entity.dart';

abstract interface class LogoutRepo {
  LogoutRepo();

  Future<ApiResult<LogoutResponseEntity>> logout();
}
