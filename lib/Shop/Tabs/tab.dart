import 'package:flutter/material.dart';
import 'package:untitled6/Shop/Tabs/search.dart';
import 'package:untitled6/Shop/Tabs/tab1.dart';
import 'package:untitled6/Shop/Tabs/tab2.dart';

import '../../cart.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  String? _result;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(

          backgroundColor: Colors.white,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children:   const [
                TabBar(
                  // ScrollPhysics
                   isScrollable: false,
                  labelColor: Colors.orange,
                  indicatorColor: Colors.orange,
                  labelPadding: EdgeInsets.all(0),
                  unselectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  tabs: [
                    Tab(
                      // icon: Icon(Icons.add_circle_outline_rounded),
                      text: "Tasbeeh",
                    ),
                    Tab(
                      // icon: Icon(Icons.add_circle_outline_rounded),
                        text: "Books"),
                    Tab(
                      // icon: Icon(Icons.add_circle_outline_rounded),
                        text: "Search"),

                  ],
                ),
                Expanded(
                  child: TabBarView(
                    // <-- Your TabBarView
                    children: [
                      Tab1(),
                      Tab2(),
                      Search(),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
