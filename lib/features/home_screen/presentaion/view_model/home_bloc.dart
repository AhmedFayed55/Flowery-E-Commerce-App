import 'package:bloc/bloc.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/occasion_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/home_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;
  HomeBloc(this._homeUseCase) : super(HomeState());

  List<OccasionEntity> occasion = [];
  List<ProductEntity> products = [];

  void doIntent(HomeEvent event) {
    switch (event) {
      case GetHomeDataEvent():
        return _homeData();
    }
  }

  void _homeData() async {
    emit(state.copyWith(isLoading: true));
    var result = await _homeUseCase.call();
    switch (result) {
      case ApiSuccessResult():
        occasion = result.data.occasionEntity;
        products = result.data.productEntity;
        return emit(
          state.copyWith(
            isLoading: false,
            homeEntity: result.data,
            products: result.data.bestSallerEntity,
          ),
        );
      case ApiErrorResult():
        return emit(
          state.copyWith(
            isLoading: false,
            errorMassage: result.failure.errorMessage,
          ),
        );
    }
  }
}
