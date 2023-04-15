import 'package:fashion_app/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                child: TrendingForYouSection(),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RecommendedSection(title: "Recommended"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({Key? key,required this.title}) : super(key: key);

  final String title;
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
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.pink.shade100.withOpacity(0.2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/shoe.png"),
                  ),
                  Text(
                    "Shoe",
                    style: TextStyle(
                      color: Colors.pink.shade200,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade100.withOpacity(0.2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/cactus.png"),
                  ),
                  Text(
                    "Cactus",
                    style: TextStyle(
                      color: Colors.blue.shade200,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade100.withOpacity(0.2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/cactus.png"),
                  ),
                  Text(
                    "Cactus",
                    style: TextStyle(
                      color: Colors.blue.shade200,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class TrendingForYouSection extends StatelessWidget {
  const TrendingForYouSection({Key? key}) : super(key: key);

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
        GestureDetector(
          onTap: (){
           // print("on tap card");
            Navigator.push(context,MaterialPageRoute(builder: (context)=> DetailPage()));
          },
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/outfit.jpeg",
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
                        "New 2020",
                        style: TextStyle(
                          color: Colors.pink.shade100,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          "Modren Outfit Collection",
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
                            child: Image.asset(
                              "assets/profile.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Finar Surat",
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
        ),
      ],
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
