import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/data/repository_impl/upload_photo_repo_impl.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/upload_photo_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/data/datasources/remote/upload_photo_remote_ds.dart';

import 'upload_photo_repo_impl_test.mocks.dart';

@GenerateMocks([UploadPhotoRemoteDataSourceContract])
void main() {
  late UploadPhotoRepoImpl uploadPhotoRepoImpl;
  late UploadPhotoEntity uploadPhotoEntity;
  late File file;
  late MockUploadPhotoRemoteDataSourceContract
  mockUploadPhotoRemoteDataSourceContract;

  setUp(() {
    String message = "Success";
    file = File("file");
    uploadPhotoEntity = UploadPhotoEntity(message: message);
    mockUploadPhotoRemoteDataSourceContract =
        MockUploadPhotoRemoteDataSourceContract();
    uploadPhotoRepoImpl = UploadPhotoRepoImpl(
      uploadPhotoRemoteDataSource: mockUploadPhotoRemoteDataSourceContract,
    );
  });

  group("Test uploadPhotoRepoImpl in Domain_Layer", () {
    /// Success
    test("success case for uploadPhoto with ApiSuccessResult", () async {
      // Arrange
      var mockSuccessResult = ApiSuccessResult<UploadPhotoEntity>(
        data: uploadPhotoEntity,
      );

      provideDummy<ApiResult<UploadPhotoEntity>>(mockSuccessResult);

      when(
        mockUploadPhotoRemoteDataSourceContract.uploadPhoto(file),
      ).thenAnswer((_) async => mockSuccessResult);

      // Act
      var result = await uploadPhotoRepoImpl.uploadPhoto(file);
      // Assert
      expect(result, isA<ApiSuccessResult<UploadPhotoEntity>>());
      ApiSuccessResult<UploadPhotoEntity> successResult =
          result as ApiSuccessResult<UploadPhotoEntity>;
      expect(successResult.data.message, equals(uploadPhotoEntity.message));
      verify(
        mockUploadPhotoRemoteDataSourceContract.uploadPhoto(file),
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

      var mockErrorResult = ApiErrorResult<UploadPhotoEntity>(failure: failure);
      provideDummy<ApiResult<UploadPhotoEntity>>(mockErrorResult);

      /// Arrange
      when(
        mockUploadPhotoRemoteDataSourceContract.uploadPhoto(file),
      ).thenAnswer((_) async => mockErrorResult);

      /// Act
      var result = await uploadPhotoRepoImpl.uploadPhoto(file);

      /// Assert
      expect(result, isA<ApiErrorResult<UploadPhotoEntity>>());
      ApiErrorResult<UploadPhotoEntity> errorResult =
          result as ApiErrorResult<UploadPhotoEntity>;
      expect(errorResult.failure.errorMessage, equals(dioException.message));

      verify(
        mockUploadPhotoRemoteDataSourceContract.uploadPhoto(file),
      ).called(1);
    });
  });
}
