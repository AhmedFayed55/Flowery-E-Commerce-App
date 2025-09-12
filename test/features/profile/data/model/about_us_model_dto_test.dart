import 'package:flowers_ecommerce_app/features/profile/data/model/about_us_model_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/data/model/about_us_style_model_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/about_us_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('verify when convert aboutUsDto to aboutUsEntity', () {
    AboutUsStyleModelDto mockApoutUsStyleModelDto = AboutUsStyleModelDto(
      1,
      'fontWeight',
      'color',
      {},
      'backgroundColor',
    );
    AbotUsModelDto mockApoutUsModelDto = AbotUsModelDto(
      'section',
      {},
      mockApoutUsStyleModelDto,
      {},
    );

    var result = mockApoutUsModelDto.toDomain('');
    expect(result, isA<AboutUsEntity>());
  });
}
