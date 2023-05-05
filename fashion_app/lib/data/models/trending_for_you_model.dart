class TrendingForYouModel {
  TrendingForYouModel({
    this.id,
    this.name,
    this.category,
    this.image,
    this.userName,
    this.userProfile,
    this.price,
    this.description,
    this.sizes,
  });

  String? id;
  String? name;
  String? category;
  String? image;
  String? userName;
  String? userProfile;
  int? price;
  String? description;
  List<String>? sizes;

  factory TrendingForYouModel.fromJson(Map<String, dynamic> json) =>
      TrendingForYouModel(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        image: json["image"],
        userName: json["user_name"],
        userProfile: json["user_profile"],
        price: json["price"],
        description: json["description"],
        sizes: json["sizes"] == null
            ? []
            : List<String>.from(json["sizes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category,
    "image": image,
    "user_name": userName,
    "user_profile": userProfile,
    "price": price,
    "description": description,
    "sizes": sizes == null ? [] : List<dynamic>.from(sizes!.map((x) => x)),
  };
}
