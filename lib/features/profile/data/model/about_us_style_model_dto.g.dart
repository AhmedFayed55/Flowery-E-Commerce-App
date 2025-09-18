// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_style_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutUsStyleModelDto _$AboutUsStyleModelDtoFromJson(
  Map<String, dynamic> json,
) => AboutUsStyleModelDto(
  (json['fontSize'] as num?)?.toDouble() ?? 14.0,
  json['fontWeight'] as String? ?? 'bold',
  json['color'] as String? ?? '#000000',
  json['textAlign'] as Map<String, dynamic>? ?? {'en': 'center'},
  json['backgroundColor'] as String? ?? '#FFFFFF',
);

Map<String, dynamic> _$AboutUsStyleModelDtoToJson(
  AboutUsStyleModelDto instance,
) => <String, dynamic>{
  'fontSize': instance.fontSize,
  'fontWeight': instance.fontWeight,
  'color': instance.color,
  'textAlign': instance.textAlign,
  'backgroundColor': instance.backgroundColor,
};
