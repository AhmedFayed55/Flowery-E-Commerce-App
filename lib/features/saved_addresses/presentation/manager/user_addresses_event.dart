sealed class UserAddressesEvent {}

class GetUserAddressesEvent extends UserAddressesEvent {}

class RemoveAddressEvent extends UserAddressesEvent {
  final String id;

  RemoveAddressEvent(this.id);
}
