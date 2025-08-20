import 'package:flowers_ecommerce_app/core/utils/json_serializable_constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

@JsonSerializable()
class RegisterRespone {
  @JsonKey(name: JsonSerializableConstants.message)
  String? message;
  @JsonKey(name: JsonSerializableConstants.user)
  User? user;
  @JsonKey(name: JsonSerializableConstants.token)
  String? token;

  RegisterRespone({this.message, this.user, this.token});

  factory RegisterRespone.fromJson(Map<String, dynamic> json) {
    return RegisterRespone(
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
}
