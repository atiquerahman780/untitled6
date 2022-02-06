import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  //const Edit({Key? key}) : super(key: key);
  String productKey;
  Edit({required this.productKey});
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController _nameController, _priceController;

  late DatabaseReference _reference;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController=TextEditingController();
    _priceController=TextEditingController();
    _reference =FirebaseDatabase.instance.reference().child('products');
    getProductDetail();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration:
              InputDecoration(
                  hintText: 'Product Name',
                  prefixIcon: Icon(Icons.production_quantity_limits_outlined,size: 30,) ,
                  fillColor: Colors.white,
                  filled: true
              ),
            ),
            SizedBox(height: 15),

            TextFormField(
              controller: _priceController,
              decoration:
              InputDecoration(
                  hintText: 'Product Price',
                  prefixIcon: Icon(Icons.price_check,size: 30,) ,
                  fillColor: Colors.white,
                  filled: true
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(child: Text('Update Product',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              ),
                onPressed: (){
                  saveProduct();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getProductDetail()async{
    DataSnapshot snapshot= (await _reference.child(widget.productKey).once()) as DataSnapshot;
    Map product =snapshot.value as Map;
    _nameController.text =product['name'];
    _priceController.text =product['price'];
  }



  void saveProduct(){
    String name = _nameController.text;
    String price = _priceController.text;
    Map<String,String> products={
      'name' :name,
      'price' :price,
    };
    _reference.child(widget.productKey).update(products).then((value) {
      Navigator.pop(context);
    });

  }
}


