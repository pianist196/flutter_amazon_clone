import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/utils/constants.dart';
import 'package:flutter_amazon_clone/utils/utils.dart';
import 'package:flutter_amazon_clone/widget/custom_main_button.dart';
import 'package:flutter_amazon_clone/widget/text_field_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                amazonLogo,
                height: screenSize.height * 0.10,
              ),
              Container(
                height: screenSize.height * 0.6,
                width: screenSize.width * 0.6,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 35,
                      ),
                    ),
                    TextFieldWidget(
                      title: "Email",
                      controller: emailController,
                      obscureText: false,
                      hintText: "Enter your email",
                    ),
                    TextFieldWidget(
                      title: "Password",
                      controller: emailController,
                      obscureText: true,
                      hintText: "Enter your password",
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomMainButton(
                        child: const Text(
                          'Sign In',
                          style: TextStyle(letterSpacing: 0.6),
                        ),
                        color: Colors.orange,
                        isLoading: false,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
