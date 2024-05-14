class BooksModel {
  final String title;
  final String description;
  final int pageCount;
  final String excerpt;

  BooksModel({
    required this.title,
    required this.description,
    required this.pageCount,
    required this.excerpt,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) {
    return BooksModel(
      title: json['title'] as String,
      description: json['description'] as String,
      pageCount: json['pageCount'] as int,
      excerpt: json['excerpt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'pageCount': pageCount,
      'excerpt': excerpt,
    };
  }
}
