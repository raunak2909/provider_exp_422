import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  int _count = 0;

  ///events
  //set count
  void incrementCount(){
    _count++;
    notifyListeners();
  }
  //get count
  int getCount(){
    return _count;
  }

}