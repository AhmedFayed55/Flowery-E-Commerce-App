class CategoryModel {
  String id;
  String name;
  String slug;
  String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      image: json["image"],
    );
  }
}
