// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaResponseDto _$AreaResponseDtoFromJson(Map<String, dynamic> json) =>
    AreaResponseDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AreaDataResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AreaResponseDtoToJson(AreaResponseDto instance) =>
    <String, dynamic>{'data': instance.data};
