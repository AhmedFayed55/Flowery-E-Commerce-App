import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/user_entitiy.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/repo/get_user_data_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetUserDataUseCase {
  final GetUserDataRepo _getUserDataRepo;
  const GetUserDataUseCase(this._getUserDataRepo);
  Future<ApiResult<UserLoginEntity>> call() {
    return _getUserDataRepo.getUserDataRepo();
  }
}
