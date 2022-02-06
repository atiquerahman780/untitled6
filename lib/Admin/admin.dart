import 'package:flutter/material.dart';
import 'package:untitled6/Admin/add_products.dart';
import 'package:untitled6/Admin/see_news.dart';
import 'package:untitled6/Admin/see_product.dart';
import 'package:untitled6/Admin/uploadpdf_boook.dart';

import '../see_pdf_book.dart';
import 'add_breaking_news.dart';
class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin"),),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(200, 50), //////// HERE
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddNews()),
                );
              },
              child: const Text('Add Breaking News',style: TextStyle(fontSize: 17)),
            ),ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                // onPrimary: Colors.white,
                //shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(200, 50), //////// HERE
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddProducts()),
                );
              },
              child: const Text('Add Tasbeeh and books',style: TextStyle(fontSize: 17)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                // onPrimary: Colors.white,
                //shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(200, 50), //////// HERE
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Products()),
                );
              },
              child: const Text('Edit, Delete, Read',style: TextStyle(fontSize: 17)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                // onPrimary: Colors.white,
                //shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(200, 50), //////// HERE
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Pro()),
                );
              },
              child: const Text('See pic',style: TextStyle(fontSize: 17)),
            ),ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                // onPrimary: Colors.white,
                //shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(200, 50), //////// HERE
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UploadPdf()),
                );
              },
              child: const Text('add Book PDF',style: TextStyle(fontSize: 17)),
            ),ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                // onPrimary: Colors.white,
                //shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(200, 50), //////// HERE
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const SeePdfBook()),
                // );
              },
              child: const Text('See Book PDF',style: TextStyle(fontSize: 17)),
            ),
          ],
        ),
      ),
    );
  }
}
