import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/entities/address.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/repo/checkout_repo.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/usecase/get_logged_user_addresses_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_logged_user_addresses_usecase_test.mocks.dart';

@GenerateMocks([CheckoutRepo])

void main() {
  late GetLoggedUserAddressesUsecase usecase;
  late MockCheckoutRepo mockCheckoutRepo;

  setUp(() {
    mockCheckoutRepo = MockCheckoutRepo();
    usecase = GetLoggedUserAddressesUsecase(mockCheckoutRepo);
    provideDummy<ApiResult<List<Address>>>(ApiSuccessResult(data: []));

  });

  group('GetLoggedUserAddressesUsecase', () {
    test('should return ApiSuccessResult when repo returns success', () async {
      // arrange
      final addresses = [Address(id: "1", street: "Street 1", city: "Cairo")];
      when(mockCheckoutRepo.getLoggedUserAddresses())
          .thenAnswer((_) async => ApiSuccessResult(data: addresses));

      // act
      final result = await usecase.invok();

      // assert
      expect(result, isA<ApiSuccessResult<List<Address>>>());
      final success = result as ApiSuccessResult<List<Address>>;
      expect(success.data.first.city, "Cairo");
      verify(mockCheckoutRepo.getLoggedUserAddresses()).called(1);
    });

    test('should return ApiErrorResult when repo returns failure', () async {
      // arrange
      when(mockCheckoutRepo.getLoggedUserAddresses())
          .thenAnswer((_) async => ApiErrorResult(
                failure:  Failure(errorMessage: "Error"),
              ));

      // act
      final result = await usecase.invok();

      // assert
      expect(result, isA<ApiErrorResult<List<Address>>>());
      verify(mockCheckoutRepo.getLoggedUserAddresses()).called(1);
    });
  });
}
