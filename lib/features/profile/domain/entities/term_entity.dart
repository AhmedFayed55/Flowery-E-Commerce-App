import 'package:flowers_ecommerce_app/features/profile/domain/entities/term_style_entity.dart';

class TermEntity {
  final String section;
  final List<String> content;
  final String? title;
  final TermStyleEntity style;

  TermEntity({
    required this.section,
    required this.content,
    this.title,
    required this.style,
  });
}
