import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/features/profile/data/model/term_style_model_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/term_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'term_model_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TermModelDto {
  final String section;
  final Map<String, dynamic> content;
  final Map<String, dynamic>? title;
  final TermStyleModelDto style;

  TermModelDto({
    required this.section,
    required this.content,
    this.title,
    required this.style,
  });

  factory TermModelDto.fromJson(Map<String, dynamic> json) =>
      _$TermModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TermModelDtoToJson(this);

  TermEntity toDomain(String languageCode) {
    final rawContent = content[languageCode] ?? content[Constants.enKey] ?? '';
    final rawTitle = title != null
        ? (title![languageCode] ?? title![Constants.enKey] ?? '')
        : '';

    return TermEntity(
      section: section,
      content: [rawContent.toString()],
      style: style.toDomain(languageCode),
      title: rawTitle,
    );
  }
}
