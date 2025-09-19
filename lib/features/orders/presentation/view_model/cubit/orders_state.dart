import 'package:equatable/equatable.dart';
import 'package:flowers_ecommerce_app/features/orders/domin/entites/order.dart';

class OrdersState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final String? errorMessage;
  final List<OrderEntity>? allOrders;
  final List<OrderEntity>? pendingOrders;
  final List<OrderEntity>? completedOrders;

  const OrdersState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.errorMessage,
    this.allOrders,
    this.pendingOrders,
    this.completedOrders,
  });

  OrdersState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    List<OrderEntity>? allOrders,
    List<OrderEntity>? pendingOrders,
    List<OrderEntity>? completedOrders,
  }) {
    return OrdersState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      errorMessage: errorMessage ?? this.errorMessage,
      allOrders: allOrders ?? this.allOrders,
      pendingOrders: pendingOrders ?? this.pendingOrders,
      completedOrders: completedOrders ?? this.completedOrders,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isSuccess,
    isFailure,
    errorMessage,
    allOrders,
    pendingOrders,
    completedOrders,
  ];
}
