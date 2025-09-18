import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/features/search/domain/entity/search_response_entity.dart';
import 'package:flowers_ecommerce_app/features/search/domain/usecases/search_usecase.dart';
import 'package:flowers_ecommerce_app/features/search/presentation/cubit/search_event.dart';
import 'package:flowers_ecommerce_app/features/search/presentation/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchUseCase searchUseCase;
  Timer? _debounce;
  TextEditingController searchController = TextEditingController();

  SearchCubit({required this.searchUseCase}) : super(SearchState());

  Future<void> doIntent(SearchEvent event) async {
    switch (event) {
      case GoToSearchEvent():
        {
          await _search(event.keyword);
          break;
        }
      case SearchDelayedEvent():
        {
          await _onChangedDelayed(event.keyword);
          break;
        }
    }
  }

  Future<void> _search(String keyword) async {
    emit(state.copyWith(isLoading: true));
    ApiResult<SearchResponseEntity> result = await searchUseCase.call(keyword);
    switch (result) {
      case ApiSuccessResult<SearchResponseEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            productsDtoEntity: result.data.productsDtoEntity,
          ),
        );
        break;
      case ApiErrorResult<SearchResponseEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: result.failure.errorMessage,
          ),
        );
        break;
    }
  }

  Future<void> _onChangedDelayed(String keyword) async {
    if (_debounce != null) {
      _debounce!.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (keyword.isNotEmpty) {
        doIntent(GoToSearchEvent(keyword: keyword));
      }
    });
  }
}
