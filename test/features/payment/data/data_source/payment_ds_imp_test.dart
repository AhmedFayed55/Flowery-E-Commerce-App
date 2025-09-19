import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/payment/data/data_source/payment_ds_imp.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/request/payment_request_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/request/shipping_address_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/responce/card_pay_responce/card_pay_responce_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/responce/card_pay_responce/session_pay_responce_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/responce/cash_pay_responce/cash_pay_responce_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/responce/cash_pay_responce/order_pay_model_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../feature/forget_password/data/email_verify_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  group('paymentdataSourceImp', () {
    CashPayResponceModelDto mockCashPayResponceModelDto =
        CashPayResponceModelDto(
          message: 'message',
          orderDto: OrderPayModelDto(),
        );
    PaymentRequestModelDto mockrequestDto = PaymentRequestModelDto(
      shippingAddress: ShippingAddressModelDto(
        street: 'street',
        phone: 'phone',
        city: 'city',
        lat: 'lat',
        long: 'long',
      ),
    );
    CardPayResponceModelDto mockCardPayResponceModelDto =
        CardPayResponceModelDto(
          message: 'message',
          session: SessionPayResponceDto(
            id: 'id',
            object: 'object',
            amount_subtotal: 0,
            amount_total: 0,
            currency: 'egp',
          ),
        );
    MockApiServices mockApiServices = MockApiServices();
    PaymentDataSourceImp mockPaymentDataSource = PaymentDataSourceImp(
      mockApiServices,
    );
    test(
      'cashPayment should call ApiServices.paymentCash and return void',
      () async {
        when(
          mockApiServices.paymentCash(mockrequestDto),
        ).thenAnswer((_) async => mockCashPayResponceModelDto);
        var result = await mockPaymentDataSource.cashPayment(mockrequestDto);
        verify(mockApiServices.paymentCash(mockrequestDto)).called(1);
        expect(result, isA<CashPayResponceModelDto>());
      },
    );
    test(
      'cardPayment should call ApiServices.paymentCard and return PaymentCardResponce',
      () async {
        when(
          mockApiServices.paymentCard(mockrequestDto),
        ).thenAnswer((_) async => mockCardPayResponceModelDto);
        var result = await mockPaymentDataSource.cardPayment(mockrequestDto);
        verify(mockApiServices.paymentCard(mockrequestDto)).called(1);
        expect(result, isA<CardPayResponceModelDto>());
      },
    );
  });
}
