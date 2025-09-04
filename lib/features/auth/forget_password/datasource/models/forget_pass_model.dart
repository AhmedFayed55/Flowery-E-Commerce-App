import 'package:json_annotation/json_annotation.dart';

part 'forget_pass_model.g.dart';

@JsonSerializable()
class ForgetPasswordModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "info")
  final String? info;

  ForgetPasswordModel({this.message, this.info});

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordModelToJson(this);
  }
}
