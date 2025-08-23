import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_body.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_respone.dart';

abstract interface class AuthRepo {
  Future<ApiResult<RegisterRespone>> register(RegisterBody request);

}