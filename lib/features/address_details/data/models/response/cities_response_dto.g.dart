// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesResponseDto _$CitiesResponseDtoFromJson(Map<String, dynamic> json) =>
    CitiesResponseDto(
      data: (json['data'] as List<dynamic>?)
          ?.map(
            (e) => CitiesDataResponseDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$CitiesResponseDtoToJson(CitiesResponseDto instance) =>
    <String, dynamic>{'data': instance.data};
