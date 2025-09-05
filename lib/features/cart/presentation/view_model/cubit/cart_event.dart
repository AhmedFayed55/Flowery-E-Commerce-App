import 'package:equatable/equatable.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadUserCartEvent extends CartEvent {
  const LoadUserCartEvent();
}

class DeleteCartItemEvent extends CartEvent {
  final String id;
  const DeleteCartItemEvent(this.id);
}

class UpdeateCartItemQuantityEvent extends CartEvent {
  final String id;
  final int quantity;
  const UpdeateCartItemQuantityEvent(this.id, this.quantity);
}