import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/payment/data/data_source/payment_ds.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/responce/card_pay_responce/card_pay_responce_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/responce/card_pay_responce/session_pay_responce_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/responce/cash_pay_responce/cash_pay_responce_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/responce/cash_pay_responce/order_pay_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/repo/payment_repo_imp.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_card_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_cash_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_repo_imp_test.mocks.dart';

@GenerateMocks([PaymentDataSource])
void main() {
  group('paymentRepo', () {
    ShippingAddressRequestEntity mockShippingAddressRequestEntity =
        ShippingAddressRequestEntity(
          street: 'street',
          phone: 'phone',
          city: 'city',
          lat: 'lat',
          long: 'long',
        );
    CardPayResponceModelDto mockCardPayResponceModelDto =
        CardPayResponceModelDto(
          message: 'message',
          session: SessionPayResponceDto(
            id: 'id',
            object: '',
            amount_subtotal: 0,
            amount_total: 0,
            currency: 'currency',
          ),
        );
    CashPayResponceModelDto mockCashPayResponceModelDto =
        CashPayResponceModelDto(
          message: 'message',
          orderDto: OrderPayModelDto(),
        );
    MockPaymentDataSource mockPaymentDataSource = MockPaymentDataSource();
    PaymentRepoImp mockPaymentRepo = PaymentRepoImp(mockPaymentDataSource);

    test(
      'cardPaymentRepo should call cardPaymentDataSource retun PaymentCardEntity ',
      () async {
        when(
          mockPaymentDataSource.cardPayment(any),
        ).thenAnswer((_) async => mockCardPayResponceModelDto);
        var result = await mockPaymentRepo.cardPaymentRepo(
          mockShippingAddressRequestEntity,
        );
        verify(mockPaymentDataSource.cardPayment(any)).called(1);

        expect(result, isA<ApiSuccessResult<PaymentCardEntity>>());
      },
    );
    test(
      'cardPaymentRepo should call cardPaymentDataSource retun error',
      () async {
        when(
          mockPaymentDataSource.cardPayment(any),
        ).thenThrow('something error');
        var result = await mockPaymentRepo.cardPaymentRepo(
          mockShippingAddressRequestEntity,
        );
        expect(result, isA<ApiErrorResult<PaymentCardEntity>>());
      },
    );
    test(
      'cashPaymentRepo should call cashPaymentDataSource retun PaymentCashEntity ',
      () async {
        when(
          mockPaymentDataSource.cashPayment(any),
        ).thenAnswer((_) async => mockCashPayResponceModelDto);
        var result = await mockPaymentRepo.cashPaymentRepo(
          mockShippingAddressRequestEntity,
        );
        verify(mockPaymentDataSource.cashPayment(any)).called(1);
        expect(result, isA<ApiSuccessResult<PaymentCashEntity>>());
      },
    );
    test(
      'cashPaymentRepo should call cashPaymentDataSource retun error',
      () async {
        when(
          mockPaymentDataSource.cashPayment(any),
        ).thenThrow('something error');
        var result = await mockPaymentRepo.cashPaymentRepo(
          mockShippingAddressRequestEntity,
        );
        verify(mockPaymentDataSource.cashPayment(any)).called(1);
        expect(result, isA<ApiErrorResult<PaymentCashEntity>>());
      },
    );
  });
}
