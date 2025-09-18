import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/user_entity.dart';

abstract class GetUserDataRepo {
  Future<ApiResult<UserProfileEntity>> getUserDataRepo();
}
