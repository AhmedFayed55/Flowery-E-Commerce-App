import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/category_model.dart';

class CategoryState {
  bool isLoading;
  bool isSuccess;
  bool isError;
  Failure? errorMessage;
  List<CategoryModel> listCategoryModel;

  CategoryState({
    required this.isLoading,
    required this.isSuccess,
    required this.isError,
    required this.errorMessage,
    required this.listCategoryModel,
  });

  factory CategoryState.initial() {
    return CategoryState(
      isLoading: false,
      isSuccess: false,
      isError: false,
      listCategoryModel: [],
      errorMessage: Failure(errorMessage: ''),
    );
  }

  CategoryState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    List<CategoryModel>? listCategoryModel,
    Failure? errorMessage,
  }) {
    return CategoryState(
      isLoading: isLoading ?? this.isLoading,
      listCategoryModel: listCategoryModel ?? this.listCategoryModel,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
