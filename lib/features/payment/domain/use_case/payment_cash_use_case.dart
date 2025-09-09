import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_cash_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/repo/payment_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentCashUseCase {
  final PaymentRepo _paymentRepo;
  PaymentCashUseCase(this._paymentRepo);
  Future<ApiResult<PaymentCashEntity>> call(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  ) {
    return _paymentRepo.cashPaymentRepo(shippingAddressRequestEntity);
  }
}
