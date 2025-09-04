import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/occasions_response_entity.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/products_entity.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/repositories/occasions_repo.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/use_cases/get_specific_occasions_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_specific_occasions_use_case_test.mocks.dart';

@GenerateMocks([OccasionsRepository])
void main() {
  OccasionsRepository repository = MockOccasionsRepository();
  GetSpecificOccasionsUseCase useCase = GetSpecificOccasionsUseCase(repository);
  provideDummy<ApiResult<OccasionsResponseEntity>>(
    ApiSuccessResult<OccasionsResponseEntity>(
      data: OccasionsResponseEntity(products: []),
    ),
  );

  test(
    'When call invoke fun should return ApiSuccessResult when repo returns success',
    () async {
      final OccasionsResponseEntity expectedResponse = OccasionsResponseEntity(
        products: [
          ProductsEntity(slug: "image", title: "name", id: "1"),
          ProductsEntity(slug: "image2", title: "name2", id: "2"),
        ],
      );

      when(repository.getOccasions()).thenAnswer(
        (_) async =>
            ApiSuccessResult<OccasionsResponseEntity>(data: expectedResponse),
      );

      final result = await useCase.invoke();

      verify(repository.getOccasions()).called(1);
      expect(result, isA<ApiSuccessResult<OccasionsResponseEntity>>());
      result as ApiSuccessResult<OccasionsResponseEntity>;
      expect(
        result.data.products?.length,
        equals(expectedResponse.products?.length),
      );
      expect(result.data, equals(expectedResponse));
    },
  );
}
