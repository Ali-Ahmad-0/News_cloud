import 'package:store/Helper/API.dart';

class Allcategories {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await API().get(url: 'https://fakestoreapi.com/products/categories?=' , token: '');
    return data;
  }
}
