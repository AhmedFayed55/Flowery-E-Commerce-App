import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/occasions/data/data_sources/occasions_ds.dart';
import 'package:flowers_ecommerce_app/features/occasions/data/models/occasions_response_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OccasionsDataSource)
class OccasionsDataSourceImpl implements OccasionsDataSource {
  final ApiServices _apiServices;
  OccasionsDataSourceImpl(this._apiServices);

  @override
  Future<OccasionsResponseDto> getOccasions() async =>
      await _apiServices.getOccasions();
}
