sealed class ForgetPasswordEvent {}

class GetForgetPasswordEvent extends ForgetPasswordEvent {
  final String email;

  GetForgetPasswordEvent({required this.email});
}

class GetEmailVerificationEvent extends ForgetPasswordEvent {
  final String code;

  GetEmailVerificationEvent({required this.code});
}

class GetResetPasswordEvent extends ForgetPasswordEvent {
  final String email;
  final String newPassword;

  GetResetPasswordEvent({required this.email, required this.newPassword});
}

class GetIsResendOtpEvent extends ForgetPasswordEvent {
  final String email;

  GetIsResendOtpEvent({required this.email});
}
