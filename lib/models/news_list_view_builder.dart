import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test/models/article_model.dart' show ArticleModel;
import 'package:test/news_list_views.dart';

import 'package:test/services/news_service.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.categoryName});
  final String categoryName;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(dio: Dio()).getNews(categoryName: widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data ?? []);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text(
                'There is something went wrong , please try again later !'),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
                backgroundColor: Colors.blue,
              )),
            ),
          );
        }
      },
    );
  }
}
