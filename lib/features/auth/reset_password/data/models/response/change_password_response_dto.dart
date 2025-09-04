import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/features/auth/reset_password/domain/entities/change_password_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_response_dto.g.dart';

@JsonSerializable()
class ChangePasswordResponseDto  extends Equatable{
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  ChangePasswordResponseDto ({
    this.message,
    this.token,
  });

  factory ChangePasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ChangePasswordResponseDtoToJson(this);
  }

  List<Object?> get props => [message,token];

  ChangePasswordResponseEntity toChangePasswordResponseEntityEntity() => ChangePasswordResponseEntity(
    message: message,
    token: token,
  );
}


