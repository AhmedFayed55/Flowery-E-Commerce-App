import 'package:flowers_ecommerce_app/core/constants/Json_serializable_constants.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RegisterBody {
  @JsonKey(name: JsonSerializableConstants.firstName)
  String? firstName;
  @JsonKey(name: JsonSerializableConstants.lastName)
  String? lastName;
  @JsonKey(name: JsonSerializableConstants.email)
  String? email;
  @JsonKey(name: JsonSerializableConstants.password)
  String? password;
  @JsonKey(name: JsonSerializableConstants.rePassword)
  String? rePassword;
  @JsonKey(name: JsonSerializableConstants.phone)
  String? phone;
  @JsonKey(name: JsonSerializableConstants.gender)
  String? gender;

  RegisterBody({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
    this.gender,
  });

  factory RegisterBody.fromJson(Map<String, dynamic> json) => RegisterBody(
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    rePassword: json['rePassword'] as String?,
    phone: json['phone'] as String?,
    gender: json['gender'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'rePassword': rePassword,
    'phone': phone,
    'gender': gender,
  };
}
