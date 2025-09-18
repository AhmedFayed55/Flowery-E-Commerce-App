import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/core/services/token_service.dart';
import 'package:flowers_ecommerce_app/core/utils/app_constants.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/data_sources/saved_address_ds_impl.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/get_user_address_dto.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/user_address_data_dto.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/user_address_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'saved_address_ds_impl_test.mocks.dart';

@GenerateMocks([ApiServices, TokenService])
void main() {
  late MockApiServices apiServices;
  late MockTokenService tokenService;
  late SavedAddressDataSourceImpl dataSource;

  setUp(() {
    apiServices = MockApiServices();
    tokenService = MockTokenService();
    dataSource = SavedAddressDataSourceImpl(apiServices, tokenService);
  });

  test(
    'verify when call removeAddress it should call removeAddress from ApiServices',
    () async {
      const String token = "token";
      const String id = "1515";

      final expectedResponse = UserAddressDto(message: "Address removed");

      when(tokenService.getToken()).thenAnswer((_) async => token);
      when(
        apiServices.removeAddress("${AppConstants.bearer} $token", id),
      ).thenAnswer((_) async => expectedResponse);

      final result = await dataSource.removeAddress(id);

      verify(tokenService.getToken()).called(1);
      verify(
        apiServices.removeAddress("${AppConstants.bearer} $token", id),
      ).called(1);

      expect(result, isA<UserAddressDto>());
      expect(result.message, equals(expectedResponse.message));
    },
  );

  test(
    'verify when call getAllAddresses it should call getAllAddresses from ApiServices',
    () async {
      const String token = "fake_token";

      final expectedResponse = GetUserAddressDto(
        message: "Success",
        address: [UserAddressDataDto(), UserAddressDataDto()],
      );

      when(tokenService.getToken()).thenAnswer((_) async => token);
      when(
        apiServices.getAllAddresses("${AppConstants.bearer} $token"),
      ).thenAnswer((_) async => expectedResponse);

      final result = await dataSource.getAllAddresses();

      verify(tokenService.getToken()).called(1);
      verify(
        apiServices.getAllAddresses("${AppConstants.bearer} $token"),
      ).called(1);

      expect(result, isA<GetUserAddressDto>());
      expect(result.message, equals(expectedResponse.message));
      expect(result.address!.length, equals(expectedResponse.address!.length));
    },
  );
}
