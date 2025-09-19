import 'package:flowers_ecommerce_app/features/categories/domain/entity/metadata_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata_dto.g.dart';

@JsonSerializable()
class MetadataDTO {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "totalItems")
  final int? totalItems;

  MetadataDTO({this.currentPage, this.totalPages, this.limit, this.totalItems});

  factory MetadataDTO.fromJson(Map<String, dynamic> json) {
    return _$MetadataDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataDTOToJson(this);
  }

  MetadataEntity toEntity() {
    return MetadataEntity(
      currentPage: currentPage,
      limit: limit,
      totalItems: totalItems,
      totalPages: totalPages,
    );
  }
}
