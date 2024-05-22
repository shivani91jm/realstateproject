import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:realstateproject/Activity/DashBoardPage.dart';
import 'package:realstateproject/CommonUtils.dart';
import 'package:realstateproject/Models/Auth/DetailsModel.dart';
import 'package:realstateproject/Models/Auth/LoginModel.dart';

import 'package:realstateproject/Urls/baseUrlsClass.dart';

import 'package:shared_preferences/shared_preferences.dart';
class LoginProvider extends ChangeNotifier {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;
  bool _loading=false;
  bool get loading => _loading;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
  LoginProvider() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }
  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      var urls=Urls.login_api;
      print("url is location"+urls+"nameController.text.toString("+passwordController.text.toString()+emailController.text.toString());
      var body=jsonEncode(<String, String>{
        'password': passwordController.text.toString(),
        'email': emailController.text.toString()
      });
      print("body"+body.toString());
      final response = await http.post(Uri.parse(urls),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode == 200)
      {
        LoginModel data =  LoginModel.fromJson(jsonDecode(response.body));
        if(data!=null)
        {
          print("data"+data.toString());
          try {
            var url= Urls.details_api;
            print("res body"+url.toString());
            final response = await http.post(Uri.parse(url),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization': 'Bearer '+data.accessToken.toString()
                });
            if (response.statusCode == 200) {
              _loading=false;
              notifyListeners();
              final item = json.decode(response.body);
              DetailsModel  data = DetailsModel.fromJson(item);
              print("dshdhsdhhsd"+item.toString());
              showDeailsUser(data,context);
              print('Error Occurredgg'+data.toString());
            }
            else {
              print('Error Occurred');
              _loading=false;
              notifyListeners();
            }
          } catch (e) {
            print('Error Occurredcvccv'+e.toString());
          }

        }
      }
      else if (response.statusCode == 401)
      {

      var res=  json.decode(response.body);
        var msg= res['error'];
        CommonUtile.snackbar(msg, "", context);
      _loading=false;
      notifyListeners();
      }
      else {
        _loading=false;
        notifyListeners();
        throw Exception('Failed to load album');
      }
    }
  }
  void  showDeailsUser (DetailsModel detailsModel,BuildContext context) async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('email', detailsModel.email);
   await prefs.setString('user_id', detailsModel.id.toString());
   await prefs.setString('name', detailsModel.name.toString());
   await prefs.setString('mobile_number', detailsModel.phone.toString());
   await prefs.setString('user_profile', detailsModel.image.toString());
   await prefs.setString('email_varify', detailsModel.emailVerified.toString());
   await prefs.setString('address', detailsModel.address.toString());
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));
  }

}