import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/reset_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/repository/reset_pass_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  ResetPasswordRepoContract resetPasswordRepoContract;

  ResetPasswordUseCase({required this.resetPasswordRepoContract});

  Future<ApiResult<ResetPasswordModel>> call(
    String email,
    String newPassword,
  ) async {
    ApiResult<ResetPasswordModel> resetPasswordModel =
        await resetPasswordRepoContract.resetPassword(email, newPassword);
    return resetPasswordModel;
  }
}
