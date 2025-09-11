import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/products_entity.dart';

class OccasionsState extends Equatable{
  final bool isLoadingGetOccasion;

  final String? errorGetOccasion;

  final String? successGetOccasion;

  final List<ProductsEntity> products;

  const OccasionsState({
    this.isLoadingGetOccasion = false,
    this.errorGetOccasion,
    this.successGetOccasion,
    this.products = const [],
  });

  OccasionsState copyWith({
    bool? isLoadingGetOccasion,
    String? errorGetOccasion,
    String? successGetOccasion,
    List<ProductsEntity>? products,
  }) {
    return OccasionsState(
      isLoadingGetOccasion: isLoadingGetOccasion ?? this.isLoadingGetOccasion,
      errorGetOccasion: errorGetOccasion ?? this.errorGetOccasion,
      successGetOccasion: successGetOccasion ?? this.successGetOccasion,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
    isLoadingGetOccasion,
    errorGetOccasion,
    successGetOccasion,
    products,
  ];
}