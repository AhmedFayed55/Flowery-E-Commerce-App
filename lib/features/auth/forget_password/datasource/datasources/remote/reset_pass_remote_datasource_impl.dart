import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/datasources/remote/reset_pass_remote_datasource.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/reset_pass_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl
    implements ResetPasswordRemoteDataSource {
  ApiServices apiServices;

  ResetPasswordRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ApiResult<ResetPasswordModel>> resetPassword(
    String email,
    String newPassword,
  ) async {
    return await safeApiCall<ResetPasswordModel>(() async {
      return await apiServices.resetPassword({
        "email": email,
        "newPassword": newPassword,
      });
    });
  }
}
