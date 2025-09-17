import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/helpers/shared_pref.dart';
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  Locale selectedLocale = const Locale(Constants.enKey);

  Future<void> setSelectedLocale() async {
    final currentLocale =
        getIt<SharedPrefHelper>().getData(key: Constants.languageCode)
            as String?;

    selectedLocale = Locale(currentLocale ?? Constants.enKey);
    notifyListeners();
  }

  Future<void> changeLocale(String newLocale) async {
    if (selectedLocale.languageCode == newLocale) return;

    selectedLocale = Locale(newLocale);

    await getIt<SharedPrefHelper>().saveData(
      key: Constants.languageCode,
      val: newLocale,
    );

    notifyListeners(); // ده اللي بيعمل rebuild لحظي
  }

  bool isEn() => selectedLocale.languageCode == Constants.enKey;
}
