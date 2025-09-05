import 'dart:convert';
import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/core/utils/app_images.dart';
import 'package:flowers_ecommerce_app/features/profile/data/local_data_source/get_content_ds.dart';
import 'package:flowers_ecommerce_app/features/profile/data/model/about_us_model_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/data/model/term_model_dto.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetContentDataSource)
class GetContentDataSourceImp implements GetContentDataSource {
  @override
  Future<List<TermModelDto>> loadTerms() async {
    final jsonString = await rootBundle.loadString(
      AppImages.termsPath,
    );
    final jsonData = json.decode(jsonString);

    final List<dynamic> termsListJson = jsonData[Constants.termsKey];
    return termsListJson.map((e) => TermModelDto.fromJson(e)).toList();
  }

  @override
  Future<List<AbotUsModelDto>> loadAbotUs() async {
    final jsonString = await rootBundle.loadString(
      AppImages.aboutUsPath,
    );
    final jsonData = json.decode(jsonString);
    final List<dynamic> aboutUsListJson = jsonData[Constants.aboutUsKey];
    return aboutUsListJson.map((e) => AbotUsModelDto.fromJson(e)).toList();
  }
}
