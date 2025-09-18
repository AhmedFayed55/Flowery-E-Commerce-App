import 'package:flowers_ecommerce_app/features/checkout/data/model/get_user_addreses_respone/get_user_addreses_respone.dart';

abstract interface class CheckoutRemoteDS {
  Future<GetUserAddresesRespone> getLoggedUserAddresses();
}
