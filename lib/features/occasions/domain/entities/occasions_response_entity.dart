import 'package:flowers_ecommerce_app/features/occasions/domain/entities/products_entity.dart';

import 'metadata_entity.dart';

class OccasionsResponseEntity {
  final String? message;
  final MetadataEntity? metadata;
  final List<ProductsEntity>? products;

  OccasionsResponseEntity ({
    this.message,
    this.metadata,
    this.products,
  });

}