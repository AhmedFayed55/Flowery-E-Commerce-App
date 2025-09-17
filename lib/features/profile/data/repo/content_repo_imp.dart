import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/helpers/shared_pref.dart';
import 'package:flowers_ecommerce_app/features/profile/data/local_data_source/get_content_ds.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/about_us_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/term_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/repo/contect_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetContectRepo)
class GetContentRepoImp implements GetContectRepo {
  final GetContentDataSource _getContentDataSource;
  GetContentRepoImp(this._getContentDataSource);
  String _getCurrentLang() {
    return getIt<SharedPrefHelper>().getData(key: Constants.languageCode)
            as String? ??
        Constants.enKey;
  }

  @override
  Future<List<TermEntity>> getTerms() async {
    final dtos = await _getContentDataSource.loadTerms();
    var lang = _getCurrentLang();
    return dtos.map((dto) => dto.toDomain(lang)).toList();
  }

  @override
  Future<List<AboutUsEntity>> getAboutUs() async {
    final dtos = await _getContentDataSource.loadAbotUs();
    var lang = _getCurrentLang();

    return dtos.map((dto) => dto.toDomain(lang)).toList();
  }
}
