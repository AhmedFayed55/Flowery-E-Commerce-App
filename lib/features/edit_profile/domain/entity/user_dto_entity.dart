class UserDtoEntity {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  List<dynamic>? wishlist;
  List<dynamic>? addresses;
  String? createdAt;
  String? passwordResetCode;
  String? passwordResetExpires;
  bool? resetCodeVerified;

  UserDtoEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.addresses,
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
  });
}
