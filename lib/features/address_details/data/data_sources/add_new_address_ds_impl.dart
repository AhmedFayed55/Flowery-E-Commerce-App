import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/request/add_new_address_request_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/addresses_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/token_service.dart';
import '../../../../core/utils/app_constants.dart';
import 'add_new_address_ds.dart';

@Injectable(as: AddNewAddressDataSource)
class AddNewAddressDataSourceImpl implements AddNewAddressDataSource {
  final ApiServices _apiServices;
  final TokenService _tokenService;

  AddNewAddressDataSourceImpl(this._apiServices, this._tokenService);

  @override
  Future<AddressesResponseDto> addNewAddress(
    AddNewAddressRequestDto requestDto,
  ) async {
    final token = await _tokenService.getToken();
    return await _apiServices.addNewAddress(
      "${AppConstants.bearer} $token",
      requestDto,
    );
  }
}
