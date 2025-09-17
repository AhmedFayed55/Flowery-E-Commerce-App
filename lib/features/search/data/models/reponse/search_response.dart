import 'package:flowers_ecommerce_app/features/search/data/models/metadata_dto.dart';
import 'package:flowers_ecommerce_app/features/search/data/models/products_dto.dart';
import 'package:flowers_ecommerce_app/features/search/domain/entity/search_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadataDto;
  @JsonKey(name: "products")
  final List<ProductsDto>? productsDto;

  SearchResponse({this.message, this.metadataDto, this.productsDto});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SearchResponseToJson(this);
  }

  SearchResponseEntity toEntity() {
    return SearchResponseEntity(
      message: message,
      metadataDtoEntity: metadataDto?.toEntity(),
      productsDtoEntity: productsDto
          ?.map((product) => product.toEntity())
          .toList(),
    );
  }
}
