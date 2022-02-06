class Petagory{
  late int id;
  late String name;
  late String des;
  late String price;
  late String quantity;
  late String url;

  petagoryMap(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id;
    mapping['name']=name;
    mapping['des']=des;
    mapping['price']=price;
    mapping['quantity']=quantity;
    mapping['url']=url;

    return mapping;
  }
}