import 'package:json_annotation/json_annotation.dart';

import 'product_dto.dart';

@JsonSerializable()
class GetSpecificProductRespone {
  String? message;
  ProductDto? product;

  GetSpecificProductRespone({this.message, this.product});

  factory GetSpecificProductRespone.fromJson(Map<String, dynamic> json) {
    return GetSpecificProductRespone(
      message: json['message'] as String?,
      product: json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'product': product?.toJson(),
  };
}
