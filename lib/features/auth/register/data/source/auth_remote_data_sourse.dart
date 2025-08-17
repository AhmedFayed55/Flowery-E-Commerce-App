import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body.dart' show RegisterBody;
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/register_respone.dart';

abstract interface class AuthRemoteDataSource {
  Future<ApiResult<RegisterRespone>> register(RegisterBody request);
}