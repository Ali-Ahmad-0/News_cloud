import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:test/category_list.dart';
import 'package:test/models/news_list_view_builder.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        backgroundColor: Colors.white.withAlpha(200),
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News Cloud',
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.cloud_circle_rounded,
              color: Colors.black,
              size: 35,
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CatList()),
            SliverToBoxAdapter(child: SizedBox(height: 15)),
            NewsListViewBuilder(categoryName: 'general'),
          ],
        ),
      ),
    );
  }
}
