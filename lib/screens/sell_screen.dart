import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/providers/user_details_provider.dart';
import 'package:flutter_amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:flutter_amazon_clone/utils/utils.dart';
import 'package:flutter_amazon_clone/widgets/custom_main_button.dart';
import 'package:flutter_amazon_clone/widgets/loading_widget.dart';
import 'package:flutter_amazon_clone/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

import '../utils/color_themes.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isLoading = false;
  int selected = 1;
  Uint8List? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  Expanded spaceThingy = Expanded(child: Container());
  List<int> keysForDiscount = [0, 70, 60, 50];

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    costController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: !isLoading
            ? SingleChildScrollView(
                child: SizedBox(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              image == null
                                  ? Image.network(
                                      "data:image/jpeg;base64,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",
                                      height: screenSize.height / 10,
                                    )
                                  : Image.memory(
                                      image!,
                                      height: screenSize.height / 10,
                                    ),
                              IconButton(
                                onPressed: () async {
                                  Uint8List? temp = await Utils().pickImage();
                                  if (temp != null) {
                                    setState(() {
                                      image = temp;
                                    });
                                  }
                                },
                                icon: const Icon(Icons.file_upload),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            height: screenSize.height * 0.7,
                            width: screenSize.width * 0.7,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Item Details",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextFieldWidget(
                                  title: "Item name",
                                  controller: nameController,
                                  obscureText: false,
                                  hintText: "Enter the name of the item",
                                ),
                                TextFieldWidget(
                                  title: "Cost",
                                  controller: costController,
                                  obscureText: false,
                                  hintText: "Enter the cost of the item",
                                ),
                                const Text(
                                  "Discount",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ListTile(
                                  title: Text("None"),
                                  leading: Radio(
                                    value: 1,
                                    groupValue: selected,
                                    onChanged: (int? i) {
                                      setState(() {
                                        selected = i!;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text("70%"),
                                  leading: Radio(
                                    value: 2,
                                    groupValue: selected,
                                    onChanged: (int? i) {
                                      setState(() {
                                        selected = i!;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text("60%"),
                                  leading: Radio(
                                    value: 3,
                                    groupValue: selected,
                                    onChanged: (int? i) {
                                      setState(() {
                                        selected = i!;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text("50%"),
                                  leading: Radio(
                                    value: 4,
                                    groupValue: selected,
                                    onChanged: (int? i) {
                                      setState(() {
                                        selected = i!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomMainButton(
                            child: const Text(
                              "Sell",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: yellowColor,
                            isLoading: isLoading,
                            onPressed: () async {
                              String output = await CloudFirestoreClass()
                                  .uploadProductToDataBase(
                                image: image,
                                productName: nameController.text,
                                rowCost: costController.text,
                                discount: keysForDiscount[selected - 1],
                                sellerName: Provider.of<UserDetailsProvider>(
                                  context,
                                  listen: false,
                                ).userDetails.name,
                                sellerUid:
                                    FirebaseAuth.instance.currentUser!.uid,
                              );
                              if (output == "success") {
                                Utils().showSnackBar(
                                  context: context,
                                  content: "Posted Product",
                                );
                              } else {
                                Utils().showSnackBar(
                                  context: context,
                                  content: output,
                                );
                              }
                            },
                          ),
                          CustomMainButton(
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: Colors.grey[300]!,
                            isLoading: false,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const LoadingWidget(),
      ),
    );
  }
}
