
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class TokenService {
  final FlutterSecureStorage _prefs;
  final SharedPreferences _sharedPreferences;

  TokenService({
    required FlutterSecureStorage prefs,
    required SharedPreferences sharedPreferences,
  }) : _prefs = prefs,
      _sharedPreferences = sharedPreferences;

  bool get isTokenSaved =>
      _sharedPreferences.getBool(AppConstants.isTokenSaved) ?? false;

  Future<void> deleteToken() async {
    await _sharedPreferences.setBool(AppConstants.isTokenSaved, false);
    await _prefs.delete(key: AppConstants.token);
  }

  Future<String?> getToken() async {
    if (!isTokenSaved) return null;
    return _prefs.read(key: AppConstants.token);
  }

  Future<void> saveToken(String token) async {
    await _sharedPreferences.setBool(AppConstants.isTokenSaved, true);
    await _prefs.write(key: AppConstants.token, value: token);
  }
}
