class TrendingModel {
  final String type;
  final String? image;
  final String title;
  final String author;
  final DateTime createdDate;
  final String likes;
  final bool isVerified;

  TrendingModel({
    required this.type,
    required this.image,
    required this.title,
    required this.author,
    required this.createdDate,
    required this.likes,
    this.isVerified = false,
  });

  TrendingModel copyWith({
    String? type,
    String? image,
    String? title,
    String? author,
    DateTime? createdDate,
    String? likes,
    bool? isVerified,
  }) {
    return TrendingModel(
      type: type ?? this.type,
      image: image ?? this.image,
      title: title ?? this.title,
      author: author ?? this.author,
      createdDate: createdDate ?? this.createdDate,
      likes: likes ?? this.likes,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
