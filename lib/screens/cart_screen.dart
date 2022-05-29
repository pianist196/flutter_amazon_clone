import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/model/product_model.dart';
import 'package:flutter_amazon_clone/utils/color_themes.dart';
import 'package:flutter_amazon_clone/utils/constants.dart';
import 'package:flutter_amazon_clone/widgets/custom_main_button.dart';
import 'package:flutter_amazon_clone/widgets/user_details_bar.dart';

import '../model/user_details.model.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/search_bar_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        hasBackButton: false,
        isReadOnly: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: kAppBarHeight / 2),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainButton(
                    child: const Text(
                      "Proceed to by (n) items",
                      style: TextStyle(color: Colors.black),
                    ),
                    color: yellowColor,
                    isLoading: false,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        productModel: ProductModel(
                          url:
                              "https://m.media-amazon.com/images/I/11M5KkkmavL._SS70_.png",
                          productName: "Alex qWE",
                          cost: 902973492362,
                          discount: 0,
                          uid: "asdfalkcn",
                          sellerName: "alfkan244mskdodlv",
                          sellerUid: "adlfksnc",
                          rating: 1,
                          noOfRating: 1,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            UserDetailsBar(
              offset: 0,
              userDetails: UserDetailsModel(
                name: "Alex",
                address: "New-York",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
