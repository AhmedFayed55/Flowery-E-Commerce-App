import 'package:flowers_ecommerce_app/features/categories/domain/entity/products_entity.dart';

import 'metadata_entity.dart';

class ProductResponseEntity {
  final String? message;
  final MetadataEntity? metadata;
  final List<ProductsEntity>? products;

  ProductResponseEntity({this.message, this.metadata, this.products});
}
