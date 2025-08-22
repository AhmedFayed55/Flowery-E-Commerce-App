import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/network/api_constants.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/email_verify_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/forget_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/reset_pass_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(ApiConstants.forgetPasswordEndpoint)
  Future<ForgetPasswordModel> forgetPassword(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.verifyResetCode)
  Future<EmailVerifyModel> verifyResetCode(@Body() Map<String, dynamic> body);

  @PUT(ApiConstants.verifyResetCode)
  Future<ResetPasswordModel> resetPassword(@Body() Map<String, dynamic> body);
}
