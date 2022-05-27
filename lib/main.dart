import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/layout/screen_layout.dart';
import 'package:flutter_amazon_clone/screens/sign_in_screen.dart';
import 'package:flutter_amazon_clone/utils/color_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA4-Y3aV_iqHLKfxR6xKQUUgUaxboehmcM",
          authDomain: "clone-e33ef.firebaseapp.com",
          projectId: "clone-e33ef",
          storageBucket: "clone-e33ef.appspot.com",
          messagingSenderId: "387518093057",
          appId: "1:387518093057:web:508871051c47813977ad00"),
    );
  } else {
    await Firebase.initializeApp();
  }
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
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> user) {
            if (user.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            } else if (user.hasData) {
              // FirebaseAuth.instance.signOut();
              return const ScreenLayout();
            } else {
              return const SignInScreen();
            }
          }),
    );
  }
}
