import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/term_style_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'term_style_model_dto.g.dart';

@JsonSerializable()
class TermStyleModelDto {
  @JsonKey(defaultValue: 14.0)
  final double fontSize;
  @JsonKey(defaultValue: 'bold')
  final String fontWeight;
  @JsonKey(defaultValue: '#000000')
  final String color;
  @JsonKey(defaultValue: {'en': 'center'})
  final Map<String, dynamic> textAlign;
  @JsonKey(defaultValue: '#FFFFFF')
  final String backgroundColor;

  TermStyleModelDto({
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.textAlign,
    required this.backgroundColor,
  });

  factory TermStyleModelDto.fromJson(Map<String, dynamic> json) =>
      _$TermStyleModelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TermStyleModelDtoToJson(this);

  TermStyleEntity toDomain(String langCode) {
    return TermStyleEntity(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      textAlign: textAlign[langCode] ?? textAlign[Constants.enKey].toString(),
      backgroundColor: backgroundColor,
    );
  }
}
