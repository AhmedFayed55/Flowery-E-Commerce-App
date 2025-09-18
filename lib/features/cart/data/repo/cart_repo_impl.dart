import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/cart/data/data_sources/cart_remote_data_sourse.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/delete_cart_item_respone/delete_cart_item_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_cart_prouduct_quantity_body.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_proudact_quantity_respone/updeate_proudact_quantity_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/user_cart.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartRemoteDataSourse _cartRemoteDataSourse;
  final InternetConnectionChecker _networkConnection;

  CartRepoImpl(this._cartRemoteDataSourse, this._networkConnection);

  @override
  Future<ApiResult<DeleteCartItemRespone>> deleteCartProudct(String id) async {
    final bool isConnected = await _networkConnection.hasConnection;

    if (!isConnected) {
      return ApiErrorResult(
        failure: Failure(errorMessage: AppConstants.noInternet),
      );
    }

    try {
      var respone = await _cartRemoteDataSourse.deleteCartProudct(id);
      return ApiSuccessResult(data: respone);
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: Failure(errorMessage: e.response!.data[AppConstants.error]),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<ApiResult<UserCart>> getUserCart() async {
    final bool isConnected = await _networkConnection.hasConnection;

    if (!isConnected) {
      return ApiErrorResult(
        failure: Failure(errorMessage: AppConstants.noInternet),
      );
    }

    try {
      var respone = await _cartRemoteDataSourse.getUserCart();
      return ApiSuccessResult(data: respone.toEntity());
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: Failure(errorMessage: e.response!.data[AppConstants.error]),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<ApiResult<UpdeateProudactQuantityRespone>> updeateCartProudctQuantity(
    String id,
    UpdeateCartProuductQuantityBody body,
  ) async {
    final bool isConnected = await _networkConnection.hasConnection;

    if (!isConnected) {
      return ApiErrorResult(
        failure: Failure(errorMessage: AppConstants.noInternet),
      );
    }
    try {
      var respone = await _cartRemoteDataSourse.updeateCartProudctQuantity(
        id,
        body,
      );
      return ApiSuccessResult(data: respone);
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: Failure(errorMessage: e.response!.data[AppConstants.error]),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }
}
