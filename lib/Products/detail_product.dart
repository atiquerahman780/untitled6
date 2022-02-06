import 'package:untitled6/Data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/localStorage/Category_Services.dart';
import 'dart:math';
import '../Data.dart';
import '../localStorage/Repositry.dart';
import '../localStorage/category1.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key, required this.data}) : super(key: key);

  final Data data;

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  var _petagory = Petagory();
  var _PetagoryServices = PetagoryServices();
  TextEditingController tec = TextEditingController();
  String savedText = "";
  String rice = "";
  String ame = "";
  String icUrl = "";
  String uantity = "";

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;

  getValue() async {
    prefs = await _prefs;
    setState(() {
      rice = widget.data.price;
      ame = widget.data.name;
      icUrl = widget.data.picUrl;
      uantity = '$_counter';
      print(uantity);
      savedText = (prefs.containsKey("savedString")
          ? prefs.getString("savedString")
          : "")!;
    });
  }

  @override
  void initState() {
    getValue();
    super.initState();
  }

  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Detail"),
      ),
      body: Column(
        children: <Widget>[
          Image.network(
            icUrl,
            fit: BoxFit.cover,
            height: 300,
          ),
          const SizedBox(
            height: 1,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 10.0),
                child: Text(
                  ame,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),

            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Rs. " + rice,
                  style: TextStyle(color: Colors.red, fontSize: 25),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 1,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Center(

                child: GestureDetector(
                  onTap: _incrementCounter,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                " " + '$_counter' + "    ",
                style: const TextStyle(fontSize: 25),
              ),
              GestureDetector(
                onTap: _decrementCounter,
                child: Row(
                  children: [
                    Icon(
                      Icons.remove,
                      color: Theme.of(context).primaryColor,
                      size: 50,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                // onPrimary: Colors.white,
                //shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(200, 50), //////// HERE
              ),
              onPressed: () async {
                Random random = new Random();
                int randomNumber = random.nextInt(100000000);
                int total = int.parse(rice) * int.parse('$_counter');
                String geo = total.toString();
                _petagory.name = ame;
                _petagory.des = geo;
                _petagory.price = rice;
                _petagory.quantity='$_counter';
                _petagory.url=icUrl;
                _petagory.id = randomNumber;
                var result = await _PetagoryServices.savePetagory(_petagory);

              },
              child: const Text('Add to Cart',style: TextStyle(fontSize: 17)),
            ),
          ),

        ],
      ),
    );
  }
}
/**/

