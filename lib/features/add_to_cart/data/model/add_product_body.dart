class AddProductBody {
  String? product;
  int? quantity;

  AddProductBody({this.product, this.quantity});

  factory AddProductBody.fromJson(Map<String, dynamic> json) {
    return AddProductBody(
      product: json['product'] as String?,
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'product': product, 'quantity': quantity};
}
