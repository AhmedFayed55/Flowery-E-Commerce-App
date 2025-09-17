import 'package:flowers_ecommerce_app/features/profile/domain/entities/about_us_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/term_entity.dart';

abstract class GetContectRepo {
  Future<List<AboutUsEntity>> getAboutUs();
  Future<List<TermEntity>> getTerms();
}
