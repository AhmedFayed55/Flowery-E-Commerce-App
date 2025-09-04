import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/datasources/remote/forget_pass_remote_datasource.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/forget_pass_model.dart';
import 'package:flowers_ecommerce_app/features/auth/forget_password/domain/repository/forget_pass_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepoContract)
class ForgetPasswordRepoImpl implements ForgetPasswordRepoContract {
  ForgetPasswordRemoteDataSource forgetPasswordRemoteDataSource;

  ForgetPasswordRepoImpl({required this.forgetPasswordRemoteDataSource});

  @override
  Future<ApiResult<ForgetPasswordModel>> forgetPassword(String email) async {
    ApiResult<ForgetPasswordModel> forgetPasswordModel =
        await forgetPasswordRemoteDataSource.forgetPassword(email);
    return forgetPasswordModel;
  }
}
