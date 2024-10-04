class HomeListModel {
  final String image;
  final String title;
  final String subtitle;

  HomeListModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  // You can also add a factory constructor to easily create a model from a map if needed
  factory HomeListModel.fromMap(Map<String, String> data) {
    return HomeListModel(
      image: data['image'] ?? '',
      title: data['title'] ?? '',
      subtitle: data['subtitle'] ?? '',
    );
  }

  // Convert the model back to a map if needed
  Map<String, String> toMap() {
    return {
      'image': image,
      'title': title,
      'subtitle': subtitle,
    };
  }
}
