
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fashion_app/data/models/recommended_model.dart';
import 'package:fashion_app/data/models/trending_for_you_model.dart';
import 'package:fashion_app/data/remote/fashion_data_agent.dart';

import 'api_constant.dart';


class DioDataAgentImpl extends FashionDataAgent {

  final Dio _dio = Dio();

  @override
  Future<List<RecommendedModel>> fetchRecommended() async{
    var response = await _dio.get(recommendedURL);

    List<dynamic> jsonList = jsonDecode(response.data);
    List<RecommendedModel> result =
    jsonList.map((e) => RecommendedModel.fromJson(e)).toList();


    return result;
  }

  @override
  Future<List<TrendingForYouModel>> fetchTrendingForYou() async{
    var response = await _dio.get(trendingForYouURL);

    List<dynamic> jsonList = jsonDecode(response.data);
    List<TrendingForYouModel> result =
    jsonList.map((e) => TrendingForYouModel.fromJson(e)).toList();

    return result;
  }

}