import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/helpers/shared_pref.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/usecase/contect_terms_use_case.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/usecase/content_about_us_use_case.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/usecase/get_user_data_use_case.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/view_model/profile_setting_event.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/view_model/profile_setting_state.dart';

@injectable
class ProfileSettingCubit extends Cubit<ProfileSettingState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final GetAboutUsUseCase _getAboutUsUseCase;
  final GetTermsUseCase _getTermsUseCase;
  ProfileSettingCubit(
    this._getUserDataUseCase,
    this._getTermsUseCase,
    this._getAboutUsUseCase,
  ) : super(const ProfileSettingState());

  Future<void> doIntent(ProfileSettingEvent event) async {
    switch (event) {
      case SumitProflieSettingEvent():
        await _getUserData();
      case ChangeLanguageEvent():
        await _changeLanguage(event.languageCode);
      case ToggleNotificationEvent():
        await _toggleEnableNotitfication(event.enable);
      case LoadTermsEvent():
        await _loadTerms();
      case LoadAboutUsEvent():
        await _loadAboutUs();
    }
  }

  _getUserData() async {
    emit(state.copyWith(isLoadding: true));
    bool tokenSaved =
        getIt<SharedPrefHelper>().getData(key: AppConstants.isTokenSaved)
            as bool;
    if (tokenSaved == false) {
      emit(state.copyWith(isLoadding: false, userProfileEntity: null));
      return;
    }

    var result = await _getUserDataUseCase.call();
    await _loadSetting();
    await _loadTerms();
    await _loadAboutUs();
    await _applicationVersion();
    switch (result) {
      case ApiSuccessResult():
        return emit(
          state.copyWith(isLoadding: false, userProfileEntity: result.data),
        );
      case ApiErrorResult():
        return emit(
          state.copyWith(
            isLoadding: false,
            errorMessage: result.failure.errorMessage,
          ),
        );
    }
  }

  _loadTerms() async {
    final termsResult = await _getTermsUseCase();
    emit(state.copyWith(terms: termsResult));
  }

  _loadAboutUs() async {
    final aboutUsResult = await _getAboutUsUseCase();
    emit(state.copyWith(aboutUsList: aboutUsResult));
  }

  _loadSetting() async {
    var pref = getIt<SharedPrefHelper>();
    final notificationResult =
        pref.getData(key: Constants.enableNotification) ?? false;
    var localizationResult = pref.getData(key: Constants.languageCode);

    emit(
      state.copyWith(
        enableNotification: notificationResult as bool,
        localizationCode: localizationResult as String,
      ),
    );
  }

  _changeLanguage(String localizationCode) async {
    emit(
      state.copyWith(
        localizationCode: localizationCode,
        local: Locale(localizationCode),
      ),
    );
    await _saveLanguage(localizationCode);
    await _loadTerms();
    await _loadAboutUs();
  }

  _toggleEnableNotitfication(bool enable) {
    emit(state.copyWith(enableNotification: enable));
    _saveEnableNotification(enable);
  }

  Future<void> _applicationVersion() async {
    var info = await PackageInfo.fromPlatform();
    emit(state.copyWith(version: info.version, buildNumber: info.buildNumber));
  }

  //save setting data in sharedpref
  Future<void> _saveLanguage(String languageCode) async {
    await getIt<SharedPrefHelper>().saveData(
      key: Constants.languageCode,
      val: languageCode,
    );
  }

  Future<void> _saveEnableNotification(bool enable) async {
    await getIt<SharedPrefHelper>().saveData(
      key: Constants.enableNotification,
      val: enable,
    );
  }
}
