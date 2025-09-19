sealed class CategoryEvent {}

class GetAllCategoryEvent extends CategoryEvent {}

class GetAllProductsEvent extends CategoryEvent {
  final String? sortBy;

  GetAllProductsEvent({this.sortBy});
}

class ProductsByCategoryId extends CategoryEvent {
  final String categoryId;

  ProductsByCategoryId({required this.categoryId});
}
