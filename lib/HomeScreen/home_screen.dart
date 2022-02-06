import 'package:flutter/material.dart';
import 'package:untitled6/HomeScreen/Slider.dart';
import 'package:untitled6/HomeScreen/drawer.dart';
import 'package:untitled6/Shop/Tabs/tab.dart';

import '../Products/book.dart';
import '../cart.dart';
import '../Products/tasbeeh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Alamaat"),
          backgroundColor: Colors.orange,
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context
                  //   , MaterialPageRoute(builder: (_)=> LocalMyCart()),
                  // );
                },
                icon: const Icon(Icons.notifications)),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Cart()),
                );
              },
            ),
          ],
        ),
        drawer: const NavigationDrawerWidget(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (_selectedIndex == 0) ...[
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Breaking News"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width,
                    child: Slide(),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Lectures Videos"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width,
                    //child: ,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width,
                    //child: ,
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Tasbeeh"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width,
                    child: const Tasbeeh(),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Books"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width,
                    child: const Book(),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Announcement"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width,
                    //child: Laptops(),
                  ),
                ]
                else if (_selectedIndex == 1) ...[
                  SizedBox(
                    height: MediaQuery.of(context).size.height *0.81,
                    width: MediaQuery.of(context).size.width,
                    child: TabScreen(),
                  ),
                ]
                else if (_selectedIndex == 3) ...[
                  SizedBox(
                    height: MediaQuery.of(context).size.height *0.81,
                    width: MediaQuery.of(context).size.width,
                   // child: Admin(),
                  ),
                ]
                else if (_selectedIndex == 2) ...[
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Books"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width,
                    //child: (),
                  ),
                ]
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'E-Books',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.meeting_room_outlined),
              label: 'Meeting',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
