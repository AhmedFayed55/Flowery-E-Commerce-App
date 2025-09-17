import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/user_cart.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserCartsUsecase {
  final CartRepo cartRepo;
  GetUserCartsUsecase(this.cartRepo);
  Future<ApiResult<UserCart>> invok() async {
    return await cartRepo.getUserCart();
  }
}
