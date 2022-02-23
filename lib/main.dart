import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Login/sign_in.dart';
import 'package:untitled6/Login/splash_screen.dart';

import 'HomeScreen/home_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),

      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser==null? SignIn():HomeScreen(),
    );
  }
}

