class ProductModel {
  final dynamic id;
  final String title;
  final String description;
  final String image;
  final dynamic price;
  final String category;
  final RatingModel? ratingModel;

  ProductModel(
      {required this.category,
      required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.ratingModel});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        description: jsonData['description'],
        image: jsonData['image'],
        category: jsonData['category'],
        price: jsonData['price'],
        ratingModel: jsonData['rating'] == null
            ? null
            : RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
