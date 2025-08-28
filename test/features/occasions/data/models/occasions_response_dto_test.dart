import 'package:flowers_ecommerce_app/features/occasions/data/models/metadata_dto.dart';
import 'package:flowers_ecommerce_app/features/occasions/data/models/occasions_response_dto.dart';
import 'package:flowers_ecommerce_app/features/occasions/data/models/products_dto.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/occasions_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call toEntity with nullable values it should return entity with null values', () {
    OccasionsResponseDto dto = OccasionsResponseDto(
      metadata: null,
      message: null,
      products: null
    );

    OccasionsResponseEntity entity = dto.toEntity();

    expect(entity.message, null);
    expect(entity.metadata, null);
    expect(entity.products, null);
  });

  test('when call toEntity with non-null values it should return entity with correct values', () {

    OccasionsResponseDto dto = OccasionsResponseDto(
      message: "Success",
      metadata: MetadataDto(
        totalPages: 5
      ),
      products: <ProductsDto>[],
    );

    OccasionsResponseEntity entity = dto.toEntity();

    expect(entity.metadata?.totalPages, dto.metadata?.totalPages);
    expect(entity.products, dto.products);
    expect(entity.products?.length, equals(dto.products?.length));
    expect(entity.message, dto.message);

  });

}

