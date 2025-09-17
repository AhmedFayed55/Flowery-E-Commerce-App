import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/profile/data/model/user_model_profile_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/data/model/user_response_dto.dart';
import 'package:flowers_ecommerce_app/features/profile/data/remot_data_source/get_user_data_ds.dart';
import 'package:flowers_ecommerce_app/features/profile/data/repo/get_user_data_repo_imp.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_data_repo_imp_test.mocks.dart';

@GenerateMocks([GetUserDataDataSource])
void main() {
  group('verify profile repo', () {
    MockGetUserDataDataSource mockGetUserDataDataSource =
        MockGetUserDataDataSource();
    GetUserDataRepoImp getUserDataRepo = GetUserDataRepoImp(
      mockGetUserDataDataSource,
    );
    UserModelProfileDto mockUserModelProfileDto = UserModelProfileDto(
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

    UserResponseProfileDto mockUserResponceProfileDto = UserResponseProfileDto(
      message: "message",
      user: mockUserModelProfileDto,
    );

    test(
      'verify when call getUserRepo is should call GetUserDataSource on success',
      () async {
        when(
          mockGetUserDataDataSource.getUserDataSource(),
        ).thenAnswer((_) async => mockUserResponceProfileDto);
        var result = await getUserDataRepo.getUserDataRepo();
        verify(mockGetUserDataDataSource.getUserDataSource()).called(1);
        expect(result, isA<ApiSuccessResult<UserProfileEntity>>());
      },
    );
    test(
      'verify when call getUserRepo is should call GetUserDataSource on error',
      () async {
        when(
          mockGetUserDataDataSource.getUserDataSource(),
        ).thenThrow(Exception("something wrong"));
        var result = await getUserDataRepo.getUserDataRepo();
        verify(mockGetUserDataDataSource.getUserDataSource()).called(1);
        expect(result, isA<ApiErrorResult<UserProfileEntity>>());
      },
    );
  });
}
