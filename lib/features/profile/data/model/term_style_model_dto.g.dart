// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_style_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermStyleModelDto _$TermStyleModelDtoFromJson(Map<String, dynamic> json) =>
    TermStyleModelDto(
      fontSize: (json['fontSize'] as num?)?.toDouble() ?? 14.0,
      fontWeight: json['fontWeight'] as String? ?? 'bold',
      color: json['color'] as String? ?? '#000000',
      textAlign: json['textAlign'] as Map<String, dynamic>? ?? {'en': 'center'},
      backgroundColor: json['backgroundColor'] as String? ?? '#FFFFFF',
    );

Map<String, dynamic> _$TermStyleModelDtoToJson(TermStyleModelDto instance) =>
    <String, dynamic>{
      'fontSize': instance.fontSize,
      'fontWeight': instance.fontWeight,
      'color': instance.color,
      'textAlign': instance.textAlign,
      'backgroundColor': instance.backgroundColor,
    };
