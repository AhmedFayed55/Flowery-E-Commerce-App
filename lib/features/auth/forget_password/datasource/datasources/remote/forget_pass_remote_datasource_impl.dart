import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/datasources/remote/forget_pass_remote_datasource.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/forget_pass_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  ApiServices apiServices;

  ForgetPasswordRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ApiResult<ForgetPasswordModel>> forgetPassword(String email) async {
    try {
      ForgetPasswordModel forgetPasswordModel = await apiServices
          .forgetPassword({"email": email});
      return ApiSuccessResult<ForgetPasswordModel>(data: forgetPasswordModel);

    } on DioException catch(dioError){
      return ApiErrorResult(failure: ServerFailure.fromDioError(dioException: dioError));
    }catch (error) {
      return ApiErrorResult<ForgetPasswordModel>(
        failure: Failure(errorMessage: error.toString()),
      );
    }
  }
}
