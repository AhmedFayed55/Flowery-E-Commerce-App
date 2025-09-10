import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/data_sources/login_ds.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/request/login_request_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/responce/login_responce_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImp implements LoginDataSource {
  final ApiServices _apiServices;
  LoginDataSourceImp(this._apiServices);
  @override
  Future<LoginResponceDto> login(LoginRequestDto loginRequestDto) async {
    var responce = await _apiServices.login(loginRequestDto);
    return responce;
  }
}
