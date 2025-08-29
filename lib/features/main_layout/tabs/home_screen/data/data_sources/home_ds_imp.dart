import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:injectable/injectable.dart';

import '../model/home_response_dto.dart';
import 'home_ds.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImp implements HomeDataSource {
  final ApiServices _apiServices;
  HomeDataSourceImp(this._apiServices);
  @override
  Future<HomeResponseDto> homeDataSource() {
    return _apiServices.homeData();
  }
}
