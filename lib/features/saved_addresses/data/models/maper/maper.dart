import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/remove_address_data_dto.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/entities/remove_address_data_entity.dart';

RemoveAddressDataEntity toRemoveAddressDataEntity(RemoveAddressDataDto dto) =>
    RemoveAddressDataEntity(
      id: dto.id,
      username: dto.username,
      street: dto.street,
      city: dto.city,
      phone: dto.phone,
      long: dto.long,
      lat: dto.lat,
    );
