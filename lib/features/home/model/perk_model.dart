class PerkModel {
  final int rating;
  final String title;
  final String price;
  final String imageUrl;
  final String subtitle;
  final String category;
  final String duration;

  PerkModel({
    required this.title,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.subtitle,
    required this.duration,
    required this.category,
  });

  factory PerkModel.fromJson(Map<String, dynamic> json) {
    return PerkModel(
      title: json['title'],
      price: json['price'],
      rating: json['rating'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      subtitle: json['subtitle'],
      duration: json['duration'],
    );
  }
}