import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Products/detail_product.dart';
import '../../../Data.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}
class _BookState extends State<Search> {
  TextEditingController editingController = TextEditingController();
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
    return Scaffold(
      body: Container(
        child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height*0.12,
                width: MediaQuery.of(context).size.height,
              child:
        Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextField(
cursorColor: Colors.orange,
          onChanged: (text) {
            SearchMethod(text);
          },
          textCapitalization: TextCapitalization.sentences,

          controller: editingController,
          decoration: const InputDecoration(
            //hoverColor: Colors.orange,
              labelText: "Search",
              hintText: "Search",
              prefixIcon: Icon(Icons.search,color: Colors.orange,),
              suffixStyle: const TextStyle(color: Colors.green),

              border: OutlineInputBorder(

                  borderRadius: BorderRadius.all(Radius.circular(25.0),),
              )
          ),

        ),
      ),
              ),
      Expanded(
      child: dataList.isEmpty ?
      const Center(child:Text("NO DATA AVAILABLE",
      style: TextStyle(fontSize: 30),)):
    GridView.builder(
    //shrinkWrap: true,
    // physics: ScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
  return Card(
      elevation: 7,
      margin: const EdgeInsets.all(15),
      color: Colors.grey,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailProduct(data: Data(id, name, picUrl, price));
          }));
        },
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.all(1.5),
          padding: const EdgeInsets.all(10),
          child:
          Column(
            children: <Widget>[
              Image.network(picUrl, fit: BoxFit.cover, height: 80, width: 100,),
              const SizedBox(height: 1,),
              SizedBox(
                //height: 10,
                width: 100,
                child: Text(name, style: const TextStyle(color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              const SizedBox(height: 1,),
              SizedBox(
                width: 100,
                child:
                Text(price,
                  style: const TextStyle(color: Colors.red, fontSize: 10),
                  textAlign: TextAlign.left,),
              ),
            ],
          ),
        ),
      )
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

