import 'dart:io';

import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/data/datasources/remote/upload_photo_remote_ds_impl.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/data/models/response/upload_photo_response.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/upload_photo_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../feature/forget_password/data/email_verify_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  late MockApiServices mockApiServices;
  late File file;
  late String message;
  late String errorMessage;
  late UploadPhotoResponse uploadPhotoResponse;
  late UploadPhotoEntity uploadPhotoEntity;
  late UploadPhotoRemoteDataSourceImpl uploadPhotoRemoteDataSourceImpl;

  setUp(() {
    mockApiServices = MockApiServices();
    message = "success";
    errorMessage = "error";
    uploadPhotoResponse = UploadPhotoResponse(message: message);
    uploadPhotoEntity = UploadPhotoEntity(message: message);
    file = File("File");
    uploadPhotoRemoteDataSourceImpl = UploadPhotoRemoteDataSourceImpl(
      apiServices: mockApiServices,
    );
  });

  group("Test uploadPhotoRemoteDataSourceImpl in Data Layer", () {
    /// Success
    test("success case for uploadPhoto with ApiSuccessResult", () async {
      ///Arrange

      when(
        mockApiServices.uploadPhoto(file),
      ).thenAnswer((_) async => uploadPhotoResponse);

      ///Act

      var result = await uploadPhotoRemoteDataSourceImpl.uploadPhoto(file);

      ///Assert

      expect(result, isA<ApiSuccessResult<UploadPhotoEntity>>());
      ApiSuccessResult<UploadPhotoEntity> successResult =
          result as ApiSuccessResult<UploadPhotoEntity>;
      expect(successResult.data.message, equals(uploadPhotoEntity.message));

      verify(mockApiServices.uploadPhoto(file)).called(1);
    });

    /// Error
    test("Error case for uploadPhoto with ApiErrorResult", () async {
      Failure failure = Failure(
        errorMessage: Exception(errorMessage).toString(),
      );

      /// Arrange
      when(
        mockApiServices.uploadPhoto(file),
      ).thenThrow(Exception(errorMessage));

      /// Act
      var result = await uploadPhotoRemoteDataSourceImpl.uploadPhoto(file);

      /// Assert
      expect(result, isA<ApiErrorResult<UploadPhotoEntity>>());
      ApiErrorResult<UploadPhotoEntity> errorResult =
          result as ApiErrorResult<UploadPhotoEntity>;
      expect(errorResult.failure.errorMessage, equals(failure.errorMessage));

      verify(mockApiServices.uploadPhoto(file)).called(1);
    });
  });
}
