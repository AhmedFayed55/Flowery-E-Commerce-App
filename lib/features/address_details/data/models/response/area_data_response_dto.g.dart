// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaDataResponseDto _$AreaDataResponseDtoFromJson(Map<String, dynamic> json) =>
    AreaDataResponseDto(
      id: json['id'] as String?,
      governorateId: json['governorate_id'] as String?,
      cityNameAr: json['city_name_ar'] as String?,
      cityNameEn: json['city_name_en'] as String?,
    );

Map<String, dynamic> _$AreaDataResponseDtoToJson(
  AreaDataResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'governorate_id': instance.governorateId,
  'city_name_ar': instance.cityNameAr,
  'city_name_en': instance.cityNameEn,
};
