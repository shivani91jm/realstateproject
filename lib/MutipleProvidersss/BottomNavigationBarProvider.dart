import 'package:flutter/material.dart';

class BottomNavigationBarProvider  with ChangeNotifier{
  int _selectedIndex = 0;
  int _drawerIndex = 0;
  int get drawerIndexs => _drawerIndex;
  int get selectedIndex => _selectedIndex;
  void setselectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }


}