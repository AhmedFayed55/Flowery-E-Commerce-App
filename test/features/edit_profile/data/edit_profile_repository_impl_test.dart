import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/data/datasources/remote/edit_profile_remote_ds.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/data/repository_impl/edit_profile_repository_impl.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/edit_profile_request.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/edit_profile_response_entity.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/user_dto_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'edit_profile_repository_impl_test.mocks.dart';

@GenerateMocks([EditProfileRemoteDataSource])
void main() {
  late EditProfileRepositoryImpl editProfileRepositoryImpl;
  late EditProfileRequest editProfileRequest;
  late EditProfileResponseEntity editProfileResponseEntity;
  late MockEditProfileRemoteDataSource mockEditProfileRemoteDataSource;

  setUp(() {
    String message = "Success";
    UserDtoEntity user = UserDtoEntity();
    editProfileRequest = EditProfileRequest(
      firstName: "firstName",
      lastName: "lastName",
      email: "email",
      phoneNumber: "phoneNumber",
    );
    mockEditProfileRemoteDataSource = MockEditProfileRemoteDataSource();
    editProfileResponseEntity = EditProfileResponseEntity(
      message: message,
      user: user,
    );
    editProfileRepositoryImpl = EditProfileRepositoryImpl(
      editProfileRemoteDataSource: mockEditProfileRemoteDataSource,
    );
  });

  group("Test editProfileRepositoryImpl in Domain_Layer", () {
    /// Success
    test("success case for editProfile with ApiSuccessResult", () async {
      // Arrange

      var mockSuccessResult = ApiSuccessResult<EditProfileResponseEntity>(
        data: editProfileResponseEntity,
      );
      provideDummy<ApiResult<EditProfileResponseEntity>>(mockSuccessResult);

      when(
        mockEditProfileRemoteDataSource.editProfile(editProfileRequest),
      ).thenAnswer((_) async => mockSuccessResult);

      // Act
      var result = await editProfileRepositoryImpl.editProfile(
        editProfileRequest,
      );
      // Assert
      expect(result, isA<ApiSuccessResult<EditProfileResponseEntity>>());
      ApiSuccessResult<EditProfileResponseEntity> successResult =
          result as ApiSuccessResult<EditProfileResponseEntity>;
      expect(
        successResult.data.message,
        equals(editProfileResponseEntity.message),
      );
      verify(
        mockEditProfileRemoteDataSource.editProfile(editProfileRequest),
      ).called(1);
    });

    /// Error
    test("Error case for editProfile with ApiErrorResult", () async {
      const String errorMessage = "Error message";
      Failure failure = Failure(errorMessage: errorMessage);
      final dioException = DioException(
        requestOptions: RequestOptions(),
        message: errorMessage,
      );

      var mockErrorResult = ApiErrorResult<EditProfileResponseEntity>(
        failure: failure,
      );
      provideDummy<ApiResult<EditProfileResponseEntity>>(mockErrorResult);

      /// Arrange
      when(
        mockEditProfileRemoteDataSource.editProfile(editProfileRequest),
      ).thenAnswer((_) async => mockErrorResult);

      /// Act
      var result = await editProfileRepositoryImpl.editProfile(
        editProfileRequest,
      );

      /// Assert
      expect(result, isA<ApiErrorResult<EditProfileResponseEntity>>());
      ApiErrorResult<EditProfileResponseEntity> errorResult =
          result as ApiErrorResult<EditProfileResponseEntity>;
      expect(errorResult.failure.errorMessage, equals(dioException.message));

      verify(
        mockEditProfileRemoteDataSource.editProfile(editProfileRequest),
      ).called(1);
    });
  });
}
