import 'package:flowers_ecommerce_app/features/profile/data/model/user_response_dto.dart';

abstract class GetUserDataDataSource {
  Future<UserResponseProfileDto> getUserDataSource();
}
