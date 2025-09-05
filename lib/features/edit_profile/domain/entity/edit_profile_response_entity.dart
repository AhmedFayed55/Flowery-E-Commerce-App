import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/user_dto_entity.dart';

class EditProfileResponseEntity {
  final String message;
  final UserDtoEntity user;

  EditProfileResponseEntity({required this.message, required this.user});
}
