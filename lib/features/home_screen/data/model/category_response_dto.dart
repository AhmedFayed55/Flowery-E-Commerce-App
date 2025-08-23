import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part'category_response_dto.g.dart';
@JsonSerializable()
class CategoryResponseDto {
  @JsonKey(name: '_id')
  final String? id;
  final String ?name;
  final String ?slug;
  final String ?image;
  final String ?createdAt;
  final String ?updatedAt;
  final bool? isSuperAdmin;

  CategoryResponseDto({
     this.id,
     this.name,
     this.slug,
     this.image,
     this.createdAt,
     this.updatedAt,
    this.isSuperAdmin,
  });

  factory CategoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseDtoToJson(this);

  CategoryEntity toDomain(){
    return CategoryEntity(id??'', name??'', image??'');
  }
}