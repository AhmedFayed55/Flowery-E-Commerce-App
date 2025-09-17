import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/features/profile/data/model/about_us_style_model_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/about_us_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'about_us_model_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class AbotUsModelDto {
  @JsonKey(name: "section")
  final String section;
  @JsonKey(name: "content")
  final Map<String, dynamic> content;
  @JsonKey(name: "title")
  final Map<String, dynamic>? title;
  @JsonKey(name: "style")
  final AboutUsStyleModelDto style;

  AbotUsModelDto(this.section, this.content, this.style, this.title);

  factory AbotUsModelDto.fromJson(Map<String, dynamic> json) =>
      _$AbotUsModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AbotUsModelDtoToJson(this);

  AboutUsEntity toDomain(String languageCode) {
    final rawContent = content[languageCode] ?? content[Constants.enKey] ?? '';
    final rawTitle = title != null
        ? (title![languageCode] ?? title![Constants.enKey] ?? '')
        : '';

    return AboutUsEntity(
      section: section,
      content: [rawContent.toString()],
      style: style.toDomain(languageCode),
      title: rawTitle,
    );
  }
}
