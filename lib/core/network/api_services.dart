import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/auth/register/data/model/register_body_dto.dart';
import '../../features/auth/register/data/model/register_respone/register_respone_dto.dart';
import '../../features/occasions/data/models/occasions_response_dto.dart';
import 'api_constants.dart';

part 'api_services.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(ApiConstants.registerEndpoint)
  Future<RegisterResponeDto> register(@Body() RegisterBodyDTo request);

  @GET(ApiConstants.getSpecificOccasion)
  Future<OccasionsResponseDto> getOccasions();
}
