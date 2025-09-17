import 'package:equatable/equatable.dart';

class LogoutState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMsg;

  const LogoutState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMsg,
  });

  LogoutState copyWith({String? errorMsg, bool? isLoading, bool? isSuccess}) {
    return LogoutState(
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, errorMsg];
}
