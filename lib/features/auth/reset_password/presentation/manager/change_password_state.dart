import 'package:equatable/equatable.dart';

class ChangePasswordState extends Equatable{
  String? errorMessage;
  bool isSuccess = false;
  bool isLoading = false;

  ChangePasswordState({
    this.errorMessage,
    this.isSuccess = false,
    this.isLoading = false,
  });

  ChangePasswordState copyWith({
    String? errorMessage,
    bool? isSuccess,
    bool? isLoading,
  }){
    return ChangePasswordState(
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
    );
  }
  @override
  List<Object?> get props => [errorMessage, isSuccess, isLoading];
}