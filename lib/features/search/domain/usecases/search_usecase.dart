import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/search/domain/entity/search_response_entity.dart';
import 'package:flowers_ecommerce_app/features/search/domain/repository/search_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchUseCase {
  SearchRepo searchRepo;

  SearchUseCase({required this.searchRepo});

  Future<ApiResult<SearchResponseEntity>> call(String keyword) async {
    var result = await searchRepo.search(keyword);
    return result;
  }
}
