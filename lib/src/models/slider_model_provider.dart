 
import 'package:flutter/material.dart';

class SliderModelProvider with ChangeNotifier {
  
  double _currentPage = 0;
  double get currentPage => this._currentPage; 
  set currentPage( double currentPage ){
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color _colorPrimario = const Color.fromARGB(255, 0, 42, 227);
  Color get colorPrimario => this._colorPrimario; 
  set colorPrimario( Color colorPrimario ){
    this._colorPrimario = colorPrimario;
  }

  Color _colorSecundario = Colors.grey;
  Color get colorSecundario => this._colorSecundario; 
  set colorSecundario( Color colorSecundario ){
    this._colorSecundario = colorSecundario;
  }
  
  double _bulletPrimario = 15;
  double get bulletPrimario => this._bulletPrimario; 
  set bulletPrimario( double bulletPrimario ){
    this._bulletPrimario = bulletPrimario;
  }

  double _bulletSecundario = 12;
  double get bulletSecundario => this._bulletSecundario; 
  set bulletSecundario( double bulletSecundario ){
    this._bulletSecundario = bulletSecundario;
  }

}