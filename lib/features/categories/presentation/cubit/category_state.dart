import 'package:flowers_ecommerce_app/core/errors/failures.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/category_model.dart';
import 'package:flowers_ecommerce_app/features/categories/domain/entity/products_entity.dart';

class CategoryState {
  bool isLoading;
  bool isSuccess;
  bool isError;
  bool dataLoading;
  Failure? errorMessage;
  List<CategoryModel> listCategoryModel;
  List<ProductsEntity> allProducts;
  List<ProductsEntity> filteredProducts;
  int selectedIndex;

  CategoryState({
    required this.isLoading,
    required this.isSuccess,
    required this.isError,
    required this.dataLoading,
    required this.errorMessage,
    required this.listCategoryModel,
    required this.allProducts,
    required this.filteredProducts,
    required this.selectedIndex,
  });

  factory CategoryState.initial() {
    return CategoryState(
      isLoading: false,
      isSuccess: false,
      isError: false,
      dataLoading: false,
      listCategoryModel: [],
      allProducts: [],
      filteredProducts: [],
      errorMessage: Failure(errorMessage: ''),
      selectedIndex: 0,
    );
  }

  CategoryState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? dataLoading,
    bool? isError,
    int? selectedIndex,
    List<CategoryModel>? listCategoryModel,
    List<ProductsEntity>? filteredProducts,
    List<ProductsEntity>? allProducts,
    Failure? errorMessage,
  }) {
    return CategoryState(
      isLoading: isLoading ?? this.isLoading,
      dataLoading: dataLoading ?? this.dataLoading,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      listCategoryModel: listCategoryModel ?? this.listCategoryModel,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      allProducts: allProducts ?? this.allProducts,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}