import 'package:json_annotation/json_annotation.dart';

import 'cities_data_response_dto.dart';

part 'cities_response_dto.g.dart';

@JsonSerializable()
class CitiesResponseDto {
  @JsonKey(name: "data")
  final List<CitiesDataResponseDto>? data;

  CitiesResponseDto({this.data});

  factory CitiesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CitiesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CitiesResponseDtoToJson(this);
  }
}
