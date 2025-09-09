import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/payment/data/data_source/payment_ds.dart';
import 'package:flowers_ecommerce_app/features/payment/data/mapper/mapper_shipping_address_toDto.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_card_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_cash_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/repo/payment_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentRepo)
class PaymentRepoImp implements PaymentRepo {
  final PaymentDataSource _paymentDataSource;
  PaymentRepoImp(this._paymentDataSource);
  @override
  Future<ApiResult<PaymentCardEntity>> cardPaymentRepo(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  ) async {
    try {
      var result = await _paymentDataSource.cardPayment(
        mapperToDto(shippingAddressRequestEntity),
      );
      return ApiSuccessResult(data: result.session.toDomain());
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<ApiResult<PaymentCashEntity>> cashPaymentRepo(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  ) async {
    try {
      var result = await _paymentDataSource.cashPayment(
        mapperToDto(shippingAddressRequestEntity),
      );
      return ApiSuccessResult(data: result.orderDto.toDomain());
    } on DioException catch (e) {
      return ApiErrorResult(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult(failure: Failure(errorMessage: e.toString()));
    }
  }
}
