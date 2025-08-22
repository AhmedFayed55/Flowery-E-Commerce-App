import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body.dart' show RegisterBody;
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/register_respone.dart';

abstract interface class AuthRemoteDataSource {
  Future<RegisterRespone> register(RegisterBody request);
}