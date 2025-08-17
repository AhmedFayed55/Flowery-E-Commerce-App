import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/register_respone.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/source/auth_remote_data_sourse.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
@Injectable(as: AuthRepo)
class AuthRemoteDataSourseImlp implements AuthRemoteDataSource {
  ApiServices _apiServices;

  AuthRemoteDataSourseImlp(this._apiServices);
  @override
  Future<ApiResult<RegisterRespone>> register(RegisterBody request)  async{
     final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;

    if (!isConnected) {
      return ApiErrorResult(failure: Failure(errorMessage: Constants.noInternet));
    }

    try {
      final response = await _apiServices.register(request);
      return ApiSuccessResult<RegisterRespone>(data: response);
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }
}