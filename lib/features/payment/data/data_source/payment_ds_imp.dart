import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/payment/data/data_source/payment_ds.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/request/payment_request_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/responce/card_pay_responce/card_pay_responce_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/responce/cash_pay_responce/cash_pay_responce_model_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentDataSource)
class PaymentDataSourceImp implements PaymentDataSource {
  final ApiServices _apiServices;
  PaymentDataSourceImp(this._apiServices);
  @override
  Future<CardPayResponceModelDto> cardPayment(
    PaymentRequestModelDto paymentRequestModelDto,
  ) {
    return _apiServices.paymentCard(paymentRequestModelDto);
  }

  @override
  Future<CashPayResponceModelDto> cashPayment(
    PaymentRequestModelDto paymentRequestModelDto,
  ) {
    return _apiServices.paymentCash(paymentRequestModelDto);
  }
}
