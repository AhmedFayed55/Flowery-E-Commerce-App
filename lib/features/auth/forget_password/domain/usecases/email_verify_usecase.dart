import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/email_verify_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/repository/email_verify_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class EmailVerifyUseCase{
EmailVerifyRepoContract emailVerifyRepoContract;
  EmailVerifyUseCase({required this.emailVerifyRepoContract});

  Future<ApiResult<EmailVerifyModel>> call(String code) async {
    ApiResult<EmailVerifyModel> emailVerifyModel =
        await emailVerifyRepoContract.emailVerify(code);
    return emailVerifyModel;
  }


}