import 'package:json_annotation/json_annotation.dart';

part 'cities_data_response_dto.g.dart';

@JsonSerializable()
class CitiesDataResponseDto {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "governorate_name_ar")
  final String? governorateNameAr;
  @JsonKey(name: "governorate_name_en")
  final String? governorateNameEn;

  CitiesDataResponseDto({
    this.id,
    this.governorateNameAr,
    this.governorateNameEn,
  });

  factory CitiesDataResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CitiesDataResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CitiesDataResponseDtoToJson(this);
  }
}
