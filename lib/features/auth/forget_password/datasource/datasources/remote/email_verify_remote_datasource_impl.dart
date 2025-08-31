import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
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
    return await safeApiCall<EmailVerifyModel>(() async {
      return await apiServices.verifyResetCode({"resetCode": code});
    });
  }
}
