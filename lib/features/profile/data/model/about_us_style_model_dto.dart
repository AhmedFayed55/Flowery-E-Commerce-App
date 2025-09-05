import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/about_us_style_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'about_us_style_model_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class AboutUsStyleModelDto {
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

  AboutUsStyleModelDto(
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.backgroundColor,
  );

  factory AboutUsStyleModelDto.fromJson(Map<String, dynamic> json) =>
      _$AboutUsStyleModelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AboutUsStyleModelDtoToJson(this);
  AboutUsStyleEntity toDomain(String languageCode) {
    return AboutUsStyleEntity(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      textAlign:( textAlign[languageCode] ?? textAlign[Constants.enKey]).toString(),
      backgroundColor: backgroundColor,
    );
  }
}
