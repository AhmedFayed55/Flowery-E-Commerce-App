part of 'cart_cubit.dart';

// ignore: must_be_immutable
class CartState extends Equatable {
  bool isSuccess = false;
  bool isLoading = false;
  String errorMessage = '';
  UserCart? userCart;

  bool isCartRemoved = false;
  bool isCartRemovedFailure = false;
  bool isCartLoading = false;

  bool isCartQuantityUpdated = false;
  bool isCartQuantityUpdatedFailure = false;
  bool isCartQuantityUpdatedLoading = false;

  CartState({
    this.isSuccess = false,
    this.isLoading = false,
    this.errorMessage = '',
    this.userCart,
    this.isCartRemoved = false,
    this.isCartRemovedFailure = false,
    this.isCartQuantityUpdated = false,
    this.isCartQuantityUpdatedFailure = false,
    this.isCartLoading = false,
    this.isCartQuantityUpdatedLoading = false,
  });

  copyWith({
    bool? isSuccess,
    bool? isLoading,
    String? errorMessage,
    UserCart? userCart,
    bool? isCartRemoved,
    bool? isCartRemovedFailure,
    bool? isCartQuantityUpdated,
    bool? isCartQuantityUpdatedFailure,
    bool? isCartLoading,
    bool? isCartQuantityUpdatedLoading,
  }) {
    return CartState(
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      userCart: userCart ?? this.userCart,
      isCartRemoved: isCartRemoved ?? this.isCartRemoved,
      isCartRemovedFailure: isCartRemovedFailure ?? this.isCartRemovedFailure,
      isCartQuantityUpdated:
          isCartQuantityUpdated ?? this.isCartQuantityUpdated,
      isCartQuantityUpdatedFailure:
          isCartQuantityUpdatedFailure ?? this.isCartQuantityUpdatedFailure,
      isCartLoading: isCartLoading ?? this.isCartLoading,
      isCartQuantityUpdatedLoading:
          isCartQuantityUpdatedLoading ?? this.isCartQuantityUpdatedLoading,
    );
  }

  @override
  List<Object?> get props => [
    isSuccess,
    isLoading,
    errorMessage,
    userCart,
    isCartRemoved,
    isCartRemovedFailure,
    isCartQuantityUpdated,
    isCartQuantityUpdatedFailure,
    isCartLoading,
    isCartQuantityUpdatedLoading,
  ];
}
