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

  const UserModelDto(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.addresses,
    this.createdAt,
  );

  Map<String, dynamic> toJson() => _$UserModelDtoToJson(this);

  UserEntity toDomain() {
    return UserEntity(
      firstName,
      lastName,
      email,
      gender,
      phone,
      photo,
      wishlist,
      addresses,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [firstName, lastName, email, gender, phone,wishlist,addresses,photo];
}
