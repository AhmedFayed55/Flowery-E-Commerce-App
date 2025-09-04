import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_body.dart';

sealed class RegisterEvent {}

class RegisterSubmitEvent extends RegisterEvent {
  final RegisterBody registerBody;
  RegisterSubmitEvent(this.registerBody);
}
