import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/entites/product_entity.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/repo/products_detalis_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSpecificProductUsecase {
  ProductsDetalisRepo productsDetalisRepo;
  GetSpecificProductUsecase(this.productsDetalisRepo);

  Future<ApiResult<ProductEntity>> invok(String id) =>
      productsDetalisRepo.getProductsDetalis(id);
}
