sealed class ProfileSettingEvent {}

class SumitProflieSetting extends ProfileSettingEvent {}

class ToggleNotificationEvent extends ProfileSettingEvent {
  final bool enable;
  ToggleNotificationEvent(this.enable);
}

class ChangeLanguageEvent extends ProfileSettingEvent {
  final String languageCode;
  ChangeLanguageEvent(this.languageCode);
}

class LoadTermsEvent extends ProfileSettingEvent {}
class LoadAboutUsEvent extends ProfileSettingEvent{}
