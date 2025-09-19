import 'package:flowers_ecommerce_app/config/routing/app_routes.dart';
import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/helpers/flutter_toast.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/payment/presentaion/page/webvieww_screen.dart';
import 'package:flowers_ecommerce_app/features/payment/presentaion/view_model/payment_cubit.dart';
import 'package:flowers_ecommerce_app/features/payment/presentaion/view_model/payment_event.dart';
import 'package:flowers_ecommerce_app/features/payment/presentaion/view_model/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PaymentCubit>(),
      child: Scaffold(
        body: BlocListener<PaymentCubit, PaymentState>(
          listener: (context, state) async {
            if (state.paymentCardEntity != null) {
              final url = state.paymentCardEntity!.checkoutUrl;
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => WebviewScreen(url: url)),
              );
              if (!context.mounted) return;
              if (result == true) {
                context.pushReplacementNamed(AppRoutes.successPayment);
              } else {
                ToastMessage.toastMsg(
                  AppLocalizations.of(context)!.payment_cancled,
                  backgroundColor: AppColors.red,
                  textColor: AppColors.white,
                );
              }
            }

            if (state.errorMessage.isNotEmpty) {
              ToastMessage.toastMsg(
                state.errorMessage.toString(),
                backgroundColor: AppColors.red,
                textColor: AppColors.white,
              );
              context.read<PaymentCubit>().doIntent(ClearErorrMessageEvent());
            }

            //payment cash
            if (state.isSuccessCash == true) {
              context.pushReplacementNamed(AppRoutes.successPayment);
            }
          },
          child: BlocBuilder<PaymentCubit, PaymentState>(
            builder: (context, state) {
              if (state.isLoadding) {
                return const Center(child: CircularProgressIndicator());
              }

              return const Padding(
                padding: EdgeInsets.all(20),
                child: Column(),
              );
            },
          ),
        ),
      ),
    );
  }
}
