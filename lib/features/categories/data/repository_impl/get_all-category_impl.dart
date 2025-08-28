import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/categories/data/datasources/remote/get_all_category_remote_datasource.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/category_model.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/repository/get_all_category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllCategoryRepositoryContract)
class GetAllCategoryRepositoryImpl implements GetAllCategoryRepositoryContract {
  GetAllCategoryRemoteDatasource getAllCategoryRemoteDatasource;

  GetAllCategoryRepositoryImpl({required this.getAllCategoryRemoteDatasource});

  @override
  Future<ApiResult<List<CategoryModel>>> getAllCategory() async {
    ApiResult<List<CategoryModel>> result = await getAllCategoryRemoteDatasource.getAllCategory();
    return result ;
  }
}
