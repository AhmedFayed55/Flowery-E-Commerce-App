import 'package:flowers_ecommerce_app/features/saved_addresses/data/models/user_address_data_dto.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/entities/user_address_data_entity.dart';

UserAddressDataEntity toUserAddressDataEntity(UserAddressDataDto dto) =>
    UserAddressDataEntity(
      id: dto.id,
      username: dto.username,
      street: dto.street,
      city: dto.city,
      phone: dto.phone,
      long: dto.long,
      lat: dto.lat,
    );
