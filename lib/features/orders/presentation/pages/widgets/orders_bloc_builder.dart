import 'package:flowers_ecommerce_app/features/orders/presentation/pages/widgets/orders_list_view.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/view_model/cubit/orders_cubit.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/view_model/cubit/orders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersBlocBuilder extends StatelessWidget {
  const OrdersBlocBuilder({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state.isLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .8,
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (state.isSuccess) {
          return OrdersListView(
            orders: selectedIndex == 0
                ? state.pendingOrders!
                : state.completedOrders!,
          );
        } else if (state.errorMessage != '') {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .8,
            child: Center(child: Text(state.errorMessage!)),
          );
        } else {
          return const Text("something went wrong");
        }
      },
    );
  }
}
