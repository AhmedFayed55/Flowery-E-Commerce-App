import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/edit_profile_request.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/edit_profile_response_entity.dart';

abstract class EditProfileRepositoryContract {
  Future<ApiResult<EditProfileResponseEntity>> editProfile(
    EditProfileRequest editProfileRequest,
  );
}
