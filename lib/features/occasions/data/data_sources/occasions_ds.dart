import 'package:flowers_ecommerce_app/features/occasions/data/models/occasions_response_dto.dart';

abstract interface class OccasionsDataSource{
  Future<OccasionsResponseDto> getOccasions();
}