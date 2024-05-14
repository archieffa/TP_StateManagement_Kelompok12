class Books {
  final String title;
  final String description;
  final int pageCount;
  final String excerpt;

  Books({
    required this.title,
    required this.description,
    required this.pageCount,
    required this.excerpt,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    final title = json['title'] as String; // Mendapatkan judul langsung dari json
    final description = json['description'] as String; // Mendapatkan deskripsi langsung dari json
    final pageCount = json['pageCount'] as int; // Mendapatkan jumlah halaman langsung dari json
    final excerpt = json['excerpt'] as String; // Mendapatkan cuplikan langsung dari json
    return Books(
      title: title,
      description: description,
      pageCount: pageCount,
      excerpt: excerpt,
    );
  }
}
