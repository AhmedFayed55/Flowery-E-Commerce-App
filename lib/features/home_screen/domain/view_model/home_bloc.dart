import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/use_cases/home_use_case.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/view_model/home_event.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/view_model/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeBloc extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;
  HomeBloc(this._homeUseCase) : super(HomeState());

  void doIntent(HomeEvent event) {
    switch (event) {
      case GetHomeDataEvent():
        return _homeData();
    }
  }

  void _homeData() async {
    emit(state.copyWith(isLoadding: true));
    var result = await _homeUseCase.call();
    switch (result) {
      case ApiSuccessResult():
        return emit(state.copyWith(isLoadding: false, homeEntity: result.data));
      case ApiErrorResult():
        return emit(
          state.copyWith(
            isLoadding: false,
            errorMassage: result.failure.errorMessage,
          ),
        );
    }
  }
}
