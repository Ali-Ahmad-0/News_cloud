
import 'package:store/Helper/API.dart';

import 'package:store/Models/product_model.dart';

class GetCategory {
  Future<List<dynamic>> getCategory({required String categoryName}) async {
    List<dynamic> data = await API()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName' , token: '');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }

    return productList;
  }
}
