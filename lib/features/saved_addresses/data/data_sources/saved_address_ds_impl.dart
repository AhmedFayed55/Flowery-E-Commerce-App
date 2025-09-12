import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/core/services/token_service.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/data_sources/saved_address_ds.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/remove_address_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_constants.dart';

@Injectable(as: SavedAddressDataSource)
class SavedAddressDataSourceImpl implements SavedAddressDataSource {
  final ApiServices _apiServices;
  final TokenService _tokenService;

  SavedAddressDataSourceImpl(this._apiServices, this._tokenService);

  @override
  Future<RemoveAddressDto> removeAddress(String id) async {
    final token = await _tokenService.getToken();
    return await _apiServices.removeAddress(
      "${AppConstants.bearer} $token",
      id,
    );
  }

  @override
  Future<RemoveAddressDto> getAllAddresses() async {
    final token = await _tokenService.getToken();
    return await _apiServices.getAllAddresses("${AppConstants.bearer} $token");
  }
}
