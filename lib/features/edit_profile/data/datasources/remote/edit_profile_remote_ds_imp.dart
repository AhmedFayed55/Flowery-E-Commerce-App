import 'package:dio/dio.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/core/network/api_services.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/data/models/response/edit_profile_response.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/edit_profile_response_entity.dart';
import 'package:injectable/injectable.dart';
import 'edit_profile_remote_ds.dart';

@Injectable(as: EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  ApiServices apiServices;

  EditProfileRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ApiResult<EditProfileResponseEntity>> editProfile(
    editProfileRequest,
  ) async {
    try {
      EditProfileResponse response = await apiServices.editProfile({
        "firstName": editProfileRequest.firstName,
        "lastName": editProfileRequest.lastName,
        "email": editProfileRequest.email,
        "phone": "+2${editProfileRequest.phoneNumber}",
      });
      EditProfileResponseEntity result = response.toEntity();
      return ApiSuccessResult<EditProfileResponseEntity>(data: result);
    } on DioException catch (dioError) {
      return ApiErrorResult<EditProfileResponseEntity>(
        failure: Failure(errorMessage: dioError.message ?? ""),
      );
    } catch (error) {
      return ApiErrorResult<EditProfileResponseEntity>(
        failure: Failure(errorMessage: error.toString()),
      );
    }
  }
}
