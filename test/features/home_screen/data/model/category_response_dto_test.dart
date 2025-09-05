import 'package:flowers_ecommerce_app/features/home_screen/data/model/category_response_dto.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/category_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'when call toDomain from categoryResponceDto is shoulf return CategoryEntity',
    () {
      CategoryResponseDto mockCategoryResponceDto = const CategoryResponseDto(
        id: 'id',
        name: 'name',
        image: 'image',
      );
      CategoryEntity mockcategoryEntity = const CategoryEntity(
        "id",
        "name",
        "image",
      );

      var result = mockCategoryResponceDto.toDomain();
      expect(result, mockcategoryEntity);
    },
  );
}
