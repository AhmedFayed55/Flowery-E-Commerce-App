import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_dto.g.dart';

@JsonSerializable()
class ChangePasswordRequestDto extends Equatable {
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "newPassword")
  final String? newPassword;

  const ChangePasswordRequestDto({this.password, this.newPassword});

  factory ChangePasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestDtoToJson(this);

  @override
  List<Object?> get props => [password, newPassword];
}
