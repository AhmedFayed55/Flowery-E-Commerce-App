import 'package:flowers_ecommerce_app/features/search/domain/entity/products_dto_entity.dart';

class SearchState {
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final bool initial;
  final String? errorMessage;
  final List<ProductsDtoEntity> productsDtoEntity;

  SearchState({
    this.isSuccess = false,
    this.isError = false,
    this.isLoading = false,
    this.initial = false,
    this.errorMessage,
    this.productsDtoEntity = const [],
  });

  SearchState copyWith({
    bool? isLoading,
    bool? isError,
    bool? isSuccess,
    bool? initial,
    String? errorMessage,
    List<ProductsDtoEntity>? productsDtoEntity,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      initial: initial ?? this.initial,
      errorMessage: errorMessage ?? this.errorMessage,
      productsDtoEntity: productsDtoEntity ?? this.productsDtoEntity,
    );
  }
}
