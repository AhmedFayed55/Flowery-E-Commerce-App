import 'package:flowers_ecommerce_app/features/search/data/models/metadata_dto.dart';
import 'package:flowers_ecommerce_app/features/search/data/models/products_dto.dart';

class SearchResponseEntity {
  final String? message;

  final MetadataDto? metadataDto;

  final List<ProductsDto>? productsDto;

  const SearchResponseEntity({
    this.message,
    this.metadataDto,
    this.productsDto,
  });
}
