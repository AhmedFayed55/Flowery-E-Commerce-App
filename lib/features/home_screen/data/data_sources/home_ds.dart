import 'package:flowers_ecommerce_app/features/home_screen/data/model/home_response_dto.dart';

abstract class HomeDataSource {
  Future<HomeResponseDto> homeDataSource();
}
