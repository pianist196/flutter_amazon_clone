import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/model/product_model.dart';
import 'package:flutter_amazon_clone/model/review_model.dart';
import 'package:flutter_amazon_clone/utils/color_themes.dart';
import 'package:flutter_amazon_clone/utils/constants.dart';
import 'package:flutter_amazon_clone/utils/utils.dart';
import 'package:flutter_amazon_clone/widgets/cost_widget.dart';
import 'package:flutter_amazon_clone/widgets/custom_main_button.dart';
import 'package:flutter_amazon_clone/widgets/custom_simple_rounded_button.dart';
import 'package:flutter_amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter_amazon_clone/widgets/review_dialog.dart';
import 'package:flutter_amazon_clone/widgets/review_widget.dart';
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
  Expanded spaceThingy = Expanded(child: Container());

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
                    SizedBox(
                      height: screenSize.height -
                          (kAppBarHeight + (kAppBarHeight / 2)),
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
                                RatingStarWidget(
                                    rating: widget.productModel.rating),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              height: screenSize.height / 3,
                              constraints: BoxConstraints(
                                  maxHeight: screenSize.height / 3),
                              child: Image.network(widget.productModel.url),
                            ),
                          ),
                          spaceThingy,
                          CostWidget(
                            color: Colors.black,
                            cost: widget.productModel.cost,
                          ),
                          spaceThingy,
                          CustomMainButton(
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: Colors.orange,
                            isLoading: false,
                            onPressed: () {},
                          ),
                          spaceThingy,
                          CustomMainButton(
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: Colors.yellow,
                            isLoading: false,
                            onPressed: () {},
                          ),
                          spaceThingy,
                          CustomSimpleRoundedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => const ReviewDialog(),
                              );
                            },
                            text: "Drop a review for this product",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const ReviewWidget(
                            reviewModel: ReviewModel(
                              senderName: "Alex",
                              description: "lkxcnvhpa;bgioaduv",
                              rating: 5,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const UserDetailsBar(offset: 0),
          ],
        ),
      ),
    );
  }
}
