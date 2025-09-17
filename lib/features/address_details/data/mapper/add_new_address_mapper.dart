import 'package:flowers_ecommerce_app/features/address_details/data/models/request/add_new_address_request_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/area_data_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/data/models/response/area_response_dto.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/request/add_new_address_request_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/area_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/cities_data_response_entity.dart';
import 'package:flowers_ecommerce_app/features/address_details/domain/entities/response/cities_response_entity.dart';

import '../../domain/entities/response/address_response_entity.dart';
import '../../domain/entities/response/addresses_response_entity.dart';
import '../models/response/address_response_dto.dart';
import '../models/response/addresses_response_dto.dart';
import '../models/response/cities_data_response_dto.dart';
import '../models/response/cities_response_dto.dart';

AddNewAddressRequestDto toAddNewAddressRequestDto(
  AddNewAddressRequestEntity entity,
) => AddNewAddressRequestDto(
  lat: entity.lat,
  long: entity.long,
  phone: entity.phone,
  street: entity.street,
  username: entity.username,
  city: entity.city,
);

AddressesResponseEntity toAddressesResponseEntity(AddressesResponseDto dto) =>
    AddressesResponseEntity(
      message: dto.message,
      address: dto.address?.map((e) => toAddressEntity(e)).toList(),
    );

AddressEntity toAddressEntity(AddressDto dto) => AddressEntity(
  city: dto.city,
  id: dto.id,
  lat: dto.lat,
  long: dto.long,
  phone: dto.phone,
  street: dto.street,
  username: dto.username,
);

CitiesResponseEntity toCitiesResponseEntity(CitiesResponseDto dto) =>
    CitiesResponseEntity(
      data: dto.data?.map((e) => toCitiesDataResponseEntity(e)).toList(),
    );

CitiesDataResponseEntity toCitiesDataResponseEntity(
  CitiesDataResponseDto dto,
) => CitiesDataResponseEntity(
  id: dto.id,
  governorateNameAr: dto.governorateNameAr,
  governorateNameEn: dto.governorateNameEn,
);

AreaResponseEntity toAreaResponseEntity(AreaResponseDto dto) =>
    AreaResponseEntity(
      data: dto.data?.map((e) => toAreaDataResponseEntity(e)).toList(),
    );

AreaDataResponseEntity toAreaDataResponseEntity(AreaDataResponseDto dto) =>
    AreaDataResponseEntity(
      id: dto.id,
      cityNameAr: dto.cityNameAr,
      cityNameEn: dto.cityNameEn,
      governorateId: dto.governorateId,
    );
