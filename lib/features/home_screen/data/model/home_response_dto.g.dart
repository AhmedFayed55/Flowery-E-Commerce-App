// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponseDto _$HomeResponseDtoFromJson(
  Map<String, dynamic> json,
) => HomeResponseDto(
  message: json['message'] as String,
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductResponseDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryResponseDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  bestSeller:
      (json['bestSeller'] as List<dynamic>?)
          ?.map(
            (e) => BestSellerResponseDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  occasions:
      (json['occasions'] as List<dynamic>?)
          ?.map((e) => OccasionResponseDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$HomeResponseDtoToJson(HomeResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'products': instance.products,
      'categories': instance.categories,
      'bestSeller': instance.bestSeller,
      'occasions': instance.occasions,
    };
