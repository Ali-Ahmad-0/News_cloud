import 'package:flutter/material.dart';
import 'package:store/Models/product_model.dart';
import 'package:store/Services/get_all_products_service.dart';
import 'package:store/widgets/custom_card.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: AllProductsService().getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> products = snapshot.data!;
          return GridView.builder(
            clipBehavior: Clip.none,
            itemCount: products.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 90,
                    crossAxisCount: 2,
                    childAspectRatio: 1.4),
            itemBuilder: (context, index) {
              return CustomCard(
                productModel: products[index],
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
