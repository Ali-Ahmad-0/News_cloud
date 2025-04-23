
import 'package:store/Helper/API.dart';
import 'package:store/Models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String image,
      required String desc,
      required String category}) async {
    Map<String, dynamic> data =
        await API().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    }, token: '');
    return ProductModel.fromJson(data);
  }
}
