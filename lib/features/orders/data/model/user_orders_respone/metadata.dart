class Metadata {
  int? currentPage;
  int? totalPages;
  int? limit;
  int? totalItems;

  Metadata({this.currentPage, this.totalPages, this.limit, this.totalItems});

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    currentPage: json['currentPage'] as int?,
    totalPages: json['totalPages'] as int?,
    limit: json['limit'] as int?,
    totalItems: json['totalItems'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'currentPage': currentPage,
    'totalPages': totalPages,
    'limit': limit,
    'totalItems': totalItems,
  };
}
