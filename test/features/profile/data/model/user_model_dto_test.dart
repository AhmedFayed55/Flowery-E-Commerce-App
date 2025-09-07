import 'package:flowers_ecommerce_app/features/profile/data/model/user_model_profile_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('verify convert usermodelDto to userModelEntity', () {
    UserModelProfileDto mockUserModelDto = UserModelProfileDto(
      id: 'id',
      firstName: 'firstName',
      lastName: 'lastName',
      email: 'email',
      gender: 'gender',
      phone: 'phone',
      photo: 'photo',
      role: 'role',
      wishlist: [],
      addresses: [],
      createdAt: DateTime.now(),
    );
    var result = mockUserModelDto.toDomain();
    expect(result, isA<UserProfileEntity>());
    expect(result.email, 'email');
    expect(result.firstName, 'firstName');
    expect(result.lastName, 'lastName');
  });
}
