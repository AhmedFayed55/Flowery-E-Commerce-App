import 'package:flowers_ecommerce_app/core/errors/api_results.dart';

import '../entities/change_password_request_entity.dart';
import '../entities/change_password_response_entity.dart';

abstract interface class ChangePasswordRepo {
  Future<ApiResult<ChangePasswordResponseEntity>> changePassword(
    ChangePasswordRequestEntity request,
  );
}
