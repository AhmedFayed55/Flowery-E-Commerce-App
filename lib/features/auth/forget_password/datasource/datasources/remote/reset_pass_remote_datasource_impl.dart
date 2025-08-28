import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/datasources/remote/reset_pass_remote_datasource.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/reset_pass_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl implements ResetPasswordRemoteDataSource {
  ApiServices apiServices;

  ResetPasswordRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ApiResult<ResetPasswordModel>> resetPassword(
    String email,
    String newPassword,
  ) async {
    try {
      ResetPasswordModel resetPasswordModel = await apiServices.resetPassword({
        "email": email,
        "newPassword": newPassword,
      });
      return ApiSuccessResult<ResetPasswordModel>(data: resetPasswordModel);
    } on DioException catch (dioError) {
      if (dioError.response != null && dioError.response?.data != null) {
        return ApiErrorResult<ResetPasswordModel>(
          failure: Failure(errorMessage: dioError.message ?? "Unknown server error"),
        );
      }
      return ApiErrorResult<ResetPasswordModel>(
        failure: ServerFailure.fromDioError(dioException: dioError),
      );
    } catch (error) {
      return ApiErrorResult<ResetPasswordModel>(
        failure: Failure(errorMessage: error.toString()),
      );
    }
  }
}
