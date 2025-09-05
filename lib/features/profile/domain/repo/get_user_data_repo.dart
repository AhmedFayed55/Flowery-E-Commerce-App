import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/user_entitiy.dart';

abstract class GetUserDataRepo {
  Future<ApiResult<UserLoginEntity>> getUserDataRepo();
}
