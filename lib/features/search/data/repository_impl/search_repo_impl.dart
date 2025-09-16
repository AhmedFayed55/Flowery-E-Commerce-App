import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/search/data/datasources/remote/search_remote_ds.dart';
import 'package:flowers_ecommerce_app/features/search/domain/entity/search_response_entity.dart';
import 'package:flowers_ecommerce_app/features/search/domain/repository/search_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<ApiResult<SearchResponseEntity>> search(String? keyword) async {
    var result = await searchRemoteDataSource.search(keyword);
    return result;
  }
}
