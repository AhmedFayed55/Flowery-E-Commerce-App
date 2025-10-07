import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_card_entity.dart';
import 'package:flowers_ecommerce_app/features/payment/domain/entities/payment_cash_entity.dart';

// ignore: must_be_immutable
class TrackOrderState extends Equatable {
  bool isLoading;
  String errorMessage;
  bool isSuccessCash;
  TrackOrderState({
    this.isSuccessCash = false,
    this.isLoading = false,
    this.errorMessage = '',
  });
  TrackOrderState copyWith({
    bool? isSuccessCash,
    bool? isLoading,
    String? errorMessage,
    PaymentCardEntity? paymentCardEntity,
    PaymentCashEntity? paymentCashEntity,
  }) {
    return TrackOrderState(
      isSuccessCash: isSuccessCash ?? this.isSuccessCash,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, isSuccessCash];
}
