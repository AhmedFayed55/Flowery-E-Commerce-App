import 'package:flowers_ecommerce_app/features/categories/data/models/metadata_dto.dart';
import 'package:flowers_ecommerce_app/features/categories/data/models/products_dto.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/product_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDTO? metadata;
  @JsonKey(name: "products")
  final List<ProductsDTO>? products;

  ProductResponse ({
    this.message,
    this.metadata,
    this.products,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductResponseToJson(this);
  }

  ProductResponseEntity toEntity() {
    return ProductResponseEntity(
        message: message,
        metadata: metadata?.toEntity(),
        products:products?.map((product) => product.toEntity(),).toList()
    );
  }
}
