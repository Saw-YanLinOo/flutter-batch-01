import 'dart:convert';
import 'dart:io';

import 'package:fashion_app/data/models/recommended_model.dart';

import 'package:fashion_app/data/models/trending_for_you_model.dart';

import 'api_constant.dart';
import 'fashion_data_agent.dart';
import 'package:http/http.dart' as http;

class HttpDataAgentImpl extends FashionDataAgent{

  final _http = http.Client;

  @override
  Future<List<RecommendedModel>> fetchRecommended()async {

    var response = await http.get(Uri.https("https://raw.githubusercontent.com","Saw-YanLinOo/Json-Api/master/fashion-recommended-json.json"));

    List<dynamic> jsonList = jsonDecode(response.body);
    List<RecommendedModel> result =
    jsonList.map((e) => RecommendedModel.fromJson(e)).toList();


    return result;
  }

  @override
  Future<List<TrendingForYouModel>> fetchTrendingForYou() async{
    var response = await http.get(Uri.https("https://raw.githubusercontent.com","Saw-YanLinOo/Json-Api/master/fashion-trending-json.json"));

    List<dynamic> jsonList = jsonDecode(response.body);
    List<TrendingForYouModel> result =
    jsonList.map((e) => TrendingForYouModel.fromJson(e)).toList();


    return result;
  }
}