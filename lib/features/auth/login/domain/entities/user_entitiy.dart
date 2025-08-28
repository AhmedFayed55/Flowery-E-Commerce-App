import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String photo;
  final List<dynamic> wishlist;
  final List<dynamic> addresses;

  UserEntity(
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.wishlist,
    this.addresses,
  );
  
  @override
  // TODO: implement props
  List<Object?> get props => [firstName,lastName,email,gender,phone,photo,wishlist,addresses];
}
