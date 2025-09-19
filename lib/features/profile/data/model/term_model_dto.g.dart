// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermModelDto _$TermModelDtoFromJson(Map<String, dynamic> json) => TermModelDto(
  section: json['section'] as String,
  content: json['content'] as Map<String, dynamic>,
  title: json['title'] as Map<String, dynamic>?,
  style: TermStyleModelDto.fromJson(json['style'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TermModelDtoToJson(TermModelDto instance) =>
    <String, dynamic>{
      'section': instance.section,
      'content': instance.content,
      'title': instance.title,
      'style': instance.style.toJson(),
    };
