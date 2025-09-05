import 'package:bloc/bloc.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/edit_profile_request.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/entity/edit_profile_response_entity.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/domain/usecases/edit_profile_usecase.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/cubit/edit_profile_event.dart';
import 'package:flowers_ecommerce_app/features/edit_profile/presentation/cubit/edit_profile_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileUseCase editProfileUseCase;

  EditProfileCubit({required this.editProfileUseCase})
    : super(EditProfileState.initial());

  Future<void> doIntent(EditProfileEvent event) async {
    switch (event) {
      case UpdateProfileEvent():
        await _editProfile(event.editProfileRequest);
        break;
    }
  }

  Future<void> _editProfile(EditProfileRequest editProfileRequest) async {
    emit(state.copyWith(isLoading: true,isError: false,isSuccess: false));
    var result = await editProfileUseCase.call(editProfileRequest);
    switch (result) {
      case ApiSuccessResult<EditProfileResponseEntity>():
        emit(state.copyWith(isLoading: false, isSuccess: true));
      case ApiErrorResult<EditProfileResponseEntity>():
        emit(state.copyWith(isLoading: false, isError: true));
    }
  }
}
