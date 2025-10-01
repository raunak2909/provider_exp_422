import 'package:flutter/cupertino.dart';

class ListProvider extends ChangeNotifier{

  ///data(state)
  List<Map<String, dynamic>> _data = [];

  List<Map<String, dynamic>> getData() => _data;

  ///events
  ///insert
  void addData(Map<String, dynamic> newData){
    _data.add(newData);
    notifyListeners();
  }
  ///update
  void updateData(Map<String, dynamic> updatedData, int index){
    _data[index] = updatedData;
    notifyListeners();
  }
  ///delete
  void deleteData(int index){
    _data.removeAt(index);
    notifyListeners();
  }

}