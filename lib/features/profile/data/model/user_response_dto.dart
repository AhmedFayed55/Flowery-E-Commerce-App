import 'package:flowers_ecommerce_app/features/auth/login/data/model/responce/user_model_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_response_dto.g.dart';

@JsonSerializable()
class UserResponseDto {
  final String message;
  final UserModelDto user;

  UserResponseDto({required this.message, required this.user});

  factory UserResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseDtoToJson(this);
}
