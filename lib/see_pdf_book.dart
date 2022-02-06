// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
// import 'package:flutter/material.dart';
//
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:untitled6/viewpdf.dart';
//
//
// class SeePdfBook extends StatefulWidget {
//   const SeePdfBook({Key? key}) : super(key: key);
//
//
//   @override
//   _SeePdfBookState createState() => _SeePdfBookState();
// }
//
// class _SeePdfBookState extends State<SeePdfBook> {
//   firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
//
//
//   Future<String> downloadFile(String url, String fileName, String dir) async {
//     HttpClient httpClient = new HttpClient();
//     File file;
//     String filePath = '';
//     String myUrl = '';
//
//     try {
//       myUrl = url+'/'+fileName;
//       var request = await httpClient.getUrl(Uri.parse(myUrl));
//       var response = await request.close();
//       if(response.statusCode == 200) {
//         var bytes = await consolidateHttpClientResponseBytes(response);
//         filePath = '$dir/$fileName';
//         file = File(filePath);
//         await file.writeAsBytes(bytes);
//       }
//       else
//         filePath = 'Error code: '+response.statusCode.toString();
//     }
//     catch(ex){
//       filePath = 'Can not fetch url';
//     }
//
//     return filePath;
//   }
//
//
//   Future<void> listExample() async {
//     firebase_storage.ListResult result =
//     await firebase_storage.FirebaseStorage.instance.ref().child('playground').listAll();
//
//     result.items.forEach((firebase_storage.Reference ref) {
//       print('Found file: $ref');
//     });
//
//     result.prefixes.forEach((firebase_storage.Reference ref) {
//       print('Found directory: $ref');
//     });
//   }
//   Future<void> downloadURLExample() async {
//     String downloadURL = await firebase_storage.FirebaseStorage.instance
//         .ref('playground/some-file.pdf')
//         .getDownloadURL();
//     print("llllllllllllllllllllllllllll");
//     print(downloadURL);
//     print("llllllllllllllllllllllllllll");
//     PDFDocument doc = await PDFDocument.fromURL(downloadURL);
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) =>  ViewPDF(doc)),
//     );  //Notice the Push Route once this is done.
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     listExample();
//     downloadURLExample();
//     print("All done!");
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: CircularProgressIndicator(
//       ),
//     );
//   }
// }
// class ViewPDF extends StatelessWidget {
//   PDFDocument document;
//    ViewPDF(this.document);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: Colors.orange,
//             // onPrimary: Colors.white,
//             //shadowColor: Colors.greenAccent,
//             elevation: 3,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(32.0)),
//             minimumSize: const Size(200, 50), //////// HERE
//           ),
//           onPressed: () {
//            print("llllllllllllllllllllllll");
//          //  print(document);
//            print("mmmmmmmmmmmmmmmmmmmmmm");
//           },
//           child: const Text('See Book PDF',style: TextStyle(fontSize: 17)),
//         ),
//         //PDFViewer(document: document),
//       ],
//     );
//   }
// }
//
//
//
//
//
