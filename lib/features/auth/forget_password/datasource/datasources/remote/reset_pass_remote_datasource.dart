import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/reset_pass_model.dart';

abstract class ResetPasswordRemoteDataSource{

  Future<ApiResult<ResetPasswordModel>> resetPassword(String email,String newPassword);

}