part of 'register_cubit.dart';


@immutable
// sealed class RegisterState {}

// final class RegisterInitial extends RegisterState {}
// final class RegisterSuccess extends RegisterState {}
// final class RegisterFailure extends RegisterState {
//   final String errorMessage;
//   RegisterFailure({required this.errorMessage});
// }
// final class RegisterLoading extends RegisterState {}

class RegisterState extends Equatable {
  bool isLoading = false;
  bool isSuccess = false;
  bool isFailure = false;

  String? errorMessage = ''; 

  RegisterState({
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
 }){
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