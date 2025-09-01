import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/login_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/user_entitiy.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/repositories/login_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUseCase {
  final LoginRepo _loginRepo;
  LoginUseCase(this._loginRepo);
  Future<ApiResult<UserEntity>> call(LoginRequestEntity loginRequestEntity) {
    return _loginRepo.loginRepo(loginRequestEntity);
  }
}
