import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/area_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/repositories/add_new_address_repo.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/use_cases/get_areas_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_new_address_use_case_test.mocks.dart';

@GenerateMocks([AddNewAddressRepo])
void main() {
  final AddNewAddressRepo repo = MockAddNewAddressRepo();
  final GetAreasUseCase useCase = GetAreasUseCase(repo);

  final expectedResponse = AreaResponseEntity(
    data: [AreaDataResponseEntity(), AreaDataResponseEntity()],
  );

  provideDummy<ApiResult<AreaResponseEntity>>(
    ApiSuccessResult<AreaResponseEntity>(data: expectedResponse),
  );

  test(
    'When call invoke should return ApiSuccessResult when repo returns success',
    () async {
      when(repo.getAreas()).thenAnswer(
        (_) async =>
            ApiSuccessResult<AreaResponseEntity>(data: expectedResponse),
      );

      final result = await useCase.invoke();

      verify(repo.getAreas()).called(1);
      expect(result, isA<ApiSuccessResult<AreaResponseEntity>>());
      result as ApiSuccessResult<AreaResponseEntity>;
      expect(result.data, equals(expectedResponse));
      expect(result.data.data!.length, equals(expectedResponse.data!.length));
    },
  );
}
