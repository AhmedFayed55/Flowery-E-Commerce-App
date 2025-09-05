import 'package:flowers_ecommerce_app/features/profile/data/model/about_us_style_model_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/about_us_style_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('verify when convert aboutUsStyleDto to aboutUsStyleEntity', () {
    AboutUsStyleModelDto mockAboutUsStyleModelDto = AboutUsStyleModelDto(
      0,
      'fontWeight',
      'color',
      {},
      'backgroundColor',
    );

    var result = mockAboutUsStyleModelDto.toDomain('');
    expect(result, isA<AboutUsStyleEntity>());
    expect(result.backgroundColor, 'backgroundColor');
    expect(result.color, 'color');
  });
}
