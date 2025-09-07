import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/pages/widgets/orders_bloc_builder.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/pages/widgets/orders_filter.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/view_model/cubit/orders_cubit.dart';
import 'package:flowers_ecommerce_app/features/orders/presentation/view_model/cubit/orders_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersBody extends StatefulWidget {
  const OrdersBody({super.key});

  @override
  State<OrdersBody> createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {

  @override
  void initState() {
    context.read<OrdersCubit>().doIntent(GetOrdersEvent());
    super.initState();
  }
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
     var trans = AppLocalizations.of(context)!;
    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: OrdersFilter(
                    isSelected: selectedIndex == 0,
                    text: trans.active,
                  ),
                ),
              ),

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: OrdersFilter(
                    isSelected: selectedIndex == 1,
                    text: trans.completed,
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(8.h),

        OrdersBlocBuilder(selectedIndex: selectedIndex,),
      ],
    );
  }
}
