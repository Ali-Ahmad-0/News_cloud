import 'package:flutter/material.dart';
import 'package:test/list_tile.dart';
import 'package:test/models/article_model.dart';

class NewsListView extends StatelessWidget {
 const  NewsListView({
    super.key, required this.articles
  });

 final List<ArticleModel> articles;


  @override
  Widget build(BuildContext context) {
    return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: articles.length,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: NewsList(
                    articleModel: articles[index],
                  ),
                );
              },
            ),
          );
  }
}
