import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/datasources/remote/email_verify_remote_datasource.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/email_verify_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EmailVerifyRemoteDataSource)
class EmailVerifyRemoteDataSourceImpl implements EmailVerifyRemoteDataSource {
  ApiServices apiServices;

  EmailVerifyRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ApiResult<EmailVerifyModel>> emailVerify(String code) async {
    try {
      EmailVerifyModel emailVerifyModel = await apiServices.verifyResetCode({
        "resetCode": code,
      });
      return ApiSuccessResult<EmailVerifyModel>(data: emailVerifyModel);
    } on DioException catch (dioError) {
      if (dioError.response != null && dioError.response?.data != null) {
        final errorData = dioError.response?.data;
        final errorMessage = errorData["error"] ?? "Unknown server error";

        return ApiErrorResult<EmailVerifyModel>(
          failure: Failure(errorMessage: errorMessage),
        );
      }
      return ApiErrorResult<EmailVerifyModel>(
        failure: ServerFailure.fromDioError(dioException: dioError),
      );
    } catch (error) {
      return ApiErrorResult<EmailVerifyModel>(
        failure: Failure(errorMessage: error.toString()),
      );
    }
  }
}
