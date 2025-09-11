import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/entites/product_entity.dart';
import 'package:flowers_ecommerce_app/features/products_detalis/domin/usecase/get_specific_product_usecase.dart';
import 'package:injectable/injectable.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

@injectable
class ProductsDetalis extends Cubit<ProductDetailsState> {
  final GetSpecificProductUsecase getProductUsecase;

  ProductsDetalis(this.getProductUsecase) : super(const ProductDetailsState());
  void doIntent(GetSpecificProductEvent event) {
    switch (event) {
      case GetSpecificProductEvent():
        getSpecificProduct(event.productId);
        break;
    }
  }

  Future<void> getSpecificProduct(String productId) async {
    emit(state.copyWith(isLoading: true));
    final result = await getProductUsecase.invok(productId);
    switch (result) {
      case ApiSuccessResult():
        emit(
          state.copyWith(
            isSuccess: true,
            isLoading: false,
            product: result.data,
          ),
        );
        break;
      case ApiErrorResult():
        emit(
          state.copyWith(
            isSuccess: false,
            isFailure: true,
            errorMessage: result.failure.errorMessage,
            isLoading: false,
          ),
        );
        break;
    }
  }
}
