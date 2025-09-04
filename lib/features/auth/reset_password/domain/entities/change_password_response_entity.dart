import 'package:equatable/equatable.dart';

class ChangePasswordResponseEntity extends Equatable{
  ChangePasswordResponseEntity({
      this.message, 
      this.token,});

  String? message;
  String? token;

  @override
  List<Object?> get props => [message,token];

}