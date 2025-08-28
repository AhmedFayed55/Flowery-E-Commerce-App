import 'package:flowers_ecommerce_app/features/occasions/data/models/metadata_dto.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/metadata_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call toEntity with nullable values it should return with null values', () {
    MetadataDto metadata = MetadataDto(
        totalPages: null,
        totalItems: null,
        limit: null,
        currentPage: null
    );

    MetadataEntity entity = metadata.toEntity();

    expect(entity.totalPages, null);
    expect(entity.totalItems, null);
    expect(entity.limit, null);
    expect(entity.currentPage, null);

  });

  test("when call toEntity with non-null values it should return with correct values", (){
    MetadataDto metadataDto = MetadataDto(
        currentPage: 5,
        limit: 5,
        totalItems: 5,
        totalPages: 5
    );

    MetadataEntity entity = metadataDto.toEntity();

    expect(entity.currentPage, metadataDto.currentPage);
    expect(entity.limit, metadataDto.limit);
    expect(entity.totalItems, metadataDto.totalItems);
    expect(entity.totalPages, metadataDto.totalPages);

  });
}