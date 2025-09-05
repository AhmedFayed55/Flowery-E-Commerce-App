import 'package:equatable/equatable.dart';

import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/user_entitiy.dart';

// ignore: must_be_immutable
class LoginState extends Equatable {
  bool rememberMe = false;
  bool isLoadding = false;
  UserLoginEntity? userEntity;
  String errorMessage = '';

  LoginState({
    this.rememberMe = false,
    this.isLoadding = false,
    this.userEntity,
    this.errorMessage = '', 
  });

  LoginState copyWith({
    bool? rememberMe,
    bool? isLoadding,
    UserLoginEntity? userEntity,
    String? errorMessage,
  }) {
    return LoginState(
      rememberMe: rememberMe ?? this.rememberMe,
      errorMessage: errorMessage ?? this.errorMessage,
      userEntity: userEntity ?? this.userEntity,
      isLoadding: isLoadding ?? this.isLoadding,
    );
  }

  @override
  List<Object?> get props => [rememberMe, isLoadding, userEntity, errorMessage];
}
