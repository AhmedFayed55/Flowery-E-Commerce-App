import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/network/api_constants.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/email_verify_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/forget_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/reset_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/request/login_request_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/responce/login_responce_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/register_respone_dto.dart';
import 'package:flowers_ecommerce_app/features/home_screen/data/model/home_response_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/data/model/user_response_dto.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/delete_cart_item_respone/delete_cart_item_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_cart_prouduct_quantity_body.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_proudact_quantity_respone/updeate_proudact_quantity_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/user_cart/user_cart.dart';
import 'package:flowers_ecommerce_app/features/checkout/data/model/get_user_addreses_respone/get_user_addreses_respone.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/request/payment_request_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/responce/card_pay_responce/card_pay_responce_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/responce/cash_pay_responce/cash_pay_responce_model_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/auth/change_password/data/models/request/change_password_request_dto.dart';
import '../../features/auth/change_password/data/models/response/change_password_response_dto.dart';

part 'api_services.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;
  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponceDto> login(@Body() LoginRequestDto loginRequestDto);
  @GET(ApiConstants.homeEndpoint)
  Future<HomeResponseDto> homeData();

  @POST(ApiConstants.forgetPasswordEndpoint)
  Future<ForgetPasswordModel> forgetPassword(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.verifyResetCode)
  Future<EmailVerifyModel> verifyResetCode(@Body() Map<String, dynamic> body);

  @PUT(ApiConstants.resetPassword)
  Future<ResetPasswordModel> resetPassword(@Body() Map<String, dynamic> body);
  @POST(ApiConstants.registerEndpoint)
  Future<RegisterResponeDto> register(@Body() RegisterBodyDTo request);

  @GET(ApiConstants.userData)
  Future<UserResponseProfileDto> userData();

  @PATCH(ApiConstants.changePassword)
  Future<ChangePasswordResponseDto> changePassword(
    @Body() ChangePasswordRequestDto requestDto,
    @Header(ApiConstants.authorization) String token,
  );
  @GET(ApiConstants.cart)
  Future<UserCartDto> getUserCart();

  @PUT(ApiConstants.cartUD)
  Future<UpdeateProudactQuantityRespone> updeateCartProudctQuantity(
    @Path("id") String id,
    @Body() UpdeateCartProuductQuantityBody body,
  );

  @DELETE(ApiConstants.cartUD)
  Future<DeleteCartItemRespone> deleteCartProudct(@Path("id") String id);

  @GET(ApiConstants.addresses)
  Future<GetUserAddresesRespone> getLoggedUserAddresses();
  @POST(ApiConstants.paymendCard)
  Future<CardPayResponceModelDto> paymentCard(
    @Body() PaymentRequestModelDto paymentRequestModelDto,
  );
  @POST(ApiConstants.paymentCash)
  Future<CashPayResponceModelDto> paymentCash(
    @Body() PaymentRequestModelDto paymentRequestModelDto,
  );
}
