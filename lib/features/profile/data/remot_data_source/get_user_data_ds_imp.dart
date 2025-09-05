import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/profile/data/model/user_response_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/data/remot_data_source/get_user_data_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetUserDataDataSource)
class GetUserDataDataSourceImp implements GetUserDataDataSource {
  final ApiServices _apiServices;
  GetUserDataDataSourceImp(this._apiServices);

  @override
  Future<UserResponseDto> getUserDataSource() async {
    return await _apiServices.userData();
  }
}
