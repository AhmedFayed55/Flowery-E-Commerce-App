class EditProfileState {
  bool isLoading;
  bool isSuccess;
  bool isError;

  EditProfileState({
    required this.isLoading,
    required this.isError,
    required this.isSuccess,
  });

  factory EditProfileState.initial() {
    return EditProfileState(isLoading: false, isError: false, isSuccess: false);
  }

  EditProfileState copyWith({bool? isLoading, bool? isSuccess, bool? isError}) {
    return EditProfileState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
    );
  }
}
