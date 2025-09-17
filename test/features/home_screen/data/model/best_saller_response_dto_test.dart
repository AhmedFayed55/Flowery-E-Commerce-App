import 'package:flowers_ecommerce_app/features/home_screen/data/model/best_saller_response_dto.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/best_saller_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'when call toDomain from bestSeller is should return BestSellerEntity',
    () {
      BestSallerEntity mockBestSallerEntity = const BestSallerEntity(
        'title',
        "description",
        "imgCover",
        [],
        0,
        0,
        0,
        0,
        "id",
      );

      BestSellerResponseDto mockBestSallerResponceDto =
          const BestSellerResponseDto(
            id: 'id',
            imgCover: 'imgCover',
            images: [],
            sold: 0,
            price: 0,
            quantity: 0,
            priceAfterDiscount: 0,
            title: 'title',
            description: 'description',
          );

      var result = mockBestSallerResponceDto.toDomain();
      expect(result, equals(mockBestSallerEntity));
    },
  );
}
