import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/login_request_entity.dart';

sealed class LoginEvent {}

class SumitLoginEvent extends LoginEvent {
  LoginRequestEntity loginRequestEntity;
  bool isRemember;
  SumitLoginEvent({required this.loginRequestEntity, required this.isRemember});
}
class SumitAsGestEvent extends LoginEvent {}
