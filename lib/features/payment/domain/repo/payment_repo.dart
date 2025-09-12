import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_card_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_cash_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/shipping_address_request_entity.dart';

abstract class PaymentRepo {
  Future<ApiResult<PaymentCardEntity>> cardPaymentRepo(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  );
  Future<ApiResult<PaymentCashEntity>> cashPaymentRepo(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  );
}
