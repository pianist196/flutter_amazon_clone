import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/utils/constants.dart';
import 'package:flutter_amazon_clone/widgets/banner_ad_widget.dart';
import 'package:flutter_amazon_clone/widgets/categories_horizontal_list_view_bar.dart';
import 'package:flutter_amazon_clone/widgets/search_bar_widget.dart';
import 'package:flutter_amazon_clone/widgets/user_details_bar.dart';

import '../model/user_details.model.dart';
import '../widgets/products_showcase_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(hasBackButton: false, isReadOnly: false),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                const SizedBox(
                  height: kAppBarHeight / 2,
                ),
                CategoriesHorizontalListViewBar(),
                BannerAdWidget(),
                ProductsShowcaseListView(
                    title: "Upto 70% Off", children: testChildren),
                ProductsShowcaseListView(
                    title: "Upto 60% Off", children: testChildren),
                ProductsShowcaseListView(
                    title: "Upto 50% Off", children: testChildren),
                ProductsShowcaseListView(
                    title: "Explore", children: testChildren),
              ],
            ),
          ),
          UserDetailsBar(
            offset: offset,
            userDetails: UserDetailsModel(
              name: "asaad",
              address: "asdasdsdcvbl",
            ),
          )
        ],
      ),
    );
  }
}
