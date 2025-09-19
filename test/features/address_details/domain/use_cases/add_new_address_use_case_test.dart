import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/request/add_new_address_request_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/address_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/addresses_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/repositories/add_new_address_repo.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/use_cases/add_new_address_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_new_address_use_case_test.mocks.dart';

@GenerateMocks([AddNewAddressRepo])
void main() {
  final AddNewAddressRepo repo = MockAddNewAddressRepo();
  final AddNewAddressUseCase useCase = AddNewAddressUseCase(repo);

  const requestEntity = AddNewAddressRequestEntity(
    street: "Street 1",
    city: "Cairo",
    phone: "01012345678",
    lat: '542.2',
    long: '64151.2',
    username: 'ahmedfayed',
  );

  final expectedResponse = AddressesResponseEntity(
    address: [AddressEntity(), AddressEntity()],
    message: "Added Successfully",
  );

  provideDummy<ApiResult<AddressesResponseEntity>>(
    ApiSuccessResult<AddressesResponseEntity>(data: expectedResponse),
  );

  test(
    'When call invoke should return ApiSuccessResult when repo returns success',
    () async {
      when(repo.addNewAddress(requestEntity)).thenAnswer(
        (_) async =>
            ApiSuccessResult<AddressesResponseEntity>(data: expectedResponse),
      );

      final result = await useCase.invoke(requestEntity);

      verify(repo.addNewAddress(requestEntity)).called(1);
      expect(result, isA<ApiSuccessResult<AddressesResponseEntity>>());
      result as ApiSuccessResult<AddressesResponseEntity>;
      expect(result.data, equals(expectedResponse));
      expect(
        result.data.address!.length,
        equals(expectedResponse.address!.length),
      );
    },
  );
}
