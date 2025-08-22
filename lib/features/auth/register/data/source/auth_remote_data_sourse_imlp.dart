import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_respone/register_respone.dart';
import 'package:flowers_ecommerce_app/features/auth/register/data/source/auth_remote_data_sourse.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourseImlp implements AuthRemoteDataSource {
  final ApiServices _apiServices;

  AuthRemoteDataSourseImlp(this._apiServices);
  @override
  Future<RegisterRespone> register(RegisterBody request) async {
  return await _apiServices.register(request);    
  }
}
