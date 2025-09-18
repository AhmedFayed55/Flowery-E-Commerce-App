import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/maper/maper.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/user_address_data_dto.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/entities/user_address_data_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'when call toRemoveAddressDataEntity with null value it should return null values',
    () {
      UserAddressDataDto dto = UserAddressDataDto(
        lat: null,
        long: null,
        phone: null,
        city: null,
        street: null,
        username: null,
        id: null,
      );

      UserAddressDataEntity entity = toUserAddressDataEntity(dto);

      expect(entity.street, null);
      expect(entity.city, null);
      expect(entity.id, null);
      expect(entity.lat, null);
      expect(entity.long, null);
      expect(entity.username, null);
      expect(entity.phone, null);
    },
  );

  test(
    'when call toRemoveAddressDataEntity with non-null value it should return with correct values',
    () {
      UserAddressDataDto dto = UserAddressDataDto(
        lat: "32.1551155",
        long: "26.2651321",
        phone: "0109554316",
        city: "cairo",
        street: "el salam street",
        username: "ahmed fayed",
        id: "1",
      );

      UserAddressDataEntity entity = toUserAddressDataEntity(dto);

      expect(entity.street, dto.street);
      expect(entity.city, dto.city);
      expect(entity.id, dto.id);
      expect(entity.lat, dto.lat);
      expect(entity.long, dto.long);
      expect(entity.username, dto.username);
      expect(entity.phone, dto.phone);
    },
  );
}
