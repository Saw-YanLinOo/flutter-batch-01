class RecommendedModel {
  final String id;
  final String title;
  final String image;
  final String color;

  RecommendedModel({
    required this.id,
    required this.title,
    required this.image,
    required this.color,
  });

  factory RecommendedModel.fromJson(dynamic json) {
    return RecommendedModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      color: json["color"],
    );
  }
}