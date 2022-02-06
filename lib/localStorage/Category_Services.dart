import 'package:untitled6/Data.dart';
import 'package:untitled6/localStorage/Repositry.dart';
import 'package:untitled6/localStorage/category1.dart';


class PetagoryServices{
  late Repository _repository;
  PetagoryServices(){
    _repository= Repository();
  }
  savePetagory(Petagory petagory) async{
    return await _repository.insertData('categories', petagory.petagoryMap());
  }
  readCategories()async{
    return await _repository.readData('categories');
  }
  deletePetagory(petagoryId) async{
    return await _repository.deleteData('categories',petagoryId);
  }
  updatePetagory(Petagory petagory) async{
    return await _repository.updateData('categories', petagory.petagoryMap());
  }

}