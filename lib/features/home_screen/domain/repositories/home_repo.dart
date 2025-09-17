import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/home_entity.dart';

abstract class HomeRepo {
  Future<ApiResult<HomeEntity>> homeRepo();
}
