import 'package:equatable/equatable.dart';

class ChangePasswordResponseEntity extends Equatable {
  const ChangePasswordResponseEntity({this.message, this.token});

  final String? message;
  final String? token;

  @override
  List<Object?> get props => [message, token];
}
