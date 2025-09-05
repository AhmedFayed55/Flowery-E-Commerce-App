import 'package:flowers_ecommerce_app/features/auth/register/data/model/register_body_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/register/domin/entites/register_body.dart';

RegisterBodyDTo toRegisterBodyDTo(RegisterBody registerBody) => RegisterBodyDTo(
  firstName: registerBody.firstName,
  lastName: registerBody.lastName,
  email: registerBody.email,
  password: registerBody.password,
  rePassword: registerBody.rePassword,
  phone: registerBody.phone,
  gender: registerBody.gender,
);
