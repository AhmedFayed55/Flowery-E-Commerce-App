import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_respone.dart';

import 'user.dart';

class RegisterResponeDto {
  String? message;
  User? user;
  String? token;

  RegisterResponeDto({this.message, this.user, this.token});

  factory RegisterResponeDto.fromJson(Map<String, dynamic> json) {
    return RegisterResponeDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'user': user?.toJson(),
    'token': token,
  };

  RegisterRespone toEntity() => RegisterRespone(message!);
}
