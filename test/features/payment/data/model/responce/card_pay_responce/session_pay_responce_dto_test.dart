import 'package:flowers_ecommerce_app/features/payment/data/model/responce/card_pay_responce/session_pay_responce_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_card_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'veriy when call toDomain in sessionModelDto is should return SessionEntity',
    () {
      SessionPayResponceDto mockSessionPayRespoceDto = SessionPayResponceDto(
        id: 'id',
        object: 'object',
        amount_subtotal: 0,
        amount_total: 0,
        currency: 'currency',
      );
      var result = mockSessionPayRespoceDto.toDomain();
      expect(result, isA<PaymentCardEntity>());
    },
  );
}
