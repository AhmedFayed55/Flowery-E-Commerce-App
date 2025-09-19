import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/data/datasources/remote/edit_profile_remote_ds.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/edit_profile_response_entity.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/repository/edti_profile.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepositoryContract)
class EditProfileRepositoryImpl implements EditProfileRepositoryContract {
  EditProfileRemoteDataSource editProfileRemoteDataSource;

  EditProfileRepositoryImpl({required this.editProfileRemoteDataSource});

  @override
  Future<ApiResult<EditProfileResponseEntity>> editProfile(
    editProfileRequest,
  ) async {
    ApiResult<EditProfileResponseEntity> result =
        await editProfileRemoteDataSource.editProfile(editProfileRequest);
    return result;
  }
}
