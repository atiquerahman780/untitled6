import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Products/tasbeeh.dart';
import 'package:untitled6/HomeScreen/home_screen.dart';
import 'package:untitled6/Login/sign_in.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child:  Column(
           children:   <Widget>  [
             const SizedBox(height: 30),
             const Center(
               child:
               Text(
                   'Alamaat',
                   style: TextStyle(
                   color: Colors.orange,fontSize: 36)
               ),
             ),
             const SizedBox(height: 10),
             const Center(
               child:
               Text(
                   "Welcome to Alamaat, Let's meet with",
                   style: TextStyle(color: Colors.grey,fontSize: 17)
               ),
             ),
             const Center(
               child:
               Text('Professor Ahmad Rafiq Akhtar',
                   style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 17)
               ),
             ),
             const Center(
               child:
               Text(
                   'and shop his books and Tasbeeh!',
                   style: TextStyle(color: Colors.grey,fontSize: 17)
               ),
             ),
             const SizedBox(height: 10,),
             Expanded(
               child: Center(
                 child:
                 Image.asset('assets/images/pro.jpg'),
               ),
             ),
             const SizedBox(height: 130,),
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                 primary: Colors.orange,
                // onPrimary: Colors.white,
                 //shadowColor: Colors.greenAccent,
                 elevation: 3,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(32.0)),
                 minimumSize: const Size(200, 50), //////// HERE
               ),
               onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(),));

                 // Navigator.pushAndRemoveUntil(
                 //   context,
                 //   MaterialPageRoute(builder: (context) =>
                 //   FirebaseAuth.instance.currentUser==null? SignIn():HomeScreen(),),
                 //       (Route<dynamic> route) => false,
                 // );
               },
               child: const Text('Continue',style: TextStyle(fontSize: 17)),
             ),
             const SizedBox(height: 40,),
           ],
        ),
      ),
    );
  }
}
