part of 'product_details_cubit.dart';

sealed class ProductsDetalisEvent extends Equatable {
  const ProductsDetalisEvent();

  @override
  List<Object> get props => [];
}

class GetSpecificProductEvent extends ProductsDetalisEvent {
  final String productId;

  const GetSpecificProductEvent({required this.productId});
}
