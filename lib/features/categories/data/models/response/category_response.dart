import 'package:flowers_ecommerce_app/features/categories/data/models/categories_dto.dart';
import 'package:flowers_ecommerce_app/features/categories/data/models/metadata_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDTO? metadata;
  @JsonKey(name: "categories")
  final List<CategoriesDTO>? categories;

  CategoryResponse ({
    this.message,
    this.metadata,
    this.categories,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return _$CategoryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryResponseToJson(this);
  }
}




