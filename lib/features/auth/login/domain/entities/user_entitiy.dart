import 'package:equatable/equatable.dart';

class UserEntity  extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String photo;
  final List<dynamic> wishlist;
  final List<dynamic> addresses;

  const UserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
    required this.wishlist,
    required this.addresses,
  });

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    gender,
    phone,
    photo,
    wishlist,
    addresses,
  ];
}
