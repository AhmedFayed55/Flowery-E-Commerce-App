part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;

  final String? errorMessage;

  const RegisterState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.errorMessage = '',
  });

  RegisterState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, isFailure, errorMessage];
}
