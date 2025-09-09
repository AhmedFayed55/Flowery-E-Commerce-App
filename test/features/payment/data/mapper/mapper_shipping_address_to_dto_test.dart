import 'package:flowers_ecommerce_app/features/payment/data/mapper/mapper_shipping_address_to_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/data/model/request/payment_request_model_dto.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'mapperToDto should map ShippingAddressRequestEntity to PaymentRequestModelDto',
    () {
      ShippingAddressRequestEntity mockShippingAddressRequestEntity =
          ShippingAddressRequestEntity(
            street: 'street',
            phone: 'phone',
            city: 'city',
            lat: 'lat',
            long: 'long',
          );
      var result = mapperToDto(mockShippingAddressRequestEntity);
      expect(result, isA<PaymentRequestModelDto>());
    },
  );
}
