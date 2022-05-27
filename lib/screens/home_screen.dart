import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/widgets/banner_ad_widget.dart';
import 'package:flutter_amazon_clone/widgets/categories_horizontal_list_view_bar.dart';
import 'package:flutter_amazon_clone/widgets/search_bar_widget.dart';
import 'package:flutter_amazon_clone/widgets/simple_product_widget.dart';

import '../widgets/products_showcase_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> testChildren = [
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
    SimpleProductWidget(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(hasBackButton: false, isReadOnly: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoriesHorizontalListViewBar(),
            BannerAdWidget(),
            ProductsShowcaseListView(
                title: "Upto 70% Off", children: testChildren),
            ProductsShowcaseListView(
                title: "Upto 60% Off", children: testChildren),
            ProductsShowcaseListView(
                title: "Upto 50% Off", children: testChildren),
            ProductsShowcaseListView(title: "Explore", children: testChildren),
          ],
        ),
      ),
    );
  }
}
