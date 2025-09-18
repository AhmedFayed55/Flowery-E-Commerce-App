import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/use_cases/get_all_addresses_use_case.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/domain/use_cases/remove_address_use_case.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/presentation/manager/user_addresses_event.dart';
import 'package:flowers_ecommerce_app/features/saved_addresses/presentation/manager/user_addresses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user_address_data_entity.dart';

@injectable
class UserAddressesCubit extends Cubit<UserAddressesState> {
  UserAddressesCubit(this._getAllAddressesUseCase, this._removeAddressUseCase)
    : super(const UserAddressesState());
  final GetAllAddressesUseCase _getAllAddressesUseCase;
  final RemoveAddressUseCase _removeAddressUseCase;

  doIntent(UserAddressesEvent event) {
    switch (event) {
      case GetUserAddressesEvent():
        return _getAllAddresses();
      case RemoveAddressEvent(:final id):
        return _removeAddress(id);
    }
  }

  Future<void> _removeAddress(String id) async {
    emit(
      state.copyWith(isLoadingRemoveAddress: true, errorRemoveAddress: null),
    );
    var result = await _removeAddressUseCase.invoke(id);
    switch (result) {
      case ApiSuccessResult<List<UserAddressDataEntity>>():
        emit(
          state.copyWith(
            isLoadingRemoveAddress: false,
            isSuccessRemoveAddress: true,
            addresses: result.data,
          ),
        );
        break;
      case ApiErrorResult<List<UserAddressDataEntity>>():
        emit(
          state.copyWith(
            isLoadingRemoveAddress: false,
            errorRemoveAddress: result.failure.errorMessage,
          ),
        );
        break;
    }
  }

  Future<void> _getAllAddresses() async {
    emit(state.copyWith(isLoadingGetAddresses: true, errorGetAddresses: null));
    var result = await _getAllAddressesUseCase.invoke();
    switch (result) {
      case ApiSuccessResult<List<UserAddressDataEntity>>():
        emit(
          state.copyWith(
            isLoadingGetAddresses: false,
            isSuccessGetAddresses: true,
            addresses: result.data,
          ),
        );
        break;
      case ApiErrorResult<List<UserAddressDataEntity>>():
        emit(
          state.copyWith(
            isLoadingGetAddresses: false,
            errorGetAddresses: result.failure.errorMessage,
          ),
        );
        break;
    }
  }
}
