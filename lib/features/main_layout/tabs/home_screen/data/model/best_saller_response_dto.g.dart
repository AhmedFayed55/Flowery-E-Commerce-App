// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_saller_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerResponseDto _$BestSellerResponseDtoFromJson(
  Map<String, dynamic> json,
) => BestSellerResponseDto(
  rateAvg: (json['rateAvg'] as num?)?.toDouble(),
  rateCount: (json['rateCount'] as num?)?.toInt(),
  id: json['_id'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  imgCover: json['imgCover'] as String?,
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  price: (json['price'] as num?)?.toDouble(),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toDouble(),
  quantity: (json['quantity'] as num?)?.toInt(),
  category: json['category'] as String?,
  occasion: json['occasion'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  v: (json['v'] as num?)?.toInt(),
  isSuperAdmin: json['isSuperAdmin'] as bool?,
  sold: (json['sold'] as num?)?.toInt(),
);

Map<String, dynamic> _$BestSellerResponseDtoToJson(
  BestSellerResponseDto instance,
) => <String, dynamic>{
  'rateAvg': instance.rateAvg,
  'rateCount': instance.rateCount,
  '_id': instance.id,
  'title': instance.title,
  'slug': instance.slug,
  'description': instance.description,
  'imgCover': instance.imgCover,
  'images': instance.images,
  'price': instance.price,
  'priceAfterDiscount': instance.priceAfterDiscount,
  'quantity': instance.quantity,
  'category': instance.category,
  'occasion': instance.occasion,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'v': instance.v,
  'isSuperAdmin': instance.isSuperAdmin,
  'sold': instance.sold,
};
