import 'package:flowers_ecommerce_app/features/profile/data/model/term_style_model_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/term_style_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('verify when convert termStyleDto to termStyleEntity', () {
    TermStyleModelDto mockTermStylrDto = TermStyleModelDto(
      fontSize: 0,
      fontWeight: 'fontWeight',
      color: 'color',
      textAlign: {},
      backgroundColor: 'backgroundColor',
    );

    var result = mockTermStylrDto.toDomain('');
    expect(result, isA<TermStyleEntity>());
    expect(result.backgroundColor, 'backgroundColor');
    expect(result.color, 'color');
    expect(result.textAlign, isNotNull);
  });
}
