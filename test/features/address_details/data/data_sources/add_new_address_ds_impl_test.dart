import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/core/services/token_service.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/data_sources/add_new_address_ds_impl.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/request/add_new_address_request_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/address_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/addresses_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../auth/change_password/data/data_sources/change_password_ds_impl_test.mocks.dart';

@GenerateMocks([ApiServices, TokenService])
void main() {
  late MockApiServices apiServices;
  late MockTokenService tokenService;
  late AddNewAddressDataSourceImpl dataSource;

  setUp(() {
    apiServices = MockApiServices();
    tokenService = MockTokenService();
    dataSource = AddNewAddressDataSourceImpl(apiServices, tokenService);
  });

  test(
    'verify when call addNewAddress it should call addNewAddress from ApiServices',
    () async {
      const String token = "fake_token";
      const requestDto = AddNewAddressRequestDto(
        street: "Street 1",
        city: "Cairo",
        phone: "01012345678",
      );

      final expectedResponse = AddressesResponseDto(
        address: [AddressDto(), AddressDto()],
        message: "Address added successfully",
      );

      when(tokenService.getToken()).thenAnswer((_) async => token);
      when(
        apiServices.addNewAddress("${AppConstants.bearer} $token", requestDto),
      ).thenAnswer((_) async => expectedResponse);

      final result = await dataSource.addNewAddress(requestDto);

      verify(tokenService.getToken()).called(1);
      verify(
        apiServices.addNewAddress("${AppConstants.bearer} $token", requestDto),
      ).called(1);

      expect(result, isA<AddressesResponseDto>());
      expect(result.message, equals(expectedResponse.message));
      expect(result.address!.length, equals(expectedResponse.address!.length));
    },
  );
}
