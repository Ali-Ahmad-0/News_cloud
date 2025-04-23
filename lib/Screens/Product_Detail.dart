import 'package:flutter/material.dart';
import 'package:store/Models/product_model.dart';
import 'package:store/Screens/Update_product_page.dart';

class ProductDetailsScreen extends StatelessWidget {
  static String id = 'Product detail';
  ProductDetailsScreen({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product Details', style: TextStyle(fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        product.image,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      product.title,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          'Price: ',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${product.price} \$',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Category: ',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.category,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 68, 66, 66)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          'Rating: ',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${product.ratingModel?.rate} ',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 68, 66, 66)),
                        ),
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < product.ratingModel?.rate
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 20,
                            );
                          }),
                        ),
                        Text(
                          ' (${product.ratingModel?.count})',
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.description,
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade800),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Fixed Update Button at Bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 50,
              width: double.infinity, // Make button full width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, UpdateProductPage.id,
                      arguments: product);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Update product',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

