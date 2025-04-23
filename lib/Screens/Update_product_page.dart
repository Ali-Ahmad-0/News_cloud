import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/Models/product_model.dart';
import 'package:store/Services/update_product.dart';
import 'package:store/widgets/customButton.dart';
import 'package:store/widgets/customTextField.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'Update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? name, description, urlImage, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.indigo[100],
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 5,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              CustomTextFormField(
                onChanged: (data) {
                  name = data;
                },
                inputType: TextInputType.text,
                textHint: 'Product Name',
                icon: const Icon(
                  FontAwesomeIcons.boxOpen,
                ),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onChanged: (data) {
                  description = data;
                },
                inputType: TextInputType.text,
                textHint: 'Description',
                icon: const Icon(Icons.description),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onChanged: (data) {
                  urlImage = data;
                },
                inputType: TextInputType.text,
                textHint: 'Image URL',
                icon: const Icon(FontAwesomeIcons.link),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onChanged: (data) {
                  price = price;
                },
                inputType: TextInputType.datetime,
                textHint: 'Price',
                icon: const Icon(Icons.price_change),
              ),
              const SizedBox(height: 40),
              Center(
                child: CustomButton(
                  onTap: () async {
                    await UpdataProduct(productModel);
                    try {
                      isLoading = true;
                      setState(() {});
                      showDialog() {
                        return Stack(
                          children: [
                            // Blurred background
                            BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                  color: const Color.fromARGB(255, 39, 53, 29)
                                      .withOpacity(0.3)),
                            ),
                            // Alert Dialog
                            AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              title: const Text('Update a product'),
                              content: const Text(
                                  'Your product has been updated successfully ✅'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ],
                        );
                      }

                      print('succes');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  buttonContent: 'Update Product',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> UpdataProduct(ProductModel productModel) async {
    await UpdateProductService().updateProduct(
        id: productModel.id,
        title: name ?? productModel.title,
        price: price ?? productModel.price.toString(),
        image: urlImage ?? productModel.image,
        desc: description ?? productModel.description,
        category: productModel.category);
  }
}
