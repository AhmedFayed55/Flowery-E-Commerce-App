import 'package:flowers_ecommerce_app/features/auth/forget_password/datasource/models/forget_pass_model.dart';

class ForgetPasswordState {
  final bool isLoadingState;
  final bool isSuccessState;
  final bool isErrorState;
  final String errorMessage;

  ForgetPasswordState({
    this.isErrorState = false,
    this.isSuccessState = false,
    this.errorMessage = "",
    this.isLoadingState = false,
  });

  factory ForgetPasswordState.initial() {
    return ForgetPasswordState(
      isErrorState: false,
      isLoadingState: false,
      isSuccessState: false,
      errorMessage: "",
    );
  }

  ForgetPasswordState copyWith({
    bool? isLoadingState,
    bool? isErrorState,
    bool? isSuccessState,
    String? errorMessage,
  }) {
    return ForgetPasswordState(
      isLoadingState: isLoadingState ?? this.isLoadingState,
      isErrorState: isErrorState ?? this.isErrorState,

      isSuccessState: isSuccessState ?? this.isSuccessState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
