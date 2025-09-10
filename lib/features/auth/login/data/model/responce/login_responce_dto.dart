import 'package:flowers_ecommerce_app/features/auth/login/data/model/responce/user_model_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_responce_dto.g.dart';

@JsonSerializable()
class LoginResponceDto {
  final String message;
  final UserModelDto user;
  final String token;

  LoginResponceDto({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponceDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponceDtoToJson(this);
}
