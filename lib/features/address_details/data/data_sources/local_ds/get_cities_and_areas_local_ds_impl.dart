import 'dart:convert';

import 'package:flowers_ecommerce_app/core/utils/app_images.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/data_sources/local_ds/get_cities_and_areas_local_ds.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/area_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/cities_response_dto.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetCitiesAndAreasLocalDataSource)
class GetCitiesAndAreasLocalDataSourceImpl
    implements GetCitiesAndAreasLocalDataSource {
  @override
  Future<AreaResponseDto> getAreas() async {
    final String response = await rootBundle.loadString(AppImages.areasJson);
    final data = json.decode(response);
    return AreaResponseDto.fromJson(data);
  }

  @override
  Future<CitiesResponseDto> getCities() async {
    final String response = await rootBundle.loadString(AppImages.citiesJson);
    final data = json.decode(response);
    return CitiesResponseDto.fromJson(data);
  }
}
