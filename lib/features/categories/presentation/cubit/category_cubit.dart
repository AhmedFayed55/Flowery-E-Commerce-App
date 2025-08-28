import 'package:bloc/bloc.dart';
import 'package:flowers_ecommerce_app/core/errors/api_results.dart';
import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/category_model.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/usecases/get_all_category_usecase.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_event.dart';
import 'package:injectable/injectable.dart';

import 'category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  GetAllCategoryUseCase getAllCategoryUseCase;

  CategoryCubit({required this.getAllCategoryUseCase})
    : super(CategoryState.initial());

  Future<void> doIntent(CategoryEvent event) async {
    switch (event) {
      case GetAllCategoryEvent():
        await _getAllCategory();
        break;
    }
  }

  Future<void> _getAllCategory() async {
    emit(state.copyWith(skeletonizerLoading: true));
    ApiResult<List<CategoryModel>> result =
        await getAllCategoryUseCase.call();
    switch (result) {
      case ApiSuccessResult<List<CategoryModel>>():
        emit(state.copyWith(isSuccess: true,skeletonizerLoading: false,isLoading: false,listCategoryModel: result.data));
      case ApiErrorResult<List<CategoryModel>>():
        emit(
          state.copyWith(
            isError: true,
            skeletonizerLoading: false,
            errorMessage: Failure(
              errorMessage: result.failure.errorMessage,
              code: result.failure.code,
            ),
          ),
        );
    }
  }
}
