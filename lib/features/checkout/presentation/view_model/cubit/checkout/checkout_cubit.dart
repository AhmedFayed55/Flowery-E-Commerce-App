import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/entities/address.dart';
import 'package:flowers_ecommerce_app/features/checkout/domin/usecase/get_logged_user_addresses_usecase.dart';
import 'package:flowers_ecommerce_app/features/checkout/presentation/view_model/cubit/checkout/checkout_event.dart';
import 'package:injectable/injectable.dart';

part 'checkout_state.dart';

@injectable
class CheckoutCubit extends Cubit<CheckoutState> {
  final GetLoggedUserAddressesUsecase getLoggedUserAddressesUsecase;

  CheckoutCubit(this.getLoggedUserAddressesUsecase)
    : super(const CheckoutState());

  void doIntent(CheckoutEvent event) {
    switch (event) {
      case PlaceOrder():
        placeOrder();
      case ToggleGift():
        toggleGift(event.value);
      case UpdateGiftStreet():
        updateGiftStreet(event.street);
      case UpdateGiftPhone():
        updateGiftPhone(event.phone);
      case UpdateGiftCity():
        updateGiftCity(event.city);
      case SelectPaymentMethod():
        selectPaymentMethod(event.method);
      case SelectAddress():
        selectAddress(event.address);
      case GetLoggedUserAddresses():
        getLoggedUserAddresses();
    }
  }

  Future<void> getLoggedUserAddresses() async {
    emit(state.copyWith(isLoading: true));
    final result = await getLoggedUserAddressesUsecase.invok();
    switch (result) {
      case ApiSuccessResult<List<Address>>():
        emit(state.copyWith(isLoading: false, addresses: result.data));
        break;
      case ApiErrorResult<List<Address>>():
        emit(state.copyWith(isLoading: false));
        break;
    }
  }

  void selectAddress(Address address) {
    emit(state.copyWith(selectedAddress: address));
  }

  void selectPaymentMethod(PaymentMethod method) {
    emit(state.copyWith(selectedPaymentMethod: method));
  }

  void toggleGift(bool value) {
    emit(
      state.copyWith(
        isGift: value,
        selectedPaymentMethod: value ? PaymentMethod.creditCard : null,

        giftStreet: '',
        giftPhone: '',
        giftCity: '',
      ),
    );
  }

  void updateGiftStreet(String name) {
    emit(state.copyWith(giftStreet: name));
  }

  void updateGiftPhone(String phone) {
    emit(state.copyWith(giftPhone: phone));
  }

  void updateGiftCity(String city) {
    emit(state.copyWith(giftCity: city));
  }

  Future<void> placeOrder() async {
    if (!state.isGift && state.selectedAddress == null) {
      return;
    }

    if (state.isGift &&
        (state.giftStreet == null ||
            state.giftStreet!.isEmpty ||
            state.giftPhone == null ||
            state.giftPhone!.isEmpty ||
            state.giftCity == null ||
            state.giftCity!.isEmpty)) {
      return;
    }

    if (state.selectedPaymentMethod == null) {
      emit(state.copyWith());
      return;
    }

    emit(state.copyWith(isSubmitting: true));

    if (state.isGift) {
      log(
        " Gift Order for: ${state.giftStreet}, Phone: ${state.giftPhone}, Address: ${state.giftCity}",
      );
    } else {
      log(" Delivery to Address: ${state.selectedAddress!.city}");
    }
    log(" Payment Method: ${state.selectedPaymentMethod}");

    emit(state.copyWith(isSubmitting: false));
  }
}
