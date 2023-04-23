import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fashion_app/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio _dio = Dio();
  String recommendedURL =
      "https://raw.githubusercontent.com/Saw-YanLinOo/Json-Api/master/fashion-recommended-json.json";
  String trendingForYouURL =
      "https://raw.githubusercontent.com/Saw-YanLinOo/Json-Api/master/fashion-trending-json.json";

  List<TrendingForYouModel> trendingForYouList = [];
  List<RecommendedModel> recommendedList = [];

  _fetchRecommendedURL() async {
    var response = await _dio.get(recommendedURL);

    List<dynamic> jsonList = jsonDecode(response.data);
    List<RecommendedModel> result =
        jsonList.map((e) => RecommendedModel.fromJson(e)).toList();
    print(result);

    recommendedList = result;
    setState(() {});
  }

  _fetchTrendingForYouURL() async {
    var response = await _dio.get(trendingForYouURL);

    List<dynamic> jsonList = jsonDecode(response.data);
    List<TrendingForYouModel> result =
        jsonList.map((e) => TrendingForYouModel.fromJson(e)).toList();
    print(result);

    trendingForYouList = result;
    setState(() {});
  }

  @override
  void initState() {
    _fetchRecommendedURL();
    _fetchTrendingForYouURL();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: HomeAppBarSection(),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TrendingForYouSection(
                  list: trendingForYouList,
                  rList: recommendedList,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RecommendedSection(
                  title: "Recommended",
                  list: recommendedList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({Key? key, required this.title, required this.list})
      : super(key: key);

  final String title;
  final List<RecommendedModel> list;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$title",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "...",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: list.map((data) {
            return RecommendedItemView(
              title: data.title,
              image: data.image,
              color: Color(int.parse(data.color)),
            );
          }).toList(),
        )
      ],
    );
  }
}

class RecommendedItemView extends StatelessWidget {
  const RecommendedItemView({
    Key? key,
    required this.title,
    required this.image,
    required this.color,
  }) : super(key: key);

  final String title;
  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.network(image),
          ),
          Text(
            title,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class TrendingForYouSection extends StatelessWidget {
  const TrendingForYouSection({
    Key? key,
    required this.list,
    required this.rList,
  }) : super(key: key);

  final List<TrendingForYouModel> list;
  final List<RecommendedModel> rList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Trending For You",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var item = list[index];

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TrendingForYouItemView(
                  item: item,
                  list: rList,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TrendingForYouItemView extends StatelessWidget {
  const TrendingForYouItemView(
      {Key? key, required this.item, required this.list})
      : super(key: key);

  final TrendingForYouModel item;
  final List<RecommendedModel> list;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print("on tap card");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      item: item,
                      list: list,
                    )));
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.1,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                item.image ?? "",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(4),
                child: Icon(
                  FontAwesomeIcons.heart,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item.category}",
                    style: TextStyle(
                      color: Colors.pink.shade100,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "${item.name}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          "${item.userProfile}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${item.userName}",
                        style: TextStyle(
                          color: Colors.pink.shade100,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeAppBarSection extends StatelessWidget {
  const HomeAppBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            "assets/profile.png",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hawdy",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Christia Yota",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Spacer(),
        Icon(
          Icons.notifications,
          size: 32,
        ),
      ],
    );
  }
}
