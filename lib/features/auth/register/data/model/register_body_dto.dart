import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_body.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RegisterBodyDTo {
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;
  String gender;

  RegisterBodyDTo({
  required this.firstName,
  required  this.lastName,
  required this.email,
  required  this.password,
  required  this.rePassword,
  required  this.phone,
  required  this.gender,
  });

  factory RegisterBodyDTo.fromJson(Map<String, dynamic> json) => RegisterBodyDTo(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    rePassword: json['rePassword'] as String,
    phone: json['phone'] as String,
    gender: json['gender'] as String,
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
