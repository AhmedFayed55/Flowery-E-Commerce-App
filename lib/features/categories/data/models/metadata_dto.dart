import 'package:json_annotation/json_annotation.dart';


part 'metadata_dto.g.dart';
@JsonSerializable()
class MetadataDTO {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "totalItems")
  final int? totalItems;

  MetadataDTO ({
    this.currentPage,
    this.limit,
    this.totalPages,
    this.totalItems,
  });

  factory MetadataDTO.fromJson(Map<String, dynamic> json) {
    return _$MetadataDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataDTOToJson(this);
  }
}