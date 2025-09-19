import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_card_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/repo/payment_repo.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/use_case/payment_card_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_card_use_case_test.mocks.dart';

@GenerateMocks([PaymentRepo])
void main() {
  MockPaymentRepo mockPaymentRepo = MockPaymentRepo();
  PaymentCardEntity mockPaymentCardEntity = PaymentCardEntity(
    checkoutSessionId: '',
    status: '',
    amountTotal: 0,
    currency: '',
    customerEmail: '',
    checkoutUrl: '',
  );
  PaymentCardUseCase mockPaymentCardUseCase = PaymentCardUseCase(
    mockPaymentRepo,
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
    'verify when call paymentcardUseCase is shoulf call repo.card return PaymentCardEntity',
    () async {
      var expectResult = ApiSuccessResult<PaymentCardEntity>(
        data: mockPaymentCardEntity,
      );
      provideDummy<ApiResult<PaymentCardEntity>>(expectResult);
      when(
        mockPaymentRepo.cardPaymentRepo(any),
      ).thenAnswer((_) async => expectResult);
      var result = await mockPaymentCardUseCase.call(
        mockShippingAddressRequestEntity,
      );
      expect(result, isA<ApiSuccessResult<PaymentCardEntity>>());
    },
  );
}
