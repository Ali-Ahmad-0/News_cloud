import 'package:flutter/material.dart';
import 'package:store/Screens/HomePage.dart';
import 'package:store/Screens/Update_product_page.dart' show UpdateProductPage;


void main() {
  runApp(const StoreApp()); // Removed the required parameter issue
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key}); // Removed the productModel parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Homepage.id: (context) =>  const Homepage(),
        UpdateProductPage.id: (context) =>  const UpdateProductPage(),
      },
      initialRoute: Homepage.id,
      debugShowCheckedModeBanner: false,
    );
  }
}
