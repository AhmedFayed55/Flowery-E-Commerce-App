import 'package:equatable/equatable.dart';

class LoginRequestEntity extends Equatable {
  final String email;
  final String password;

  LoginRequestEntity({required this.email, required this.password});
  
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
}
