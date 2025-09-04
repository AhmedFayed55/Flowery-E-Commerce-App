import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/datasources/remote/reset_pass_remote_datasource.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/reset_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/repository/reset_pass_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRepoContract)
class ResetPasswordRepoImpl implements ResetPasswordRepoContract {
  ResetPasswordRemoteDataSource resetPasswordRemoteDataSource;

  ResetPasswordRepoImpl({required this.resetPasswordRemoteDataSource});

  @override
  Future<ApiResult<ResetPasswordModel>> resetPassword(
    String email,
    String newPassword,
  ) async {
    ApiResult<ResetPasswordModel> resetPasswordModel =
        await resetPasswordRemoteDataSource.resetPassword(email, newPassword);
    return resetPasswordModel;
  }
}
