import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/forget_pass_model.dart';

abstract class ForgetPasswordRemoteDataSource {
  Future<ApiResult<ForgetPasswordModel>> forgetPassword(String email);
}
