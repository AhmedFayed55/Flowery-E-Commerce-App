import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/user_entitiy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model_dto.g.dart';

@JsonSerializable()
class UserModelDto extends Equatable {
  @JsonKey(name: "_id")
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String photo;
  final String role;
  final List<dynamic> wishlist;
  final List<dynamic> addresses;
  final String createdAt;

  factory UserModelDto.fromJson(Map<String, dynamic> json) =>
      _$UserModelDtoFromJson(json);

  const UserModelDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
    required this.role,
    required this.wishlist,
    required this.addresses,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$UserModelDtoToJson(this);

  UserLoginEntity toDomain() {
    return UserLoginEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,
      wishlist: wishlist,
      addresses: addresses,
    );
  }

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    gender,
    phone,
    wishlist,
    addresses,
    photo,
  ];
}
