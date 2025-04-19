import 'package:flutter/material.dart';
import 'package:test/category.dart';
import 'package:test/models/category_model.dart';


class CatList extends StatelessWidget {
  const CatList({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(categoryName: 'Business', image: 'Images/business.jpeg'),
    CategoryModel(categoryName: 'Technology', image: 'Images/technology.jpeg'),
    CategoryModel(
        categoryName: 'Entertainment', image: 'Images/entertainment.jpeg'),
    CategoryModel(categoryName: 'Health', image: 'Images/health.jpeg'),
    CategoryModel(categoryName: 'Science', image: 'Images/science.jpeg'),
    CategoryModel(categoryName: 'Sports', image: 'Images/sports.jpeg'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Cards(
            category: categories[index],
          );
        },
      ),
    );
  }
}
