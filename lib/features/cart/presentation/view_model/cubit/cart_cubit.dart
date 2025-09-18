import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/cart/data/models/updeate_cart_prouduct_quantity_body.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/user_cart.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/usecase/delete_cart_usecase.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/usecase/get_user_carts_usecase.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/usecase/updeate_cart_product_quantity_usecase.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/view_model/cubit/cart_event.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  GetUserCartsUsecase getUserCartsUsecase;
  DeleteCartUsecase deleteCartUsecase;
  UpdeateCartProductQuantityUsecase updeateCartProductQuantityUsecase;

  CartCubit(
    this.getUserCartsUsecase,
    this.deleteCartUsecase,
    this.updeateCartProductQuantityUsecase,
  ) : super(CartState());

  void doIntent(CartEvent event) {
    switch (event) {
      case LoadUserCartEvent():
        _getUserCarts();
        break;
      case DeleteCartItemEvent():
        _deleteCart(event.id);
        break;
      case UpdeateCartItemQuantityEvent():
        _updateCartProductQuantity(
          event.id,
          UpdeateCartProuductQuantityBody(quantity: event.quantity),
        );
        break;
    }
  }

  Future<void> _getUserCarts() async {
    emit(state.copyWith(isLoading: true));
    final result = await getUserCartsUsecase.invok();
    switch (result) {
      case ApiSuccessResult():
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            userCart: result.data,
          ),
        );
        break;
      case ApiErrorResult():
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: result.failure.errorMessage,
          ),
        );
        break;
    }
  }

  Future<void> _deleteCart(String cartId) async {
    state.userCart!.cart.cartItems!.removeWhere(
      (item) => item.product!.id == cartId,
    );
    state.userCart!.cart.totalPrice = state.userCart!.cart.cartItems!.fold(
      0,
      (sum, item) => sum! + (item.quantity! * item.product!.price!),
    );

    emit(state.copyWith(isCartLoading: true));

    final result = await deleteCartUsecase.invok(cartId);
    switch (result) {
      case ApiSuccessResult():
        emit(state.copyWith(isCartRemoved: true, isCartLoading: false));
        break;
      case ApiErrorResult():
        emit(
          state.copyWith(
            userCart: state.userCart,
            isCartRemovedFailure: true,
            isCartLoading: false,
          ),
        );
        break;
    }
  }

  Future<void> _updateCartProductQuantity(
    String cartId,
    UpdeateCartProuductQuantityBody quantity,
  ) async {
    if (quantity.quantity! <= 0) {
      _deleteCart(cartId);
      return;
    }
    var oldQuantity = 0;
    state.userCart!.cart.cartItems!
            .firstWhere((item) => item.product!.id == cartId)
            .quantity =
        quantity.quantity;

    state.userCart!.cart.totalPrice = state.userCart!.cart.cartItems!.fold(
      0,
      (sum, item) => sum! + (item.quantity! * item.product!.price!),
    );

    emit(state.copyWith(isCartQuantityUpdatedLoading: true));

    final result = await updeateCartProductQuantityUsecase.invok(
      cartId,
      quantity,
    );
    switch (result) {
      case ApiSuccessResult():
        emit(
          state.copyWith(
            isCartQuantityUpdated: true,
            isCartQuantityUpdatedLoading: false,
            userCart: state.userCart,
          ),
        );
        break;
      case ApiErrorResult():
        state.userCart!.cart.cartItems!
                .firstWhere((item) => item.product!.id == cartId)
                .quantity =
            oldQuantity;
        emit(
          state.copyWith(
            isCartQuantityUpdatedFailure: true,
            isCartQuantityUpdatedLoading: false,
            userCart: state.userCart,
          ),
        );
        break;
    }
  }
}
