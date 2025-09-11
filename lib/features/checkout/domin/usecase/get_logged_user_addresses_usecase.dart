import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/entities/address.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/repo/checkout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedUserAddressesUsecase {
  CheckoutRepo checkoutRepo;

  GetLoggedUserAddressesUsecase(this.checkoutRepo);
  Future<ApiResult<List<Address>>> invok() =>
      checkoutRepo.getLoggedUserAddresses();
}
