import 'package:flutter/material.dart';
import 'package:test/models/article_model.dart' show ArticleModel;
import 'package:test/views/web_view.dart';

class NewsList extends StatelessWidget {
  final ArticleModel articleModel;

  const NewsList({super.key, required this.articleModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => WebView(
                url: articleModel.url ?? 'https://www.google.com',
              )),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              articleModel.image ??
                  'https://resize.indiatvnews.com/en/centered/newbucket/1200_675/2023/11/breaking-news-live-1700276865-1700441177.jpg',
              height: 250,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            articleModel.title ?? 'NOT found any title !!',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Text(
            articleModel.subtitle ?? 'Not foun any description !!',
            style: const TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
