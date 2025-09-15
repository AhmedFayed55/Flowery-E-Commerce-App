import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/entities/user_address_data_entity.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/repositories/saved_address_repo.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/use_cases/get_all_addresses_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_addresses_use_case_test.mocks.dart';

@GenerateMocks([SavedAddressRepo])
void main() {
  late MockSavedAddressRepo mockRepo;
  late GetAllAddressesUseCase useCase;

  setUp(() {
    mockRepo = MockSavedAddressRepo();
    useCase = GetAllAddressesUseCase(mockRepo);

    provideDummy<ApiResult<List<UserAddressDataEntity>>>(
      ApiSuccessResult<List<UserAddressDataEntity>>(data: []),
    );
  });

  test(
    "should return ApiSuccessResult when repo.getAllAddresses succeeds",
    () async {
      final expectedData = [
        UserAddressDataEntity(id: "1", street: "Street 1"),
        UserAddressDataEntity(id: "2", street: "Street 2"),
      ];

      when(
        mockRepo.getAllAddresses(),
      ).thenAnswer((_) async => ApiSuccessResult(data: expectedData));

      final result = await useCase.invoke();

      verify(mockRepo.getAllAddresses()).called(1);
      expect(result, isA<ApiSuccessResult<List<UserAddressDataEntity>>>());
      result as ApiSuccessResult<List<UserAddressDataEntity>>;
      expect(result.data.length, expectedData.length);
    },
  );

  test(
    "should return ApiErrorResult when repo.getAllAddresses fails",
    () async {
      when(mockRepo.getAllAddresses()).thenAnswer(
        (_) async =>
            ApiErrorResult(failure: Failure(errorMessage: "no addresses")),
      );

      final result = await useCase.invoke();

      verify(mockRepo.getAllAddresses()).called(1);
      expect(result, isA<ApiErrorResult<List<UserAddressDataEntity>>>());
      result as ApiErrorResult<List<UserAddressDataEntity>>;
      expect(result.failure.errorMessage, "no addresses");
    },
  );
}
