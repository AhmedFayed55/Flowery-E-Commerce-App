import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/auth/login/data/model/responce/user_model_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/data/model/user_response_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/data/remot_data_source/get_user_data_ds_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_data_ds_imp_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  test(
    'when call getUserDataSource it should call userData from ApiServices',
    () async {
      MockApiServices mockApiServices = MockApiServices();
      GetUserDataDataSourceImp mockgetUserDataDataSourceImp =
          GetUserDataDataSourceImp(mockApiServices);
      UserModelDto mockUserModelDto = const UserModelDto(
        id: '',
        firstName: 'firstName',
        lastName: 'lastName',
        email: 'email',
        gender: 'gender',
        phone: 'phone',
        photo: 'photo',
        role: 'role',
        wishlist: [],
        addresses: [],
        createdAt: '',
      );
      UserResponseDto mockUserResponceDto = UserResponseDto(
        message: '',
        user: mockUserModelDto,
      );
      when(
        mockApiServices.userData(),
      ).thenAnswer((_) async => mockUserResponceDto);
      var result = await mockgetUserDataDataSourceImp.getUserDataSource();
      verify(mockApiServices.userData()).called(1);
      expect(result, isA<UserResponseDto>());
    },
  );
}
