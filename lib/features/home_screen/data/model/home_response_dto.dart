import 'package:flowers_ecommerce_app/features/home_screen/data/model/best_saller_response_dto.dart';
import 'package:flowers_ecommerce_app/features/home_screen/data/model/category_response_dto.dart';
import 'package:flowers_ecommerce_app/features/home_screen/data/model/occasion_response_dto.dart';
import 'package:flowers_ecommerce_app/features/home_screen/data/model/product_response_dto.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/home_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_response_dto.g.dart';

@JsonSerializable()
class HomeResponseDto {
  final String message;
  @JsonKey(defaultValue: [])
  final List<ProductResponseDto> products;
  @JsonKey(defaultValue: [])
  final List<CategoryResponseDto> categories;
  @JsonKey(defaultValue: [])
  final List<BestSellerResponseDto> bestSeller;
  @JsonKey(defaultValue: [])
  final List<OccasionResponseDto> occasions;

  HomeResponseDto({
    required this.message,
    required this.products,
    required this.categories,
    required this.bestSeller,
    required this.occasions,
  });

  factory HomeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseDtoToJson(this);

  HomeEntity toDomain() {
    return HomeEntity(
      bestSallerEntity: bestSeller.map((e) => e.toDomain()).toList(),
      productEntity: products.map((e) => e.toDomain()).toList(),
      occasionEntity: occasions.map((e) => e.toDomain()).toList(),
      categoryEntity: categories.map((e) => e.toDomain()).toList(),
    );
  }
}
