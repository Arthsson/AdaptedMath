import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum AppTheme { LIGHT, DARK}

class AppSettings extends ChangeNotifier {
  double _fontSize = 30.0;
  AppTheme _theme = AppTheme.LIGHT;

  double get fontSize => _fontSize;
  AppTheme get theme => _theme;

  void setFontSize(double size) {
    _fontSize = size;
    notifyListeners();
  }

  void setTheme(AppTheme theme) {
    _theme = theme;
    notifyListeners();
  }

  void toggleTheme(){
    if(_theme == AppTheme.LIGHT){
        setTheme(AppTheme.DARK);
    }else{
       setTheme(AppTheme.LIGHT);
    }
    
  }
}
