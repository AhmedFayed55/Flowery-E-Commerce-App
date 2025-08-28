import 'package:flowers_ecommerce_app/features/occasions/data/models/products_dto.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/occasions_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'metadata_dto.dart';

part 'occasions_response_dto.g.dart';

@JsonSerializable()
class OccasionsResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "products")
  final List<ProductsDto>? products;

  OccasionsResponseDto ({
    this.message,
    this.metadata,
    this.products,
  });

  factory OccasionsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$OccasionsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionsResponseDtoToJson(this);
  }

  OccasionsResponseEntity toEntity() => OccasionsResponseEntity(
    message: message,
    metadata: metadata?.toEntity(),
    products: products?.map((product) => product.toEntity()).toList(),
  );
}






