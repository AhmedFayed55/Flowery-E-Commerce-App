import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/login_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/user_entitiy.dart';

abstract class LoginRepo {
  Future<ApiResult<UserLoginEntity>> loginRepo(
    LoginRequestEntity loginRequestEntity,
  );
}
