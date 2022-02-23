import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/HomeScreen/home_screen.dart';
import 'package:untitled6/HomeScreen/search.dart';
import 'package:untitled6/HomeScreen/searchDetail.dart';
import 'package:untitled6/Login/sign_in.dart';
import 'package:untitled6/Products/detail_product.dart';
import '../../../Data.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}
class _BookState extends State<Search> {
  TextEditingController editingControler = TextEditingController();

  List<Data> dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Query referenceData = FirebaseDatabase.instance.reference().child(
        "products");
    referenceData.once().then((DataSnapshot dataSnapshot) {
      dataList.clear();
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;
      for (var key in keys) {
        Data data = Data(
          values [key]["id"],
          values [key]["name"],
          values [key]["picUrl"],
          values [key]["price"],
        );
        dataList.add(data);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            children: <Widget>[

              SizedBox(
                height: MediaQuery.of(context).size.height*0.08,
                width: MediaQuery.of(context).size.height,
              child:
                  Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width* 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                              // Navigator.push(context, MaterialPageRoute(builder: (_) {
                              //   return HomeScreen();
                              // }));
                            },
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                       SizedBox(
                         height: MediaQuery.of(context).size.height,
                         width: MediaQuery.of(context).size.width* 0.70,
                         child:Padding(
                           padding: const EdgeInsets.all(5.0),
                           child: Center(
                             child: TextField(


                               autofocus: true,
                               cursorColor: Colors.red,
                               onChanged: (text) {
                                 SearchMethod(text);
                                 print(text);
                                 abc.category=text;
                               },
                               textInputAction: TextInputAction.go,
                               //textCapitalization: TextCapitalization.sentences,

                               controller: editingControler,
                               decoration: const InputDecoration(

                                 //hoverColor: Colors.orange,
                                   //labelText: "Search",
                                   hintText: "Search",
                                   //prefixIcon: Icon(Icons.search,color: Colors.orange,),
                                   //suffixStyle: const TextStyle(color: Colors.green),

                                   border: OutlineInputBorder(


                                     borderRadius: BorderRadius.all(Radius.circular(15.0),),
                                   )
                               ),

                             ),
                           ),
                         ),
                       ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.06,
                        width: MediaQuery.of(context).size.width* 0.20,
                        child:GestureDetector(
                          onTap: (){
                            Navigator. pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchDetail(),
                              ),
                            );
                          },
                            child: Center(child: Text("Search")))
                      ),


                    ],
                  )

              ),

        Expanded(
          child:
        // child:  editingControler.value.?
        // const Center(child:Text("NO DATA AVAILABLE",
        // style: TextStyle(fontSize: 30),)):
      ListView.builder(
      shrinkWrap: true,
       physics: ScrollPhysics(),
     // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: dataList.length,
      itemBuilder: (_,index){
      return cardUI(dataList[index].id,dataList[index].name,dataList[index].picUrl,dataList[index].price);
      })
  ),

  ],
  ),
  ),
    );

}

Widget cardUI(String id, String name, String picUrl, String price) {
  return InkWell(
    onTap: () {
      abc.category=name;
      Navigator. pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SearchDetail(),
        ),
      );
    },
    child: Container(
      color: Colors.white,
      margin: const EdgeInsets.all(1.5),
      padding: const EdgeInsets.all(15),
      child:
      Text(name, style: const TextStyle(color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    ),
  );
}
  void SearchMethod(String text) {
    DatabaseReference searchRef= FirebaseDatabase.instance.reference().child("products");
    searchRef.once().then((DataSnapshot snapshot){
      dataList.clear();
      var keys = snapshot.value.keys;
      var values = snapshot.value;
      for(var key in keys){
        Data data = new Data(
          values [key]["id"] ,
          values [key]["name"] ,
          values [key]["picUrl"] ,
          values [key]["price"] ,
        );
        if (data.name.contains(text)){
          dataList.add(data);
        }
      }
      Timer(Duration(seconds: 1),(){
        setState(() {
        });
      });
    });
  }
}
class abc {
  static String category="";
}

