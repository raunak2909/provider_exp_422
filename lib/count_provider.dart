import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  int _count = 0;

  ///List<Map<String, dynamic>>
  ///add
  ///fetch
  ///update
  ///delete

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