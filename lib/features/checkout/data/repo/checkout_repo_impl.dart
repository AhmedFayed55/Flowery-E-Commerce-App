import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/checkout/data/sources/checkout_remote_ds.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/entities/address.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/repo/checkout_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Injectable(as: CheckoutRepo)
class CheckoutRepoImpl implements CheckoutRepo {
  final CheckoutRemoteDS _checkoutRemoteDS;
  final InternetConnectionChecker _internetConnectionChecker;

  CheckoutRepoImpl(this._checkoutRemoteDS, this._internetConnectionChecker);

  @override
  Future<ApiResult<List<Address>>> getLoggedUserAddresses() async {
    final bool isConnected = await _internetConnectionChecker.hasConnection;
    if (!isConnected) {
      return ApiErrorResult(
        failure: Failure(errorMessage: 'No Internet Connection'),
      );
    }

    try {
      final result = await _checkoutRemoteDS.getLoggedUserAddresses();
      return ApiSuccessResult(
        data: result.addresses!.map((e) => e.toEntity()).toList(),
      );
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    }
  }
}
