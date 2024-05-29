import 'package:flutter/material.dart';
import 'package:realstateproject/Utils/SessionClass.dart';

class Updateprofileprovider extends ChangeNotifier {
  String name="",email="",address="", userid="",phone="",userimg="",token="";
  bool islogin=false;


  bool _loading=false;
  bool get loading => _loading;

}
