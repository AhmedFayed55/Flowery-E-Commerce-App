import 'package:flowers_ecommerce_app/features/payment/data/model/responce/cash_pay_responce/order_pay_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_cash_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'verify when call toDomain in orderPayModelDto should return orderPayModelEntity ',
    () {
      OrderPayModelDto mockOrderPayModelDto = OrderPayModelDto(
        orderNumber: 'orderNumber',
        totalPrice: 0,
        paymentType: 'paymentType',
        isPaid: false,
        isDelivered: false,
        state: 'state',
      );
      PaymentCashEntity mockPaymentCashEntity = PaymentCashEntity(
        orderNumber: 'orderNumber',
        totalPrice: 0,
        paymentType: 'paymentType',
        isPaid: false,
        isDelivered: false,
        state: 'state',
      );
      var result = mockOrderPayModelDto.toDomain();
      expect(result.orderNumber, equals(mockPaymentCashEntity.orderNumber));
      expect(result.isPaid, equals(mockPaymentCashEntity.isPaid));
      expect(result.isDelivered, equals(mockPaymentCashEntity.isDelivered));
      expect(result.totalPrice, equals(mockPaymentCashEntity.totalPrice));
      expect(result.paymentType, equals(mockPaymentCashEntity.paymentType));
    },
  );
}
