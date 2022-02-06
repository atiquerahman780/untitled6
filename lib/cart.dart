import 'package:flutter/material.dart';
import 'package:untitled6/localStorage/Category_Services.dart';
import 'package:untitled6/localStorage/category1.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  _showFormDialog(BuildContext context, petagoryId, int index) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (p) {
        return AlertDialog(
          actions: <Widget>[
            FlatButton(
                onPressed: () async {
                  var result = _petagoryServices.deletePetagory(petagoryId);
                  setState(() {
                    u.r = _pategorylist.length.toString();
                    _pategorylist.removeAt(index);
                    _pategorylist = _pategorylist;
                    _pategorylist.length = _pategorylist.length;
                    Navigator.pop(p);
                    if (_pategorylist.length == 0) {
                      u.r = "0";
                      i.m = "0";
                    } else {
                      getAllPategory();
                    }
                  });
                },
                child: const Text("Delete")),
            FlatButton(
                onPressed: () {
                  Navigator.pop(p);
                },
                child: const Text("Cancel")),
          ],
          title: const Text("Are You Sure"),
        );
      },
    );
  }

  var pategory;
  var _petagory = Petagory();
  List<Petagory> _pategorylist = <Petagory>[];

  @override
  void initState() {
    super.initState();
    getAllPategory();
  }

  getAllPategory() async {
    int sum = 0;
    _pategorylist = <Petagory>[];
    var categories = await _petagoryServices.readCategories();
    categories.forEach((petagory) {
      setState(() {
        var petagoryModel1 = Petagory();
        petagoryModel1.name = petagory['name'];
        petagoryModel1.des = petagory['des'];
        petagoryModel1.price = petagory['price'];
        petagoryModel1.quantity = petagory['quantity'];
        petagoryModel1.url = petagory['url'];
        petagoryModel1.id = petagory['id'];
        _pategorylist.add(petagoryModel1);
        int a = int.parse(petagoryModel1.des);
        sum = sum + a;
        print("sum=" + sum.toString());
        i.m = sum.toString();
        u.r = _pategorylist.length.toString();
        print(_pategorylist.length);
      });
    });
  }

  final _petagoryServices = PetagoryServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart"),),
        body: Column(
      children: [
        Expanded(
          child: Center(
            child: ListView.builder(
              itemCount: _pategorylist.length,
              itemBuilder: (context, index) {
                return _pategorylist.isEmpty
                    ? const Center(
                        child: Text(
                        "NO DATA AVAILABLE",
                        style: TextStyle(fontSize: 30),
                      ))
                    : Card(
                        child: ListTile(
                            title: Text(_pategorylist[index].name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [Text(_pategorylist[index].des)],
                                ),
                                //Text(_pategorylist[index].size),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Theme.of(context).accentColor),
                                      child: SingleChildScrollView(
                                        child: Row(
                                          children: [
                                            InkWell(
                                                onTap: () async {
                                                  int qu = int.parse(
                                                      _pategorylist[index]
                                                          .quantity);
                                                  if (qu > 1) {
                                                    qu--;
                                                  }

                                                  print(
                                                      "ooooo" + qu.toString());
                                                  _petagory.id =
                                                      _pategorylist[index].id;
                                                  _petagory.quantity =
                                                      qu.toString();
                                                  int updateprice = qu *
                                                      int.parse(
                                                          _pategorylist[index]
                                                              .price);
                                                  String price =
                                                      updateprice.toString();
                                                  _petagory.name =
                                                      _pategorylist[index].name;

                                                  _petagory.des = price;
                                                  _petagory.price =
                                                      _pategorylist[index]
                                                          .price;
                                                  _petagory.url =
                                                      _pategorylist[index].url;

                                                  var result =
                                                      await _petagoryServices
                                                          .updatePetagory(
                                                              _petagory);
                                                  setState(() {
                                                    getAllPategory();
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                  size: 16,
                                                )),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3,
                                                      vertical: 2),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  color: Colors.white),
                                              child:
                                                  // StreamBuilder(
                                                  //     stream: counterBloc.counterStream,
                                                  //     initialData: 0,
                                                  //     builder: (context, snapshot){
                                                  //       return Text(
                                                  //         '${snapshot.data}',
                                                  //         style: Theme.of(context).textTheme.headline4,
                                                  //       );
                                                  //     }
                                                  // ),

                                                  Text(_pategorylist[index]
                                                          .quantity
                                                      // staticquantity.quantity,
                                                      // style: TextStyle(color: Colors.black, fontSize: 16),
                                                      ),
                                            ),
                                            InkWell(
                                                onTap: () async {
                                                  int qu = int.parse(
                                                      _pategorylist[index]
                                                          .quantity);
                                                  qu++;

                                                  print(
                                                      "ooooo" + qu.toString());
                                                  _petagory.id =
                                                      _pategorylist[index].id;
                                                  _petagory.quantity =
                                                      qu.toString();
                                                  int updateprice = qu *
                                                      int.parse(
                                                          _pategorylist[index]
                                                              .price);
                                                  String price =
                                                      updateprice.toString();
                                                  _petagory.name =
                                                      _pategorylist[index].name;

                                                  _petagory.des = price;
                                                  _petagory.price =
                                                      _pategorylist[index]
                                                          .price;
                                                  _petagory.url =
                                                      _pategorylist[index].url;

                                                  var result =
                                                      await _petagoryServices
                                                          .updatePetagory(
                                                              _petagory);
                                                  setState(() {
                                                    getAllPategory();

                                                    print(result);
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 16,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            leading: Image.network(_pategorylist[index].url),
                            trailing: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    var ind = index;
                                    setState(() {
                                      _showFormDialog(context,
                                          _pategorylist[index].id, ind);
                                    });
                                  },
                                ),
                              ],
                            )));
              },
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: Card(
            child: Column(
              children: [
                Row(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft, child: Text(" Item(s)")),
                    const Expanded(child: SizedBox()),
                    Align(alignment: Alignment.topRight, child: Text(u.r)),
                  ],
                ),
                Row(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(" Item Total")),
                    const Expanded(child: SizedBox()),
                    Align(alignment: Alignment.topRight, child: Text(i.m)),
                  ],
                ),
                Row(
                  children: const [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(" Deliver Charges")),
                    Expanded(child: SizedBox()),
                    Align(alignment: Alignment.topRight, child: Text("0")),
                  ],
                ),
                const Divider(
                  height: 5,
                  thickness: 2,
                  indent: 5,
                  endIndent: 5,
                ),
                Row(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(" Total Price")),
                    Expanded(child: const SizedBox()),
                    Align(alignment: Alignment.topRight, child: Text(i.m)),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => checkout()),
                      // );
                    },
                    child: Text("Proceed to Check Out"))
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class u {
  static String r = '';
}

class i {
  static String m = '';
}
