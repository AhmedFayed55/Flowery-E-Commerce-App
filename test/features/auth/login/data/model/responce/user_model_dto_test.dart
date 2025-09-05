import 'package:flowers_ecommerce_app/features/auth/login/data/model/responce/user_model_dto.dart';
import 'package:flowers_ecommerce_app/features/auth/login/domain/entities/user_entitiy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when use toDomain should return userEntity', () {
    UserModelDto userModelDto = const UserModelDto(
      id: '',
      firstName: 'yahya',
      lastName: 'mohamed',
      email: 'yahya22@',
      gender: 'male',
      phone: '',
      photo: '',
      role: '',
      wishlist: [],
      addresses: [],
      createdAt: '',
    );
    UserLoginEntity userEntity = const UserLoginEntity(
      firstName: 'yahya',
      lastName: 'mohamed',
      email: 'yahya22@',
      gender: 'male',
      phone: '',
      photo: '',
      wishlist: [],
      addresses: [],
    );

    var result = userModelDto.toDomain();
    expect(result, equals(userEntity));
  });
}
