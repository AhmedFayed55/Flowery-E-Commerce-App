import 'package:flowers_ecommerce_app/features/profile/domain/entities/term_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/repo/contect_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTermsUseCase {
  final GetContectRepo _contectRepo;
  GetTermsUseCase(this._contectRepo);
  Future<List<TermEntity>> call() async {
    return await _contectRepo.getTerms();
  }
}
