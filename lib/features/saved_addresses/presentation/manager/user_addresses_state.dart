import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/entities/user_address_data_entity.dart';

class UserAddressesState extends Equatable {
  final bool isLoadingGetAddresses;
  final bool isLoadingRemoveAddress;
  final bool isSuccessGetAddresses;
  final bool isSuccessRemoveAddress;
  final List<UserAddressDataEntity> addresses;
  final String? errorGetAddresses;
  final String? errorRemoveAddress;

  const UserAddressesState({
    this.isLoadingGetAddresses = false,
    this.isLoadingRemoveAddress = false,
    this.isSuccessGetAddresses = false,
    this.isSuccessRemoveAddress = false,
    this.addresses = const [],
    this.errorGetAddresses,
    this.errorRemoveAddress,
  });

  UserAddressesState copyWith({
    bool? isLoadingGetAddresses,
    bool? isLoadingRemoveAddress,
    bool? isSuccessGetAddresses,
    bool? isSuccessRemoveAddress,
    List<UserAddressDataEntity>? addresses,
    String? errorGetAddresses,
    String? errorRemoveAddress,
  }) {
    return UserAddressesState(
      addresses: addresses ?? this.addresses,
      errorGetAddresses: errorGetAddresses ?? this.errorGetAddresses,
      errorRemoveAddress: errorRemoveAddress ?? this.errorRemoveAddress,
      isLoadingGetAddresses:
          isLoadingGetAddresses ?? this.isLoadingGetAddresses,
      isLoadingRemoveAddress:
          isLoadingRemoveAddress ?? this.isLoadingRemoveAddress,
      isSuccessGetAddresses:
          isSuccessGetAddresses ?? this.isSuccessGetAddresses,
      isSuccessRemoveAddress:
          isSuccessRemoveAddress ?? this.isSuccessRemoveAddress,
    );
  }

  @override
  List<Object?> get props => [
    isLoadingGetAddresses,
    isLoadingRemoveAddress,
    isSuccessGetAddresses,
    isSuccessRemoveAddress,
    addresses,
    errorGetAddresses,
    errorRemoveAddress,
  ];
}
