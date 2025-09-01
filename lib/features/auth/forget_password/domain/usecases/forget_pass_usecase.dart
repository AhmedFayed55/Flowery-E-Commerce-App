import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/forget_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/repository/forget_pass_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetPasswordRepoContract forgetPasswordRepoContract;

  ForgetPasswordUseCase({required this.forgetPasswordRepoContract});

  Future<ApiResult<ForgetPasswordModel>> call(String email) async {
    ApiResult<ForgetPasswordModel> forgetPassword =
        await forgetPasswordRepoContract.forgetPassword(email);
    return forgetPassword;
  }
}
