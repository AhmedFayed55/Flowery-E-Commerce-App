import 'package:json_annotation/json_annotation.dart';

import 'area_data_response_dto.dart';

part 'area_response_dto.g.dart';

@JsonSerializable()
class AreaResponseDto {
  @JsonKey(name: "data")
  final List<AreaDataResponseDto>? data;

  AreaResponseDto({this.data});

  factory AreaResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AreaResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AreaResponseDtoToJson(this);
  }
}
