import 'dart:io';

import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/upload_photo_entity.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/repository/upload_photo_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadPhotoUseCase {
  UploadPhotoRepoContract uploadPhotoRepoContract;

  UploadPhotoUseCase({required this.uploadPhotoRepoContract});

  Future<ApiResult<UploadPhotoEntity>> call(File file) async {
    var result = await uploadPhotoRepoContract.uploadPhoto(file);
    return result;
  }
}
