import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/resources/cloudfirestore_methods.dart';
import '../model/user_details.model.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel userDetails;

  UserDetailsProvider()
      : userDetails = UserDetailsModel(name: "Loading", address: "Washington");

  Future getData() async {
    userDetails = await CloudFirestoreClass().getNameAndAddress();
    notifyListeners();
  }
}
