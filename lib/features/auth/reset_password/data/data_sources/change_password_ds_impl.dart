import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/data/data_sources/change_password_ds.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/data/models/request/change_password_request_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/services/token_service.dart';
import '../models/response/change_password_response_dto.dart';

@Injectable(as: ChangePasswordDataSource)
class ChangePasswordDataSourceImpl implements ChangePasswordDataSource {
  final ApiServices _apiServices;
  final TokenService _tokenService;
  ChangePasswordDataSourceImpl(this._apiServices, this._tokenService);

  @override
  Future<ChangePasswordResponseDto> changePassword(
    ChangePasswordRequestDto request,
  ) async {
    final token = await _tokenService.getToken();
    return await _apiServices.changePassword(
      request,
      "${AppConstants.bearer} $token",
    );
  }
}
