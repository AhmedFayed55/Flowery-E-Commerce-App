import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/checkout/data/model/get_user_addreses_respone/get_user_addreses_respone.dart';
import 'package:flowers_ecommerce_app/features/checkout/data/sources/checkout_remote_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CheckoutRemoteDS)
class CheckoutRemoteDsImpl implements CheckoutRemoteDS {
  final ApiServices _apiServices;

  CheckoutRemoteDsImpl(this._apiServices);
  @override
  Future<GetUserAddresesRespone> getLoggedUserAddresses()async {
  return await _apiServices.getLoggedUserAddresses();
  }

}