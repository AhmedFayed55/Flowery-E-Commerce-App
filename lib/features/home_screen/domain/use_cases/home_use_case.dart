import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/home_entity.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeUseCase {
final HomeRepo _homeRepo;
HomeUseCase(this._homeRepo);
  Future<ApiResult<HomeEntity>> call(){
    return _homeRepo.homeRepo();
  }
}