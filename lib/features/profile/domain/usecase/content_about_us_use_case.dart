import 'package:flowers_ecommerce_app/features/profile/domain/entities/about_us_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/repo/contect_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAboutUsUseCase {
  final GetContectRepo _contectRepo;

  GetAboutUsUseCase(this._contectRepo);
  Future<List<AboutUsEntity>> call() async {
    return await _contectRepo.getAboutUs();
  }
}
