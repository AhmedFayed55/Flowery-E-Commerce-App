
class ProductEntity {

  String? id;
  String? title;
  String? description;
  List<String>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;

  ProductEntity({
    this.id,
    this.title,
    this.description,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
  });
}