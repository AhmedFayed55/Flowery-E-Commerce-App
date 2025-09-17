import 'package:flowers_ecommerce_app/features/home_screen/data/model/home_response_dto.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/entities/home_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call toDomain from HomeResponceDto should return HemeEntity', () {
    HomeResponseDto mockHomeResponceDto = const HomeResponseDto(
      message: '',
      products: [],
      categories: [],
      bestSeller: [],
      occasions: [],
    );

    var result = mockHomeResponceDto.toDomain();
    expect(result, isA<HomeEntity>());
  });
}
