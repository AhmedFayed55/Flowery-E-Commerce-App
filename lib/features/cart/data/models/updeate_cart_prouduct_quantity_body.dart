class UpdeateCartProuductQuantityBody {
  int? quantity;

  UpdeateCartProuductQuantityBody({this.quantity});

  factory UpdeateCartProuductQuantityBody.fromJson(Map<String, dynamic> json) {
    return UpdeateCartProuductQuantityBody(quantity: json['quantity'] as int?);
  }

  Map<String, dynamic> toJson() => {'quantity': quantity};
}
