import 'package:store/Helper/API.dart';
import 'package:store/Models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String image,
      required String desc,
      required dynamic id,
      required String category}) async {
    print('product id = $id');
    Map<String, dynamic> data = await API().put(
        url: 'https://fakestoreapi.com/products/$id',
        body: {
          'title': title,
          'price': price,
          'description': desc,
          'image': image,
          'category': category
        },
        token: '');
    return ProductModel.fromJson(data);
  }
}
