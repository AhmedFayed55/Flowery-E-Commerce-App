import 'package:equatable/equatable.dart';

class ChangePasswordState extends Equatable {
  final String? errorMessage;
  final bool isSuccess;
  final bool isLoading;

  const ChangePasswordState({
    this.errorMessage,
    this.isSuccess = false,
    this.isLoading = false,
  });

  ChangePasswordState copyWith({
    String? errorMessage,
    bool? isSuccess,
    bool? isLoading,
  }) {
    return ChangePasswordState(
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [errorMessage, isSuccess, isLoading];
}
