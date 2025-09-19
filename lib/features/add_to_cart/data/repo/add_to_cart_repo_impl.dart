import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_body.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_respone.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/source/add_to_cart_ds.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/domin/repo/add_to_cart_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Injectable(as: AddToCartRepo)
class AddToCartRepoImpl implements AddToCartRepo {
  final AddToCartDS _addToCartDS;
  final InternetConnectionChecker _internetConnectionChecker;

  AddToCartRepoImpl(this._addToCartDS, this._internetConnectionChecker);

  @override
  Future<ApiResult<AddProductRespone>> addProductToCart(
    AddProductBody addProductBody,
  ) async {
    final bool isConnected = await _internetConnectionChecker.hasConnection;
    if (!isConnected) {
      return ApiErrorResult(
        failure: Failure(errorMessage: 'No Internet Connection'),
      );
    }

    try {
      final result = await _addToCartDS.addProductToCart(addProductBody);
      return ApiSuccessResult(data: result);
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: Failure(errorMessage: e.response!.data['error'].toString()),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }
}
