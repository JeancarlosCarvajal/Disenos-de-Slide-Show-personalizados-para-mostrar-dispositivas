



import 'package:flutter/cupertino.dart';

class SliderModelProvider with ChangeNotifier {
  
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage( double currentPage ){
    this._currentPage = currentPage;
    notifyListeners();
  }


}