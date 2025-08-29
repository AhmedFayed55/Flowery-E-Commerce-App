import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:injectable/injectable.dart';

import '../entities/home_entity.dart';
import '../repositories/home_repo.dart';
@injectable
class HomeUseCase {
final HomeRepo _homeRepo;
HomeUseCase(this._homeRepo);
  Future<ApiResult<HomeEntity>> call(){
    return _homeRepo.homeRepo();
  }
}