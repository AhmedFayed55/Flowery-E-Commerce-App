import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body_dto.dart' ;
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/register_respone_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<RegisterResponeDto> register(RegisterBodyDTo request);
}

