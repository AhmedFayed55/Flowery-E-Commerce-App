import 'package:flowers_ecommerce_app/features/profile/data/model/about_us_model_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/data/model/term_model_dto.dart';

abstract class GetContentDataSource {
  Future<List<TermModelDto>> loadTerms();
  Future<List<AbotUsModelDto>> loadAbotUs();
}
