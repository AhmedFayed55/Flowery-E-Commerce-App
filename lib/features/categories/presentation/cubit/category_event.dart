sealed class CategoryEvent {}

class GetAllCategoryEvent extends CategoryEvent {}

class GetAllProductsEvent extends CategoryEvent {}

class ProductsByCategoryId extends CategoryEvent {
  final String categoryId;

  ProductsByCategoryId({required this.categoryId});
}
