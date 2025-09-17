import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/user_entity.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/repo/get_user_data_repo.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/usecase/get_user_data_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_data_use_case_test.mocks.dart';

@GenerateMocks([GetUserDataRepo])
void main() {
  test(
    'verify when call getUserProfileUseCase is should call getUserRepo',
    () async {
      MockGetUserDataRepo mockGetUserDataRepo = MockGetUserDataRepo();
      GetUserDataUseCase mockGetUserUseCase = GetUserDataUseCase(
        mockGetUserDataRepo,
      );
      UserProfileEntity mockUserProfileEntity = UserProfileEntity(
        id: 'id',
        firstName: 'firstName',
        lastName: 'lastName',
        email: 'email',
        gender: 'gender',
        phone: 'phone',
        photo: 'photo',
        wishlist: [],
        addresses: [],
      );
      var expectResult = ApiSuccessResult<UserProfileEntity>(
        data: mockUserProfileEntity,
      );
      provideDummy<ApiResult<UserProfileEntity>>(expectResult);
      when(
        mockGetUserDataRepo.getUserDataRepo(),
      ).thenAnswer((_) async => expectResult);
      var result = await mockGetUserUseCase.call();
      verify(mockGetUserDataRepo.getUserDataRepo()).called(1);
      expect(result, isA<ApiSuccessResult<UserProfileEntity>>());
    },
  );
}
