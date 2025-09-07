import 'dart:ui';
import 'package:flowers_ecommerce_app/core/constants/constants.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/about_us_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/term_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/user_entity.dart';

class ProfileSettingState {
  final bool isLoadding;
  final bool enableNotification;
  final String localizationCode;
  final String errorMessage;
  final UserProfileEntity? userProfileEntity;
  final List<TermEntity> terms;
  final List<AboutUsEntity> aboutUsList;
  final String version;
  final String buildNumber;
  final Locale local;

  const ProfileSettingState({
    this.local = const Locale(Constants.enKey),
    this.buildNumber = '0',
    this.version = '0',
    this.aboutUsList = const [],
    this.terms = const [],
    this.localizationCode = Constants.enKey,
    this.isLoadding = false,
    this.enableNotification = true,
    this.errorMessage = '',
    this.userProfileEntity,
  });
  ProfileSettingState copyWith({
    Locale? local,
    String? version,
    String? buildNumber,
    List<AboutUsEntity>? aboutUsList,
    bool? isLoaddingTerms,
    String? errorTerms,
    List<TermEntity>? terms,
    bool? enableNotification,
    String? localizationCode,
    bool? isLoadding,
    String? errorMessage,
    UserProfileEntity? userProfileEntity,
  }) {
    return ProfileSettingState(
      local: local ?? this.local,
      version: version ?? this.version,
      buildNumber: buildNumber ?? this.buildNumber,
      aboutUsList: aboutUsList ?? this.aboutUsList,
      terms: terms ?? this.terms,
      enableNotification: enableNotification ?? this.enableNotification,
      localizationCode: localizationCode ?? this.localizationCode,
      isLoadding: isLoadding ?? this.isLoadding,
      errorMessage: errorMessage ?? this.errorMessage,
      userProfileEntity: userProfileEntity ?? this.userProfileEntity,
    );
  }
}
