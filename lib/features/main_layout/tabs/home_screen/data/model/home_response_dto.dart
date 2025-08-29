import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/features/main_layout/tabs/home_screen/data/model/product_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/home_entity.dart';
import 'best_saller_response_dto.dart';
import 'category_response_dto.dart';
import 'occasion_response_dto.dart';

part 'home_response_dto.g.dart';

@JsonSerializable()
class HomeResponseDto extends Equatable {
  final String message;
  @JsonKey(defaultValue: [])
  final List<ProductResponseDto> products;
  @JsonKey(defaultValue: [])
  final List<CategoryResponseDto> categories;
  @JsonKey(defaultValue: [])
  final List<BestSellerResponseDto> bestSeller;
  @JsonKey(defaultValue: [])
  final List<OccasionResponseDto> occasions;

const  HomeResponseDto({
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
  
  @override
  List<Object?> get props => [bestSeller,products,occasions,categories];
}
