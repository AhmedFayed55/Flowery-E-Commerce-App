import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/datasources/remote/email_verify_remote_datasource.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/email_verify_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/repository/email_verify_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EmailVerifyRepoContract)
class EmailVerifyRepoImpl implements EmailVerifyRepoContract {
  EmailVerifyRemoteDataSource emailVerifyRemoteDataSource;

  EmailVerifyRepoImpl({required this.emailVerifyRemoteDataSource});

  @override
  Future<ApiResult<EmailVerifyModel>> emailVerify(String code) async {
    ApiResult<EmailVerifyModel> emailVerifyModel =
        await emailVerifyRemoteDataSource.emailVerify(code);
    return emailVerifyModel;
  }
}
