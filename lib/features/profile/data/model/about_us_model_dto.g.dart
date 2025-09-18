// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbotUsModelDto _$AbotUsModelDtoFromJson(Map<String, dynamic> json) =>
    AbotUsModelDto(
      json['section'] as String,
      json['content'] as Map<String, dynamic>,
      AboutUsStyleModelDto.fromJson(json['style'] as Map<String, dynamic>),
      json['title'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AbotUsModelDtoToJson(AbotUsModelDto instance) =>
    <String, dynamic>{
      'section': instance.section,
      'content': instance.content,
      'title': instance.title,
      'style': instance.style.toJson(),
    };
