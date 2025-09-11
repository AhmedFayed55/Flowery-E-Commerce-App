import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/checkout/data/model/get_user_addreses_respone/address.dart';
import 'package:flowers_ecommerce_app/features/checkout/data/model/get_user_addreses_respone/get_user_addreses_respone.dart';
import 'package:flowers_ecommerce_app/features/checkout/data/sources/checkout_remote_ds.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/entities/address.dart';
import 'package:flowers_ecommerce_app/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'checkout_repo_impl_test.mocks.dart';

@GenerateMocks([CheckoutRemoteDS, InternetConnectionChecker])
void main() {
  late CheckoutRepoImpl checkoutRepo;
  late MockCheckoutRemoteDS mockCheckoutRemoteDS;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockCheckoutRemoteDS = MockCheckoutRemoteDS();
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    checkoutRepo = CheckoutRepoImpl(
      mockCheckoutRemoteDS,
      mockInternetConnectionChecker,
    );
  });

  group('CheckoutRepoImpl.getLoggedUserAddresses', () {
    test('should return ApiErrorResult when no internet connection', () async {
      // arrange
      when(
        mockInternetConnectionChecker.hasConnection,
      ).thenAnswer((_) async => false);

      // act
      final result = await checkoutRepo.getLoggedUserAddresses();

      // assert
      expect(result, isA<ApiErrorResult<List<Address>>>());
      final error = result as ApiErrorResult<List<Address>>;
      expect(error.failure.errorMessage, 'No Internet Connection');
      verify(mockInternetConnectionChecker.hasConnection).called(1);
      verifyZeroInteractions(mockCheckoutRemoteDS);
    });

    test(
      'should return ApiSuccessResult when remoteDS call succeeds',
      () async {
        // arrange
        when(
          mockInternetConnectionChecker.hasConnection,
        ).thenAnswer((_) async => true);

        final response = GetUserAddresesRespone(
          addresses: [AddressDto(id: '1', street: 'Street 1', city: 'Cairo')],
          message: null,
        );

        when(
          mockCheckoutRemoteDS.getLoggedUserAddresses(),
        ).thenAnswer((_) async => response);

        // act
        final result = await checkoutRepo.getLoggedUserAddresses();

        // assert
        expect(result, isA<ApiSuccessResult<List<Address>>>());
        final success = result as ApiSuccessResult<List<Address>>;
        expect(success.data.first.city, 'Cairo');

        verify(mockInternetConnectionChecker.hasConnection).called(1);
        verify(mockCheckoutRemoteDS.getLoggedUserAddresses()).called(1);
      },
    );

    test('should return ApiErrorResult when DioException occurs', () async {
      // arrange
      when(
        mockInternetConnectionChecker.hasConnection,
      ).thenAnswer((_) async => true);

      when(mockCheckoutRemoteDS.getLoggedUserAddresses()).thenThrow(
        DioException(requestOptions: RequestOptions(path: '/user/addresses')),
      );

      // act
      final result = await checkoutRepo.getLoggedUserAddresses();

      // assert
      expect(result, isA<ApiErrorResult<List<Address>>>());
      final error = result as ApiErrorResult<List<Address>>;
      expect(error.failure, isA<ServerFailure>());

      verify(mockInternetConnectionChecker.hasConnection).called(1);
      verify(mockCheckoutRemoteDS.getLoggedUserAddresses()).called(1);
    });
  });
}
