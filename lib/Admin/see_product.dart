import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'edit.dart';
class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);
  @override
  _ProductsState createState() => _ProductsState();
}
class _ProductsState extends State<Products> {
  late Query _ref;
  DatabaseReference reference=FirebaseDatabase.instance.reference().child('products');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('products');
  }
  Widget _buildPrductItem({required Map products}){
    return Container(
      //height: 200,
      color: Colors.white,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // saveData(),
              Row(
                children: [
                  Icon(Icons.person,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                  Text(products['name'],
                    style: const TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w600),),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.price_check,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                  Text(products['price'],
                    style: const TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w600),),
                ],
              ),
              Row(
                children: [
                  Image.network(products['picUrl'],
                    width: 100.0,
                    height: 100.0,
                  )
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> Edit(productKey: products['key'],  )));

                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit,color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 7,),
                        Text('Edit',
                          style: TextStyle(fontSize: 16,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600),),
                        const SizedBox(width: 19,),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      _showDeleteDialog(productKey: products['key']);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete,color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 7,),
                        Text('Delete',
                          style: TextStyle(fontSize: 16,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600),),
                        const SizedBox(width: 19,),
                      ],
                    ),
                  )
                ],
              )
              ,const Divider(height: 20,)
            ],
          ),
        ],
      ),
    );
  }
  _showDeleteDialog({required String productKey}){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text('Delete '),
        content: const Text('Are you sure to Delete'),
        actions: [
          FlatButton(onPressed: (){
            Navigator.pop(context);
          },
              child: const Text('cancel')),
          FlatButton(onPressed: (){
            reference.child(productKey).remove().whenComplete(() => Navigator.pop(context));
          },
              child: const Text('delete')),
        ],
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: SizedBox(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,itemBuilder: (BuildContext context,
            DataSnapshot snapshot,
            Animation<double>animation,int index){
          Map products=snapshot.value as Map;
          products['key'] = snapshot.key;
          return _buildPrductItem(products: products);
        },),
      ),
    );
  }
  
}
