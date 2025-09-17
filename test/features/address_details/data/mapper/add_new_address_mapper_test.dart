import 'package:flowers_ecommerce_app/features/address_details/data/mapper/add_new_address_mapper.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/address_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/addresses_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/area_data_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/area_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/cities_data_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/cities_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/request/add_new_address_request_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("toAddNewAddressRequestDto", () {
    test('should map null values correctly', () {
      const entity = AddNewAddressRequestEntity(
        lat: null,
        long: null,
        phone: null,
        street: null,
        username: null,
        city: null,
      );

      final dto = toAddNewAddressRequestDto(entity);

      expect(dto.lat, null);
      expect(dto.long, null);
      expect(dto.phone, null);
      expect(dto.street, null);
      expect(dto.username, null);
      expect(dto.city, null);
    });

    test('should map non-null values correctly', () {
      const entity = AddNewAddressRequestEntity(
        lat: "30.0",
        long: "31.0",
        phone: "0123456789",
        street: "Test Street",
        username: "Ahmed",
        city: "Cairo",
      );

      final dto = toAddNewAddressRequestDto(entity);

      expect(dto.lat, entity.lat);
      expect(dto.long, entity.long);
      expect(dto.phone, entity.phone);
      expect(dto.street, entity.street);
      expect(dto.username, entity.username);
      expect(dto.city, entity.city);
    });
  });

  group("toAddressesResponseEntity", () {
    test('should map null values correctly', () {
      final dto = AddressesResponseDto(message: null, address: null);

      final entity = toAddressesResponseEntity(dto);

      expect(entity.message, null);
      expect(entity.address, null);
    });

    test('should map non-null values correctly', () {
      final dto = AddressesResponseDto(
        message: "Success",
        address: [
          AddressDto(
            id: "1",
            city: "Cairo",
            lat: "2.2",
            long: "2.3",
            phone: "0123456789",
            street: "Street 1",
            username: "Ahmed",
          ),
        ],
      );

      final entity = toAddressesResponseEntity(dto);

      expect(entity.message, dto.message);
      expect(entity.address?.length, dto.address?.length);
      expect(entity.address?.first.city, dto.address?.first.city);
    });
  });

  group("toCitiesResponseEntity", () {
    test('should map null values correctly', () {
      final dto = CitiesResponseDto(data: null);

      final entity = toCitiesResponseEntity(dto);

      expect(entity.data, null);
    });

    test('should map non-null values correctly', () {
      final dto = CitiesResponseDto(
        data: [
          CitiesDataResponseDto(
            id: "10",
            governorateNameAr: "القاهرة",
            governorateNameEn: "Cairo",
          ),
        ],
      );

      final entity = toCitiesResponseEntity(dto);

      expect(entity.data?.first.id, dto.data?.first.id);
      expect(
        entity.data?.first.governorateNameAr,
        dto.data?.first.governorateNameAr,
      );
      expect(
        entity.data?.first.governorateNameEn,
        dto.data?.first.governorateNameEn,
      );
    });
  });

  group("toAreaResponseEntity", () {
    test('should map null values correctly', () {
      final dto = AreaResponseDto(data: null);

      final entity = toAreaResponseEntity(dto);

      expect(entity.data, null);
    });

    test('should map non-null values correctly', () {
      final dto = AreaResponseDto(
        data: [
          AreaDataResponseDto(
            id: "5",
            cityNameAr: "مدينة نصر",
            cityNameEn: "Nasr City",
            governorateId: "1",
          ),
        ],
      );

      final entity = toAreaResponseEntity(dto);

      expect(entity.data?.first.id, dto.data?.first.id);
      expect(entity.data?.first.cityNameAr, dto.data?.first.cityNameAr);
      expect(entity.data?.first.cityNameEn, dto.data?.first.cityNameEn);
      expect(entity.data?.first.governorateId, dto.data?.first.governorateId);
    });
  });
}
