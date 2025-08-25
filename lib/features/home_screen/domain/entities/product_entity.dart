import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String title;
  final String description;
  final String imgCover;
  final List<String> images;
  final int price;
  final int priceAfterDiscount;
  final int quantity;
  final int sold;
  final String id;

  const ProductEntity(
    this.id,
    this.title,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.sold,
  );

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    imgCover,
    images,
    price,
    priceAfterDiscount,
    quantity,
    sold,
  ];
}
