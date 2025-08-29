import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/category_entity.dart';
part 'category_response_dto.g.dart';

@JsonSerializable()
class CategoryResponseDto extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final bool? isSuperAdmin;

  const CategoryResponseDto({
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

  CategoryEntity toDomain() {
    return CategoryEntity(id ?? '', name ?? '', image ?? '');
  }

  @override
  List<Object?> get props => [id, name, image];
}
