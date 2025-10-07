import 'package:flowers_ecommerce_app/features/payment/presentaion/view_model/payment_state.dart';
import 'package:flowers_ecommerce_app/features/track_order/presentaion/view_model/track_order_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrackOrderCubit extends Cubit<PaymentState> {
  TrackOrderCubit() : super(PaymentState());
  doIntent(TrackOrderEvent event) {
    switch (event) {}
  }
}
