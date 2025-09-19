import 'dart:io';

class EditProfileState {
  bool isLoading;
  bool isSuccess;
  bool isError;
  File? pickedImage;

  EditProfileState({
    required this.isLoading,
    required this.isError,
    required this.isSuccess,
    required this.pickedImage,
  });

  factory EditProfileState.initial() {
    return EditProfileState(
      isLoading: false,
      isError: false,
      isSuccess: false,
      pickedImage: null,
    );
  }

  EditProfileState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    File? pickedImage,
  }) {
    return EditProfileState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      pickedImage: pickedImage ?? this.pickedImage,
    );
  }
}
