import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/home_screen/data/data_sources/home_ds.dart';
import 'package:flowers_ecommerce_app/features/home_screen/data/model/home_response_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImp implements HomeDataSource {
  final ApiServices _apiServices;
  HomeDataSourceImp(this._apiServices);
  @override
  Future<HomeResponseDto> homeDataSource() {
    return _apiServices.homeData();
  }
}
