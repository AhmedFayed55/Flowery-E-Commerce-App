import 'package:equatable/equatable.dart';

class AddToCartState extends Equatable {
  final bool isSucsses;
  final String errorMsg;

  const AddToCartState({this.isSucsses = false, this.errorMsg = ''});

  AddToCartState copyWith({bool? isSucsses, String? errorMsg}) {
    return AddToCartState(
      isSucsses: isSucsses ?? this.isSucsses,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [isSucsses, errorMsg];
}
