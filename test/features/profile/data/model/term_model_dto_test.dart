import 'package:flowers_ecommerce_app/features/profile/data/model/term_model_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/data/model/term_style_model_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/term_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('verify when convert termModelDto to termModelEntity', () {
    TermStyleModelDto mockTermModelStruleDto = TermStyleModelDto(
      fontSize: 0,
      fontWeight: 'fontWeight',
      color: 'color',
      textAlign: {},
      backgroundColor: 'backgroundColor',
    );
    TermModelDto mockTermModelDto = TermModelDto(title: {},
      section: 'section',
      content: {},
      style: mockTermModelStruleDto,
    );

    var result = mockTermModelDto.toDomain('');
    expect(result, isA<TermEntity>());
    expect(result.title, isNotNull);
    expect(result.content, isNotNull);
  });
}
