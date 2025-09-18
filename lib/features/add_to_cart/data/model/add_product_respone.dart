class AddProductRespone {
  String? message;
  int? numOfCartItems;

  AddProductRespone({this.message, this.numOfCartItems});

  factory AddProductRespone.fromJson(Map<String, dynamic> json) {
    return AddProductRespone(
      message: json['message'] as String?,
      numOfCartItems: json['numOfCartItems'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'numOfCartItems': numOfCartItems,
  };
}
