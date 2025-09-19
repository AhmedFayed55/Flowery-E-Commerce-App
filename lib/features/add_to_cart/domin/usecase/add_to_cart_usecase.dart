import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_body.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/data/model/add_product_respone.dart';
import 'package:flowers_ecommerce_app/features/add_to_cart/domin/repo/add_to_cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUsecase {
  final AddToCartRepo _addToCartRepo;

  AddToCartUsecase(this._addToCartRepo);

  Future<ApiResult<AddProductRespone>> invoke(
    AddProductBody addProductBody,
  ) async => await _addToCartRepo.addProductToCart(addProductBody);
}
