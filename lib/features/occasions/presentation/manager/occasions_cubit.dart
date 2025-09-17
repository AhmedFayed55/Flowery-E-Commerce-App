import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/occasions_response_entity.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/products_entity.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/use_cases/get_specific_occasions_use_case.dart';
import 'package:flowers_ecommerce_app/features/occasions/presentation/manager/occasions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'occasions_event.dart';

@injectable
class OccasionsCubit extends Cubit<OccasionsState> {
  OccasionsCubit(this.getSpecificOccasionsUseCase)
    : super(const OccasionsState());
  final GetSpecificOccasionsUseCase getSpecificOccasionsUseCase;

  Map<String, List<ProductsEntity>> cachedOccasions = {};

  doIntent(OccasionsEvent event, String id) {
    switch (event) {
      case LoadOccasionsEvent():
        _loadOccasions(id);
        break;
    }
  }

  Future<void> _loadOccasions(String id) async {
    if (cachedOccasions.containsKey(id)) {
      emit(state.copyWith(products: cachedOccasions[id]!));
      return;
    }

    emit(state.copyWith(isLoadingGetOccasion: true));
    var result = await getSpecificOccasionsUseCase.invoke();
    switch (result) {
      case ApiSuccessResult<OccasionsResponseEntity>():
        final filteredProducts = _productsByOccasion(id, result.data.products!);
        cachedOccasions[id] = filteredProducts;
        emit(
          state.copyWith(
            isLoadingGetOccasion: false,
            products: filteredProducts,
          ),
        );
        break;
      case ApiErrorResult<OccasionsResponseEntity>():
        emit(
          state.copyWith(
            isLoadingGetOccasion: false,
            errorGetOccasion: result.failure.errorMessage,
          ),
        );
        break;
    }
  }

  List<ProductsEntity> _productsByOccasion(
    String id,
    List<ProductsEntity> products,
  ) {
    return products.where((product) => product.occasion == id).toList();
  }
}
