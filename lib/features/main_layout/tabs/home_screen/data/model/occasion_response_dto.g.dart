// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasion_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccasionResponseDto _$OccasionResponseDtoFromJson(Map<String, dynamic> json) =>
    OccasionResponseDto(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isSuperAdmin: json['isSuperAdmin'] as bool?,
    );

Map<String, dynamic> _$OccasionResponseDtoToJson(
  OccasionResponseDto instance,
) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'isSuperAdmin': instance.isSuperAdmin,
};
