import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_amazon_clone/model/product_model.dart';
import 'package:flutter_amazon_clone/model/user_details.model.dart';
import 'package:flutter_amazon_clone/utils/utils.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadNameAndAddressToDatabase(
      {required UserDetailsModel user}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set(user.getJson());
  }

  Future getNameAndAddress() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    UserDetailsModel userModel = UserDetailsModel.getModelFromJson(
      (snap.data() as dynamic),
    );
    return userModel;
  }

  Future<String> uploadProductToDataBase({
    required Uint8List? image,
    required String productName,
    required String rowCost,
    required int discount,
    required String sellerName,
    required String sellerUid,
  }) async {
    productName.trim();
    rowCost.trim();
    String output = "Something went wrong";
    if (image != null && productName != "" && rowCost != "") {
      try {
        String uid = Utils().getUid();
        String url = await uploadImageToDataBase(
          image: image,
          uid: uid,
        );
        double cost = double.parse(rowCost);
        cost = cost - (cost * (discount / 100));
        ProductModel productModel = ProductModel(
          url: url,
          productName: productName,
          cost: cost,
          discount: discount,
          uid: uid,
          sellerName: sellerName,
          sellerUid: sellerUid,
          rating: 5,
          noOfRating: 0,
        );
         await firebaseFirestore
            .collection("products")
            .doc(uid)
            .set(productModel.getJson());
        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please make all the fields are not  empty";
    }
    return output;
  }

  Future<String> uploadImageToDataBase({
    required Uint8List image,
    required String uid,
  }) async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child("products").child(uid);
    UploadTask uploadTask = storageRef.putData(image);
    TaskSnapshot task = await uploadTask;
    return task.ref.getDownloadURL();
  }
}
