import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/model/product_model.dart';
import 'package:flutter_amazon_clone/utils/color_themes.dart';
import 'package:flutter_amazon_clone/utils/constants.dart';
import 'package:flutter_amazon_clone/utils/utils.dart';
import 'package:flutter_amazon_clone/widgets/cost_widget.dart';
import 'package:flutter_amazon_clone/widgets/custom_main_button.dart';
import 'package:flutter_amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter_amazon_clone/widgets/search_bar_widget.dart';
import 'package:flutter_amazon_clone/widgets/user_details_bar.dart';

import '../model/user_details.model.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;

  const ProductScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: true,
          hasBackButton: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: kAppBarHeight / 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  widget.productModel.sellerName,
                                  style: const TextStyle(
                                    color: activeCyanColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                widget.productModel.productName,
                              ),
                            ],
                          ),
                          RatingStarWidget(rating: widget.productModel.rating),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: screenSize.height / 3,
                        child: FittedBox(
                          child: Image.network(widget.productModel.url),
                        ),
                      ),
                    ),
                    CostWidget(
                      color: Colors.black,
                      cost: widget.productModel.cost,
                    ),
                    CustomMainButton(
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.orange,
                      isLoading: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            UserDetailsBar(
              offset: 0,
              userDetails: UserDetailsModel(
                name: "Alex",
                address: "Somewhere on earth",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
