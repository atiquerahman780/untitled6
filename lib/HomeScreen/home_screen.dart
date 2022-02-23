import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Account/account.dart';
import 'package:untitled6/HomeScreen/Slider.dart';
import 'package:untitled6/HomeScreen/categories.dart';
import 'package:untitled6/Laptop.dart';
import 'package:untitled6/Login/sign_in.dart';
import 'package:untitled6/Login/sign_in_Message.dart';
import 'package:untitled6/Message/message.dart';
import '../allProduct.dart';
import '../cart.dart';
import '../kityhor.dart';
import 'search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void inputData() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    print(uid);
    String? l =uid;
    q.r=l!;
    print("llllllllllllllllllllllllllllllllll");
    // here you write the codes to input the data into firestore
  }
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
inputData();
    return Scaffold(
        body: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                if (_selectedIndex == 0) ...[

                    SizedBox(

                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width,
                        child: const search(),


                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: MediaQuery.of(context).size.width,
                            child: Slide(),
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("Categories"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width,
                            child: const categories(),
                          ),
                          Row(
                            children:   const [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("All"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*1.20 ,
                            width: MediaQuery.of(context).size.width,
                            child: const AllProduct(),
                          ),
                        ],
                      ),
                    )

                  ),

                ]
                else if (_selectedIndex == 1) ...[
                  Expanded(child: SingleChildScrollView(
                    child:SizedBox(
                      height: MediaQuery.of(context).size.height *0.81,
                      width: MediaQuery.of(context).size.width,
                      child: abcd(),
                      //FirebaseAuth.instance.currentUser==null? SignInM():message(),
                    ),
                  )
                  )

                ]
                else if (_selectedIndex == 3) ...[
                    Expanded(
                      child: SingleChildScrollView(
                          child:  SizedBox(
                            height: MediaQuery.of(context).size.height ,
                            width: MediaQuery.of(context).size.width,
                            child:Laptops(),
                            //FirebaseAuth.instance.currentUser==null? SignIn():account(),
                          ),
                        )

                    ),
                  ]
                  else if (_selectedIndex == 2) ...[
                      Expanded(
                        child: SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height *0.81,
                          width: MediaQuery.of(context).size.width,
                          child: Cart(),
                        ),
                           )

                      ),
                    ]
              ],
            ),
          )

        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
class q{
  static String r='';
}
