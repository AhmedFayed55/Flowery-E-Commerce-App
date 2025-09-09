import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_card_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/repo/payment_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentCardUseCase {
  final PaymentRepo _paymentRepo;
  PaymentCardUseCase(this._paymentRepo);
  Future<ApiResult<PaymentCardEntity>> call(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  ) {
    return _paymentRepo.cardPaymentRepo(shippingAddressRequestEntity);
  }
}
