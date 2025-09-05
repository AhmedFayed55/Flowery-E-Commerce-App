import 'package:flowers_ecommerce_app/features/auth/logout/data/data_sources/logout_ds.dart';
import 'package:flowers_ecommerce_app/features/auth/logout/data/models/logout_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_services.dart';
import '../../../../../core/services/token_service.dart';
import '../../../../../core/utils/app_constants.dart';

@Injectable(as: LogoutDataSource)
class LogoutDataSourceImpl implements LogoutDataSource {
  final ApiServices _apiServices;
  final TokenService _tokenService;

  LogoutDataSourceImpl(this._apiServices, this._tokenService);

  @override
  Future<LogoutResponseDto> logout() async {
    final token = await _tokenService.getToken() as String;
    return await _apiServices.logout("${AppConstants.bearer} $token");
  }
}
