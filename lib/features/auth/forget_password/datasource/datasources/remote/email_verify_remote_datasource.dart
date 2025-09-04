import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/email_verify_model.dart';

abstract class EmailVerifyRemoteDataSource {
  Future<ApiResult<EmailVerifyModel>> emailVerify(String code);
}
