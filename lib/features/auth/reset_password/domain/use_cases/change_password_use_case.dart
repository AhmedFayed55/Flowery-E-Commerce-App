import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_request_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_response_entity.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/repositories/change_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepo _repo;
  ChangePasswordUseCase(this._repo);

  Future<ApiResult<ChangePasswordResponseEntity>> invoke(
    ChangePasswordRequestEntity request,
  ) => _repo.changePassword(request);
}
