import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/network/api_constants.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/email_verify_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/forget_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/reset_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/request/login_request_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/responce/login_responce_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/register_respone_dto.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/delete_cart_item_respone/delete_cart_item_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_cart_prouduct_quantity_body.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_proudact_quantity_respone/updeate_proudact_quantity_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/user_cart/user_cart.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/data/model/get_specific_product_respone/get_specific_product_respone.dart';
import 'package:flowers_ecommerce_app/features/categories/data/models/response/category_response.dart';
import 'package:flowers_ecommerce_app/features/categories/data/models/response/product_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart'  hide ParseErrorLogger;
import 'package:retrofit/http.dart';
import '../../features/occasions/data/models/occasions_response_dto.dart';

import '../../features/main_layout/tabs/home_screen/data/model/home_response_dto.dart';
import 'fake_error.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
 factory ApiServices(Dio dio) = _ApiServices;
  factory ApiServices(Dio dio) = _ApiServices;
  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponceDto> login(@Body() LoginRequestDto loginRequestDto);

  @POST(ApiConstants.forgetPasswordEndpoint)
  Future<ForgetPasswordModel> forgetPassword(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.verifyResetCode)
  Future<EmailVerifyModel> verifyResetCode(@Body() Map<String, dynamic> body);

  @PUT(ApiConstants.resetPassword)
  Future<ResetPasswordModel> resetPassword(@Body() Map<String, dynamic> body);
  @POST(ApiConstants.registerEndpoint)
  Future<RegisterResponeDto> register(@Body() RegisterBodyDTo request);

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponceDto> login(@Body() LoginRequestDto loginRequestDto);

  @POST(ApiConstants.forgetPasswordEndpoint)
  Future<ForgetPasswordModel> forgetPassword(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.verifyResetCode)
  Future<EmailVerifyModel> verifyResetCode(@Body() Map<String, dynamic> body);

  @PUT(ApiConstants.verifyResetCode)
  Future<ResetPasswordModel> resetPassword(@Body() Map<String, dynamic> body);

  @GET(ApiConstants.homeEndpoint)
  Future<HomeResponseDto> homeData();

  @GET(ApiConstants.getAllProducts)
  Future<ProductResponse> getAllProducts();

  @GET(ApiConstants.categories)
  Future<CategoryResponse> getAllCategory();

  @GET(ApiConstants.product)
  Future<GetSpecificProductRespone> getSpecificProduct(@Path('productId') String productId);

  @GET(ApiConstants.getSpecificOccasion)
  Future<OccasionsResponseDto> getOccasions();


  @GET(ApiConstants.cart)
  Future<UserCartDto> getUserCart();

  @PUT(ApiConstants.cartUD)
  Future<UpdeateProudactQuantityRespone> updeateCartProudctQuantity(
    @Path("id") String id,
    @Body() UpdeateCartProuductQuantityBody body,
  );

  @DELETE(ApiConstants.cartUD)
  Future<DeleteCartItemRespone> deleteCartProudct(@Path("id") String id);
}
