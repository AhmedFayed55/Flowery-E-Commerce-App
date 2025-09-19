sealed class AddToCartEvent {
  AddToCartEvent();
}

class AddProductToCart extends AddToCartEvent {
  String productId;
  AddProductToCart(this.productId);
}
