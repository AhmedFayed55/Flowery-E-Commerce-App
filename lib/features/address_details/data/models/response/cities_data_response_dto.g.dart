// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesDataResponseDto _$CitiesDataResponseDtoFromJson(
  Map<String, dynamic> json,
) => CitiesDataResponseDto(
  id: json['id'] as String?,
  governorateNameAr: json['governorate_name_ar'] as String?,
  governorateNameEn: json['governorate_name_en'] as String?,
);

Map<String, dynamic> _$CitiesDataResponseDtoToJson(
  CitiesDataResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'governorate_name_ar': instance.governorateNameAr,
  'governorate_name_en': instance.governorateNameEn,
};
