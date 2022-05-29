import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../widgets/results_widget.dart';
import '../widgets/search_bar_widget.dart';

class ResultsScreen extends StatelessWidget {
  final String query;

  const ResultsScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        hasBackButton: true,
        isReadOnly: false,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Showing results for ",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      TextSpan(
                        text: query,
                        style: const TextStyle(
                          fontSize: 17,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                return ResultWidget(
                  productModel: ProductModel(
                    url:
                        "https://m.media-amazon.com/images/I/11M5KkkmavL._SS70_.png",
                    productName: "Alex qWE",
                    cost: 100,
                    discount: 0,
                    uid: "asdfalkcn",
                    sellerName: "alfkan244mskdodlv",
                    sellerUid: "adlfksnc",
                    rating: 2,
                    noOfRating: 1,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
