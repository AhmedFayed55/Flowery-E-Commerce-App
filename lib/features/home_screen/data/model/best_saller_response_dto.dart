import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/best_saller_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_saller_response_dto.g.dart';

@JsonSerializable()
class BestSellerResponseDto extends Equatable {
  final double? rateAvg;
  final int? rateCount;
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String> images;
  final double? price;
  final double? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final bool? isSuperAdmin;
  final int? sold;

  const BestSellerResponseDto({
    this.rateAvg,
    this.rateCount,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images = const [],
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

  factory BestSellerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BestSellerResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BestSellerResponseDtoToJson(this);

  BestSallerEntity toDomain() {
    return BestSallerEntity(
      title ?? '',
      description ?? '',
      imgCover ?? '',
      images,
      price ?? 0,
      priceAfterDiscount ?? 0,
      quantity ?? 0,
      sold ?? 0,
      id ?? '',
    );
  }

  @override
  List<Object?> get props => [
    title,
    description,
    imgCover,
    images,
    price,
    priceAfterDiscount,
    quantity,
    sold,
    id,
  ];
}
