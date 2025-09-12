import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/edit_profile_request.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/edit_profile_response_entity.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/user_dto_entity.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/usecases/edit_profile_usecase.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/usecases/upload_photo_usecase.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/cubit/edit_profile_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_profile_cubit_test.mocks.dart';

@GenerateMocks([EditProfileUseCase, UploadPhotoUseCase])
void main() {
  late MockEditProfileUseCase mockEditProfileUseCase;
  late MockUploadPhotoUseCase mockUploadPhotoUseCase;
  late UserDtoEntity user;
  late String message;
  "Success";
  late EditProfileResponseEntity editProfileResponseEntity;
  late EditProfileCubit editProfileCubit;
  late EditProfileRequest editProfileRequest;

  setUp(() {});
  mockEditProfileUseCase = MockEditProfileUseCase();
  message = "Success";
  user = UserDtoEntity(id: "id");
  editProfileResponseEntity = EditProfileResponseEntity(
    message: message,
    user: user,
  );
  mockUploadPhotoUseCase = MockUploadPhotoUseCase();
  editProfileRequest = EditProfileRequest(
    firstName: "firstName",
    lastName: "lastName",
    email: "email",
    phoneNumber: "phoneNumber",
  );
  editProfileCubit = EditProfileCubit(
    editProfileUseCase: mockEditProfileUseCase,
    uploadPhotoUseCase: mockUploadPhotoUseCase,
  );

  group("Test Cases emits for EditProfileEvent", () {
    ///Success
    test(
      "Success Case emits ( loading + success + error ) states for EditProfileEvent",
      () async {
        // Arrange

        var mockSuccessResult = ApiSuccessResult<EditProfileResponseEntity>(
          data: editProfileResponseEntity,
        );
        provideDummy<ApiResult<EditProfileResponseEntity>>(mockSuccessResult);

        when(
          mockEditProfileUseCase.call(editProfileRequest),
        ).thenAnswer((_) async => mockSuccessResult);

        // Act
        await editProfileCubit.doIntent(
          UpdateProfileEvent(editProfileRequest: editProfileRequest),
        );
        // Assert

        expect(editProfileCubit.state.isLoading, false);
        expect(editProfileCubit.state.isError, false);
        expect(editProfileCubit.state.isSuccess, true);

        verify(mockEditProfileUseCase.call(editProfileRequest)).called(1);
      },
    );

    /// Error
    test(
      "Error Case emits ( loading + success + error ) states for EditProfileEvent",
      () async {
        // Arrange
        String errorMessage = "Error";
        Failure failure = Failure(errorMessage: errorMessage);
        var mockErrorResult = ApiErrorResult<EditProfileResponseEntity>(
          failure: failure,
        );
        provideDummy<ApiResult<EditProfileResponseEntity>>(mockErrorResult);

        when(
          mockEditProfileUseCase.call(editProfileRequest),
        ).thenAnswer((_) async => mockErrorResult);

        // Act
        await editProfileCubit.doIntent(
          UpdateProfileEvent(editProfileRequest: editProfileRequest),
        );
        // Assert

        expect(editProfileCubit.state.isLoading, false);
        expect(editProfileCubit.state.isSuccess, false);
        expect(editProfileCubit.state.isError, true);

        verify(mockEditProfileUseCase.call(editProfileRequest)).called(1);
      },
    );
  });
}
