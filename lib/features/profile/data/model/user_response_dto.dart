import 'package:flowers_ecommerce_app/features/profile/data/model/user_model_profile_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_response_dto.g.dart';

@JsonSerializable()
class UserResponseProfileDto {
  final String message;
  final UserModelProfileDto user;

  UserResponseProfileDto({required this.message, required this.user});

  factory UserResponseProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserResponseProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseProfileDtoToJson(this);
}
