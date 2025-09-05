import 'package:flowers_ecommerce_app/features/profile/domain/entities/about_us_style_entity.dart';

class AboutUsEntity {
  final String section;
  final List<String> content;
  final String? title;
  final AboutUsStyleEntity style;

  AboutUsEntity({required this.section, required this.content, this.title, required this.style});
}
