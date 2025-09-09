import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_cash_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/repo/payment_repo.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/use_case/payment_cash_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_card_use_case_test.mocks.dart';

@GenerateMocks([PaymentRepo])
void main() {
  MockPaymentRepo mockPaymentRepo = MockPaymentRepo();
  PaymentCashUseCase mockPaymentCashUseCase = PaymentCashUseCase(
    mockPaymentRepo,
  );
  PaymentCashEntity mockPaymentCashEntity = PaymentCashEntity(
    orderNumber: '',
    totalPrice: 0,
    paymentType: '',
    isPaid: false,
    isDelivered: false,
    state: '',
  );
  ShippingAddressRequestEntity mockShippingAddressRequestEntity =
      ShippingAddressRequestEntity(
        street: '',
        phone: '',
        city: '',
        lat: '',
        long: '',
      );
  test(
    'verify when call paymentcashUseCase is should call repo.cash return PaymentCashEntity',
    () async {
      var expectedResult = ApiSuccessResult<PaymentCashEntity>(
        data: mockPaymentCashEntity,
      );
      provideDummy<ApiResult<PaymentCashEntity>>(expectedResult);
      when(
        mockPaymentRepo.cashPaymentRepo(any),
      ).thenAnswer((_) async => expectedResult);
      var result = await mockPaymentCashUseCase.call(
        mockShippingAddressRequestEntity,
      );
      verify(mockPaymentRepo.cashPaymentRepo(any)).called(1);
      expect(result, isA<ApiSuccessResult<PaymentCashEntity>>());
    },
  );
}
