import 'package:json_annotation/json_annotation.dart';

part 'area_data_response_dto.g.dart';

@JsonSerializable()
class AreaDataResponseDto {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "governorate_id")
  final String? governorateId;
  @JsonKey(name: "city_name_ar")
  final String? cityNameAr;
  @JsonKey(name: "city_name_en")
  final String? cityNameEn;

  AreaDataResponseDto({
    this.id,
    this.governorateId,
    this.cityNameAr,
    this.cityNameEn,
  });

  factory AreaDataResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AreaDataResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AreaDataResponseDtoToJson(this);
  }
}
