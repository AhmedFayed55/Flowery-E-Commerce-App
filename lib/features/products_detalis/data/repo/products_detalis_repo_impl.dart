import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/data/source/products_detalis_ds.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/entites/product_entity.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/repo/products_detalis_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Injectable(as: ProductsDetalisRepo)
class ProductsDetalisRepoImpl implements ProductsDetalisRepo {
  final ProductsDetalisDs _productsDetalisDs;

  ProductsDetalisRepoImpl(this._productsDetalisDs);

  @override
  Future<ApiResult<ProductEntity>> getProductsDetalis(String id) async {
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;

    if (!isConnected) {
      return ApiErrorResult(
        failure: Failure(errorMessage: AppConstants.noInternet),
      );
    }
    try {
      var respone = await _productsDetalisDs.getSpecificProduct(id);
      return ApiSuccessResult(data: respone.product!.toEntity());
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: Failure(errorMessage: e.response!.data[AppConstants.message]),
      );
    }catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }
}
