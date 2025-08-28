part of 'product_details_cubit.dart';

class ProductDetailsState extends Equatable {
  bool isLoading = false;
  bool isSuccess = false;
  bool isFailure = false;
  String? errorMessage = '';
  ProductEntity? product ;

  ProductDetailsState(
    {this.isLoading = false ,
    this.isSuccess = false,
    this.isFailure =false,
    this.errorMessage,
    this.product }
  );

  ProductDetailsState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    ProductEntity? product
  }) {
    return ProductDetailsState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      errorMessage: errorMessage ?? this.errorMessage,
      product: product ?? this.product
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, isSuccess, isFailure, errorMessage, product];
}
