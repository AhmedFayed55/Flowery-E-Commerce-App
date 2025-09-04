import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/network/api_constants.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/request/login_request_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/responce/login_responce_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/register_respone_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/data/models/request/change_password_request_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/data/models/response/change_password_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
 factory ApiServices(Dio dio) = _ApiServices;
  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponceDto> login(@Body() LoginRequestDto loginRequestDto);

  @POST(ApiConstants.registerEndpoint)
  Future<RegisterResponeDto> register(@Body() RegisterBodyDTo request);

  @PATCH(ApiConstants.changePassword)
 Future<ChangePasswordResponseDto> changePassword(
      @Body() ChangePasswordRequestDto requestDto,
      @Header(ApiConstants.authorization) String token,
      );

}
