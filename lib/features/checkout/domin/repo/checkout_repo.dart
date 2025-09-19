import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/entities/address.dart';

abstract interface class CheckoutRepo {
  Future<ApiResult<List<Address>>> getLoggedUserAddresses();
}
