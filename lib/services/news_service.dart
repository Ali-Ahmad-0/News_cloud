import 'package:dio/dio.dart';
import 'package:test/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService({required this.dio});

  Future<List<ArticleModel>> getNews({required String categoryName}) async {
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?apiKey=bcd363bf0b8c401083857a25b6750830&country=us&category=$categoryName');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<ArticleModel> articleList = [];
    for (var article in articles) {
      ArticleModel articleModel = ArticleModel.fromJson(article);

      articleList.add(articleModel);
    }
    return articleList;
  }
}
