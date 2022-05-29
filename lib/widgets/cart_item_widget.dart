import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/model/product_model.dart';
import 'package:flutter_amazon_clone/utils/color_themes.dart';
import 'package:flutter_amazon_clone/utils/utils.dart';
import 'package:flutter_amazon_clone/widgets/custom_simple_rounded_button.dart';
import 'package:flutter_amazon_clone/widgets/custom_square_button.dart';
import 'package:flutter_amazon_clone/widgets/product_information_widget.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel productModel;

  const CartItemWidget({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      padding: const EdgeInsets.all(20),
      height: screenSize.height / 2,
      width: screenSize.width,
      decoration: const BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width / 3,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: Image.network(
                        productModel.url,
                      ),
                    ),
                  ),
                ),
                ProductInformationWidget(
                  productName:
                  productModel.productName,
                  cost: productModel.cost,
                  sellerName: productModel.sellerName,
                ),
              ],
            ),
            flex: 3,
          ),
          Expanded(
            child: Row(
              children: [
                CustomSquareButton(
                  child: const Icon(Icons.remove),
                  onPressed: () {},
                  color: backgroundColor,
                  dimension: 50,
                ),
                CustomSquareButton(
                  child: const Text(
                    "0",
                    style: TextStyle(color: activeCyanColor),
                  ),
                  onPressed: () {},
                  color: Colors.white,
                  dimension: 50,
                ),
                CustomSquareButton(
                  child: const Icon(Icons.add),
                  onPressed: () {},
                  color: backgroundColor,
                  dimension: 50,
                ),
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      CustomSimpleRoundedButton(
                        onPressed: () {},
                        text: "Delete",
                      ),
                      const SizedBox(width: 10),
                      CustomSimpleRoundedButton(
                        onPressed: () {},
                        text: "Save for late",
                      ),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "See more like this",
                    style: TextStyle(
                      color: activeCyanColor,
                    ),
                  ),
                ),
              ],
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
