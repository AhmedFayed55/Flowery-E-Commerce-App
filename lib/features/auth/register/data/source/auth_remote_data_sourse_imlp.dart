import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/register_respone_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/source/auth_remote_data_sourse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourseImlp implements AuthRemoteDataSource {
  final ApiServices _apiServices;

  AuthRemoteDataSourseImlp(this._apiServices);
  @override
  Future<RegisterResponeDto> register(RegisterBodyDTo request) async {
    return await _apiServices.register(request);
  }
}
