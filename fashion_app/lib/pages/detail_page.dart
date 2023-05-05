import 'package:fashion_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/models/recommended_model.dart';
import '../data/models/trending_for_you_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.item, required this.list})
      : super(key: key);

  final TrendingForYouModel item;
  final List<RecommendedModel> list;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> outSizes = ["S", "M", "L", "X", "XL"];
  List<Widget> listWidget = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    "${widget.item.image}",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  left: 20,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 32,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.white,
                        size: 32,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.share,
                        size: 32,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 20,
                ),
                GeneralSection(
                  item: widget.item,
                ),
                SizedBox(
                  height: 8,
                ),
                ExpansionTile(
                  shape: Border.all(style: BorderStyle.none),
                  initiallyExpanded: true,
                  childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    Text(
                      "${widget.item.description}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                  title: Text(
                    "Descriptions",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OutFitSizeSection(outSizes: widget.item.sizes ?? []),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RecommendedSection(
                    title: "Related Outfit",
                    list: widget.list,
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OutFitSizeSection extends StatelessWidget {
  const OutFitSizeSection({
    Key? key,
    required this.outSizes,
  }) : super(key: key);

  final List<String> outSizes;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Your Size",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            Text(
              "Size Guide",
              style: TextStyle(
                fontSize: 12,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: outSizes.map((size) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: OutSizeItemView(
                  size: size,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class OutSizeItemView extends StatelessWidget {
  const OutSizeItemView({
    Key? key,
    this.size,
  }) : super(key: key);

  final String? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          "$size",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GeneralSection extends StatelessWidget {
  const GeneralSection({
    Key? key,
    required this.item,
  }) : super(key: key);

  final TrendingForYouModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "OUTFIT IDEAS",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Text(
          "${item.name}",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "\$${item.price}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.indigo,
          ),
        ),
      ],
    );
  }
}
