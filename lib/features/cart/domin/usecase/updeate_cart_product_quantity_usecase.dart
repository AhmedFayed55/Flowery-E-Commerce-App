
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_cart_prouduct_quantity_body.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_proudact_quantity_respone/updeate_proudact_quantity_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdeateCartProductQuantityUsecase {
  CartRepo cartRepo;
  UpdeateCartProductQuantityUsecase(this.cartRepo);
  Future<ApiResult<UpdeateProudactQuantityRespone>> invok(String id, UpdeateCartProuductQuantityBody quantity) async {
    return await cartRepo.updeateCartProudctQuantity(id, quantity);
  }
  
}