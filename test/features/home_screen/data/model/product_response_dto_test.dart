import 'package:flowers_ecommerce_app/features/home_screen/data/model/product_response_dto.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'when call todomain from productresponceDto is shoulf return productEntity',
    () {
      ProductResponseDto mockProductResponceDto = const ProductResponseDto(
        id: 'id',
        title: 'title',
        price: 0,
        priceAfterDiscount: 0,
        quantity: 0,
        description: 'description',
        images: [],
        imgCover: 'imgCover',
        sold: 0,
      );
      ProductEntity mockProductEntity = const ProductEntity(
        'id',
        'title',
        'description',
        'imgCover',
        [],
        0,
        0,
        0,
        0,
      );
      var result = mockProductResponceDto.toDomain();
      expect(result, mockProductEntity);
    },
  );
}
