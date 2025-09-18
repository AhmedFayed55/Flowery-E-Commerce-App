import 'package:flowers_ecommerce_app/features/search/domain/entity/meatadata_dto_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata_dto.g.dart';

@JsonSerializable()
class MetadataDto {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "totalItems")
  final int? totalItems;

  MetadataDto({this.currentPage, this.totalPages, this.limit, this.totalItems});

  factory MetadataDto.fromJson(Map<String, dynamic> json) {
    return _$MetadataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataDtoToJson(this);
  }

  MetadataDtoEntity toEntity() {
    return MetadataDtoEntity(
      limit: limit,
      totalPages: totalPages,
      currentPage: currentPage,
      totalItems: totalItems,
    );
  }
}
