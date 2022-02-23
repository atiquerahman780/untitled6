import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../mata.dart';

class Slide extends StatefulWidget {
  const Slide({Key? key}) : super(key: key);

  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  List<Mata> dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Query referenceData = FirebaseDatabase.instance.reference().child("news");
    referenceData.once().then((DataSnapshot dataSnapshot) {
      dataList.clear();
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;
      for (var key in keys) {
        Mata mata = Mata(
          values[key]["picUrl"],
        );
        dataList.add(mata);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        color: Colors.black12,
        child: Center(
          child: CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              height: 100,
              autoPlay: true,
            ),
            items: dataList
                .map((e) => Container(
                   color: Colors.red,
                   width: MediaQuery.of(context).size.width,
                child: Image.network(
                  e.picUrl,

                     fit: BoxFit.cover,width: MediaQuery.of(context).size.width,
                  ),
                       ))
                .toList(),
          ),
        ),
      ),
    );
  }
}