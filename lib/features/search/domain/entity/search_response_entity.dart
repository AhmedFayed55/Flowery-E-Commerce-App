import 'package:flowers_ecommerce_app/features/search/domain/entity/meatadata_dto_entity.dart';
import 'package:flowers_ecommerce_app/features/search/domain/entity/products_dto_entity.dart';

class SearchResponseEntity {
  final String? message;

  final MetadataDtoEntity? metadataDtoEntity;

  final List<ProductsDtoEntity>? productsDtoEntity;

  const SearchResponseEntity({
    this.message,
    this.metadataDtoEntity,
    this.productsDtoEntity,
  });
}
