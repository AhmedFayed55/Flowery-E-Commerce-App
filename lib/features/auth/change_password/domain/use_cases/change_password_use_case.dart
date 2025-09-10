import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:injectable/injectable.dart';

import '../entities/change_password_request_entity.dart';
import '../entities/change_password_response_entity.dart';
import '../repositories/change_password_repo.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepo _repo;
  const ChangePasswordUseCase(this._repo);

  Future<ApiResult<ChangePasswordResponseEntity>> invoke(
    ChangePasswordRequestEntity request,
  ) => _repo.changePassword(request);
}
