import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/delete_cart_item_respone/delete_cart_item_respone.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteCartUsecase {
  final CartRepo cartRepo;
  DeleteCartUsecase(this.cartRepo);
  Future<ApiResult<DeleteCartItemRespone>> invok(String id) async {
    return await cartRepo.deleteCartProudct(id);
  }
}
