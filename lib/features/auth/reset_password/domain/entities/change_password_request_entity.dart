import 'package:equatable/equatable.dart';

class ChangePasswordRequestEntity extends Equatable{
  final String? password;
  final String? newPassword;

  ChangePasswordRequestEntity({required this.password,required this.newPassword});

  List<Object?> get props => [password,newPassword];
}