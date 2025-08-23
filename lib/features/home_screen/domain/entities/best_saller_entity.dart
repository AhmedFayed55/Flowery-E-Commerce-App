class BestSallerEntity {
  final String title;
  final String description;
  final String imgCover;
  final List<String> images;
  final double price;
  final double priceAfterDiscount;
  final int quantity;
  final int sold;
  final String id;

  BestSallerEntity(
    this.title,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.sold,
    this.id,
  );
}
