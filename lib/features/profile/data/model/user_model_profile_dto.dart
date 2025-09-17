import 'package:flowers_ecommerce_app/features/profile/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model_profile_dto.g.dart';

@JsonSerializable()
class UserModelProfileDto {
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
  final DateTime createdAt;

  UserModelProfileDto({
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

  factory UserModelProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserModelProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelProfileDtoToJson(this);

  UserProfileEntity toDomain() {
    return UserProfileEntity(
      id: id,
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
}
