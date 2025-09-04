import 'package:json_annotation/json_annotation.dart';

part 'reset_pass_model.g.dart';

@JsonSerializable()
class ResetPasswordModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  ResetPasswordModel ({
    this.message,
    this.token,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordModelToJson(this);
  }
}


