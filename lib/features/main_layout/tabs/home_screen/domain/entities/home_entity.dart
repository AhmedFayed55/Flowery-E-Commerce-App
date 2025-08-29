import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/features/main_layout/tabs/home_screen/domain/entities/product_entity.dart';

import 'best_saller_entity.dart';
import 'category_entity.dart';
import 'occasion_entity.dart';

class HomeEntity extends Equatable {
  final List<BestSallerEntity> bestSallerEntity;
  final List<ProductEntity> productEntity;
  final List<OccasionEntity> occasionEntity;
  final List<CategoryEntity> categoryEntity;

  const HomeEntity({
    required this.bestSallerEntity,
    required this.productEntity,
    required this.occasionEntity,
    required this.categoryEntity,
  });

  @override
  List<Object?> get props =>
       [bestSallerEntity, productEntity, occasionEntity, categoryEntity];
}
