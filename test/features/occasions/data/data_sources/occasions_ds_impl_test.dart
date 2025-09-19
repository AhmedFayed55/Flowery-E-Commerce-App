import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/occasions/data/data_sources/occasions_ds_impl.dart';
import 'package:flowers_ecommerce_app/features/occasions/data/models/occasions_response_dto.dart';
import 'package:flowers_ecommerce_app/features/occasions/data/models/products_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasions_ds_impl_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  test(
    'verify when call getAllOccasions it should call getAllOccasions from ApiServices',
    () async {
      final ApiServices apiServices = MockApiServices();
      OccasionsDataSourceImpl dataSourceImpl = OccasionsDataSourceImpl(
        apiServices,
      );

      final expectedResponse = OccasionsResponseDto(
        products: [
          ProductsDto(updatedAt: "2024-11-18T12:36:18.366Z", slug: "wedding"),
          ProductsDto(
            updatedAt: "2024-12-18T12:36:18.366Z",
            slug: "fathers-day",
          ),
        ],
      );

      when(
        apiServices.getOccasions(),
      ).thenAnswer((_) async => expectedResponse);

      var result = await dataSourceImpl.getOccasions();

      verify(apiServices.getOccasions()).called(1);

      expect(result, isA<OccasionsResponseDto>());
      expect(
        result.products?.length,
        equals(expectedResponse.products?.length),
      );
    },
  );
}
