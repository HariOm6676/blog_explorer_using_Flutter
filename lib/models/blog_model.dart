class Blog {
  final String id;
  final String imageUrl;
  final String title;
  bool isFavorite;

  Blog({
    required this.id,
    required this.imageUrl,
    required this.title,
    this.isFavorite = false,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      imageUrl: json['image_url'],
      title: json['title'],
    );
  }
}
