import 'package:fashion_app/data/models/recommended_model.dart';
import 'package:fashion_app/data/models/trending_for_you_model.dart';
import 'package:fashion_app/data/remote/dio_data_agent_impl.dart';
import 'package:fashion_app/data/remote/fashion_data_agent.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  final FashionDataAgent _dataAgent = DioDataAgentImpl();

  // State
  List<TrendingForYouModel> trendingForYouList = [];
  List<RecommendedModel> recommendedList = [];

  HomePageProvider() {
    _fetchTrendingForYouURL();
    _fetchRecommendedURL();
  }

  _fetchRecommendedURL() {
    _dataAgent.fetchRecommended().then((list) {
      recommendedList = list;
      notifyListeners();
    });
  }

  _fetchTrendingForYouURL() async {
    var list = await _dataAgent.fetchTrendingForYou();
    trendingForYouList = list;
    notifyListeners();
  }
}
