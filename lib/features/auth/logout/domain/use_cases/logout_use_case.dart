import 'package:flowers_ecommerce_app/features/auth/logout/domain/repositories/logout_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/api_results.dart';
import '../entities/logout_response_entity.dart';

@injectable
class LogoutUseCase {
  final LogoutRepo _repo;

  LogoutUseCase(this._repo);

  Future<ApiResult<LogoutResponseEntity>> invoke() => _repo.logout();
}
