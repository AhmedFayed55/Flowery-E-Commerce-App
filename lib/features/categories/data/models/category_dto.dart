import 'package:flowers_ecommerce_app/features/categories/domain/entity/category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoriesDTO {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "isSuperAdmin")
  final bool? isSuperAdmin;
  @JsonKey(name: "productsCount")
  final int? productsCount;

  CategoriesDTO({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.isSuperAdmin,
    this.productsCount,
  });

  factory CategoriesDTO.fromJson(Map<String, dynamic> json) {
    return _$CategoriesDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesDTOToJson(this);
  }

  CategoryModel toCategoryModel() => CategoryModel(
    id: id ?? "",
    image: image ?? "",
    name: name ?? "",
    slug: slug ?? "",
  );
}
