import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/screens/sign_in_screen.dart';
import 'package:flutter_amazon_clone/utils/color_themes.dart';

void main() {
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const SignInScreen(),
    );
  }
}
