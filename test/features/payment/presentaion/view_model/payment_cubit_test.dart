import 'package:bloc_test/bloc_test.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_card_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_cash_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/use_case/payment_card_use_case.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/use_case/payment_cash_use_case.dart';
import 'package:flowers_ecommerce_app/features/payment/presentaion/view_model/payment_cubit.dart';
import 'package:flowers_ecommerce_app/features/payment/presentaion/view_model/payment_event.dart';
import 'package:flowers_ecommerce_app/features/payment/presentaion/view_model/payment_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_cubit_test.mocks.dart';

@GenerateMocks([PaymentCardUseCase, PaymentCashUseCase])
void main() {
  MockPaymentCardUseCase mockPaymentCardUseCase = MockPaymentCardUseCase();
  MockPaymentCashUseCase mockPaymentCashUseCase = MockPaymentCashUseCase();
  PaymentCardEntity mockPaymentCardEntity = PaymentCardEntity(
    checkoutSessionId: '',
    status: '',
    amountTotal: 0,
    currency: '',
    customerEmail: '',
    checkoutUrl: '',
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
        street: 'street',
        phone: 'phone',
        city: 'city',
        lat: 'lat',
        long: 'long',
      );
  var expectedErrorCard = ApiErrorResult<PaymentCardEntity>(
    failure: Failure(errorMessage: 'somethingError'),
  );

  var expectedResultCard = ApiSuccessResult<PaymentCardEntity>(
    data: mockPaymentCardEntity,
  );
  var expectedResultCash = ApiSuccessResult<PaymentCashEntity>(
    data: mockPaymentCashEntity,
  );
  var expectedErrorCash = ApiErrorResult<PaymentCashEntity>(
    failure: Failure(errorMessage: 'somethingError'),
  );
  provideDummy<ApiResult<PaymentCashEntity>>(expectedErrorCash);
  provideDummy<ApiResult<PaymentCashEntity>>(expectedResultCash);
  provideDummy<ApiResult<PaymentCardEntity>>(expectedResultCard);
  provideDummy<ApiResult<PaymentCardEntity>>(expectedErrorCard);
  group('cubit test', () {
    blocTest<PaymentCubit, PaymentState>(
      'test emit loadding and success cardPayment',
      build: () {
        when(
          mockPaymentCardUseCase.call(any),
        ).thenAnswer((_) async => expectedResultCard);
        return PaymentCubit(mockPaymentCardUseCase, mockPaymentCashUseCase);
      },
      act: (bloc) => bloc.doIntent(
        PaymentCardEvent(
          shippingAddressRequestEntity: mockShippingAddressRequestEntity,
        ),
      ),
      expect: () => [
        PaymentState(isLoadding: true),
        PaymentState(
          isLoadding: false,
          errorMessage: '',
          paymentCardEntity: mockPaymentCardEntity,
        ),
      ],
    );
    blocTest<PaymentCubit, PaymentState>(
      'test emit loadding and error cardPayment',
      build: () {
        when(
          mockPaymentCardUseCase.call(any),
        ).thenAnswer((_) async => expectedErrorCard);
        return PaymentCubit(mockPaymentCardUseCase, mockPaymentCashUseCase);
      },
      act: (bloc) => bloc.doIntent(
        PaymentCardEvent(
          shippingAddressRequestEntity: mockShippingAddressRequestEntity,
        ),
      ),
      expect: () => [
        PaymentState(isLoadding: true),
        PaymentState(isLoadding: false, errorMessage: 'somethingError'),
      ],
    );
    blocTest<PaymentCubit, PaymentState>(
      'emit loadding and success in cashPayment',
      build: () {
        when(
          mockPaymentCashUseCase.call(any),
        ).thenAnswer((_) async => expectedResultCash);
        return PaymentCubit(mockPaymentCardUseCase, mockPaymentCashUseCase);
      },
      act: (bloc) => bloc.doIntent(
        PaymentCashEvent(
          shippingAddressRequestEntity: mockShippingAddressRequestEntity,
        ),
      ),
      expect: () => [
        PaymentState(isLoadding: true),
        PaymentState(
          isLoadding: false,
          paymentCashEntity: mockPaymentCashEntity,
          isSuccessCash: true,
        ),
      ],
    );
    blocTest<PaymentCubit, PaymentState>(
      'emit loadding and error in cashPayment',
      build: () {
        when(
          mockPaymentCashUseCase.call(any),
        ).thenAnswer((_) async => expectedErrorCash);
        return PaymentCubit(mockPaymentCardUseCase, mockPaymentCashUseCase);
      },
      act: (bloc) => bloc.doIntent(
        PaymentCashEvent(
          shippingAddressRequestEntity: mockShippingAddressRequestEntity,
        ),
      ),
      expect: () => [
        PaymentState(isLoadding: true),
        PaymentState(isLoadding: false, errorMessage: 'somethingError'),
      ],
    );
  });
}
