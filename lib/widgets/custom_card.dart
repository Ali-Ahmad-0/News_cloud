import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/Models/product_model.dart';
import 'package:store/Screens/Product_Detail.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavorite = false; // Track heart state

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDetailsScreen(product: widget.productModel),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 20,
                offset: const Offset(10, 10),
              )
            ]),
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.productModel.title.substring(0, 12)}...',
                    style:
                        const TextStyle(color: Color(0xFF333333), fontSize: 14),
                  ),
                  // Rating Stars
                  Row(children: [
                    Text('${widget.productModel.ratingModel?.rate} '),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < widget.productModel.ratingModel?.rate
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        );
                      }),
                    ),
                    Text('(${widget.productModel.ratingModel?.count})')
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.productModel.price} \$',
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite; // Toggle state
                          });
                        },
                        icon: Icon(
                          isFavorite
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: isFavorite
                              ? Colors.red
                              : Colors.grey, // Change color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: -0,
            child: Image.network(
              widget.productModel.image,
              height: 80,
              width: 120,
            ),
          )
        ],
      ),
    );
  }
}
