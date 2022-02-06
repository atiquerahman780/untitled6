import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);
  @override
  _AddProductsState createState() => _AddProductsState();
}
class _AddProductsState extends State<AddProducts> {
  late String fileUrl;
  int c =0;
  late TextEditingController _nameController, _priceController, _categorieController;
  late File imgFile;
  late DatabaseReference _reference;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController=TextEditingController();
    _categorieController=TextEditingController();
    _priceController=TextEditingController();
    _reference =FirebaseDatabase.instance.reference().child('products');
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Text('Save Product'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // (ImageUrl!=null)
              //Image.network("https://picsum.photos/seed/picsum/200/300"),
              // Placeholder(fallbackHeight: 200.0,fallbackWidth: double.infinity),
              //  SizedBox(height: 20.0,),
              RaisedButton(
                  child: Text('Upload image'),
                  color: Colors.lightBlue,

                  onPressed: (){
                    uploadImage();
                  }),
              SizedBox(
                height: 100,
              ),
              c==0 ? Image.network("https://picsum.photos/seed/picsum/200/300"): Image.file(
                imgFile,
                height: 200,
                width: double.infinity,
              ),









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
                controller: _categorieController,
                decoration:
                InputDecoration(
                    hintText: 'Beverage,Laptops,Games,Movies,Watches,Furniture',
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
                child: ElevatedButton(child: Text('Save Product',style: TextStyle(
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

      ),
    );

  }
  void saveProduct(){


    String name = _nameController.text;
    String categorie = _categorieController.text;
    String price = _priceController.text;
    String key = _reference.push().key as String;
    Map<String,String> products={
      'name' :name,
      'categorie' :categorie,
      'price' :price,
      'picUrl' :fileUrl,
      'id' : key
    };


    _reference.child(key).set(products).then((value) {
      Navigator.pop(context);
    });

  }
  Future<void> uploadImage() async {

    final _fireStorage = FirebaseStorage.instance;
    final image = ImagePicker();
    PickedFile pickedFile;

    // Request Photos Permission
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    // Checking Permission
    if (permissionStatus.isGranted) {
      pickedFile = (await image.getImage(source: ImageSource.gallery))!;
      if (pickedFile != null) {
        imgFile = File(pickedFile.path);
        setState(() {
          c=1;
        });
        var file = imgFile;
        // Getting File Path
        String fileName = file.uri.path.split('/').last;

        // Uploading Image to FirebaseStorage
        var filePath = await _fireStorage
            .ref()
            .child('demo/$fileName')
            .putFile(file)
            .then((value) {
          return value;
        });
        // Getting Uploaded Image Url
        String downloadUrl = await filePath.ref.getDownloadURL();
        fileUrl = downloadUrl;
        setState(() {});
      } else {
        print('No Image Selected');
      }
    } else {
      print('Provider Permission');
    }
  }
/*uploadImage() async {

     final ImagePicker _picker = ImagePicker();
     // Pick an image
     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
     //var permissionStatus =

   }*/
}


