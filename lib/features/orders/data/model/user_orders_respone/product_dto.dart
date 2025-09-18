import 'package:flowers_ecommerce_app/features/orders/domin/entites/product.dart';

class ProductDto {
  int? rateAvg;
  int? rateCount;
  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;
  String? category;
  String? occasion;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? isSuperAdmin;
  int? sold;

  ProductDto({
    this.rateAvg,
    this.rateCount,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isSuperAdmin,
    this.sold,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
    rateAvg: json['rateAvg'] as int?,
    rateCount: json['rateCount'] as int?,
    id: json['_id'] as String?,
    title: json['title'] as String?,
    slug: json['slug'] as String?,
    description: json['description'] as String?,
    imgCover: json['imgCover'] as String?,
    images: (json['images'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),

    price: json['price'] as int?,
    priceAfterDiscount: json['priceAfterDiscount'] as int?,
    quantity: json['quantity'] as int?,
    category: json['category'] as String?,
    occasion: json['occasion'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int?,
    isSuperAdmin: json['isSuperAdmin'] as bool?,
    sold: json['sold'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'rateAvg': rateAvg,
    'rateCount': rateCount,
    '_id': id,
    'title': title,
    'slug': slug,
    'description': description,
    'imgCover': imgCover,
    'images': images,
    'price': price,
    'priceAfterDiscount': priceAfterDiscount,
    'quantity': quantity,
    'category': category,
    'occasion': occasion,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
    'isSuperAdmin': isSuperAdmin,
    'sold': sold,
    'id': id,
  };

  Product toEntity() => Product(
    rateAvg: rateAvg,
    rateCount: rateCount,
    id: id,
    title: title,
    slug: slug,
    description: description,
    imgCover: imgCover,
    images: images,
    price: price,
    priceAfterDiscount: priceAfterDiscount,
    quantity: quantity,
    category: category,
    occasion: occasion,
    createdAt: createdAt,
    updatedAt: updatedAt,
    v: v,
    isSuperAdmin: isSuperAdmin,
    sold: sold,
  );
}
