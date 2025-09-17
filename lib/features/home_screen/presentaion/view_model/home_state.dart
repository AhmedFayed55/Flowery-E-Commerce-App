import 'package:equatable/equatable.dart';

import '../../domain/entities/best_saller_entity.dart';
import '../../domain/entities/home_entity.dart';

// ignore: must_be_immutable
class HomeState extends Equatable {
  bool isLoading = false;
  String errorMassage = '';
  HomeEntity? homeEntity;
  List<BestSallerEntity> products;

  HomeState({
    this.isLoading = false,
    this.errorMassage = '',
    this.homeEntity,
    this.products = const [],
  });

  HomeState copyWith({
    bool? isLoading,
    String? errorMassage,
    HomeEntity? homeEntity,
    List<BestSallerEntity>? products,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMassage: errorMassage ?? this.errorMassage,
      homeEntity: homeEntity ?? this.homeEntity,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMassage, homeEntity, products];
}
