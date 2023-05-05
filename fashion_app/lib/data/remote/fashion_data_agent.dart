import 'package:fashion_app/data/models/trending_for_you_model.dart';

import '../models/recommended_model.dart';

abstract class FashionDataAgent{
  // Trending For You Api
  Future<List<TrendingForYouModel>> fetchTrendingForYou();
  // Recommended Api
  Future<List<RecommendedModel>> fetchRecommended();
}