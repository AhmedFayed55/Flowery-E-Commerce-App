class User {
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  List<dynamic>? wishlist;
  String? id;
  List<dynamic>? addresses;
  DateTime? createdAt;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.id,
    this.addresses,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    email: json['email'] as String?,
    gender: json['gender'] as String?,
    phone: json['phone'] as String?,
    photo: json['photo'] as String?,
    role: json['role'] as String?,
    wishlist: json['wishlist'] as List<dynamic>?,
    id: json['_id'] as String?,
    addresses: json['addresses'] as List<dynamic>?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'gender': gender,
    'phone': phone,
    'photo': photo,
    'role': role,
    'wishlist': wishlist,
    '_id': id,
    'addresses': addresses,
    'createdAt': createdAt?.toIso8601String(),
  };
}
