import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/search/domain/entity/search_response_entity.dart';

abstract class SearchRepo {
  Future<ApiResult<SearchResponseEntity>> search(String keyword);
}
