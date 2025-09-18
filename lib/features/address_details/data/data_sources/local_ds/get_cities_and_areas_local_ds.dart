import 'package:flowers_ecommerce_app/features/address_details/data/models/response/area_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/cities_response_dto.dart';

abstract interface class GetCitiesAndAreasLocalDataSource {
  Future<CitiesResponseDto> getCities();

  Future<AreaResponseDto> getAreas();
}
