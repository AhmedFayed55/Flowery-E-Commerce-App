import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/checkout/data/model/get_user_addreses_respone/get_user_addreses_respone.dart';
import 'package:flowers_ecommerce_app/features/checkout/data/sources/checkout_remote_ds_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'checkout_remote_ds_impl_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  late CheckoutRemoteDsImpl checkoutRemoteDs;
  late MockApiServices mockApiServices;

  setUp(() {
    mockApiServices = MockApiServices();
    checkoutRemoteDs = CheckoutRemoteDsImpl(mockApiServices);
  });

  group('CheckoutRemoteDsImpl', () {
    test('should return GetUserAddresesRespone when ApiServices call is successful', () async {
      // arrange
      final fakeResponse = GetUserAddresesRespone(
        addresses: [],
        message: null,
      );

      when(mockApiServices.getLoggedUserAddresses())
          .thenAnswer((_) async => fakeResponse);

      // act
      final result = await checkoutRemoteDs.getLoggedUserAddresses();

      // assert
      expect(result, equals(fakeResponse));
      verify(mockApiServices.getLoggedUserAddresses()).called(1);
    });

    test('should throw exception when ApiServices fails', () async {
      // arrange
      when(mockApiServices.getLoggedUserAddresses())
          .thenThrow(Exception('Failed to fetch addresses'));

      // act
      final call = checkoutRemoteDs.getLoggedUserAddresses;

      // assert
      expect(() => call(), throwsA(isA<Exception>()));
      verify(mockApiServices.getLoggedUserAddresses()).called(1);
    });
  });
}
