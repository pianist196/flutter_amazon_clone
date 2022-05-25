import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> signUpUser({
    required String name,
    required String address,
    required String email,
    required String password,
  }) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();
    String output = "Something went wrong";
    if (name != "" && address != "" && email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please fill up all the fields!";
    }
    return output;
  }
}
