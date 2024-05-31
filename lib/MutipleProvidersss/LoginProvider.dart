import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:realstateproject/Activity/DashBoardPage.dart';

import 'package:realstateproject/CommonUtils.dart';
import 'package:realstateproject/Models/Auth/DetailsModel.dart';
import 'package:realstateproject/Models/Auth/LoginModel.dart';

import 'package:realstateproject/Urls/baseUrlsClass.dart';
import 'package:realstateproject/Utils/SessionClass.dart';


class LoginProvider extends ChangeNotifier {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;
  bool _loading = false;

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

 login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      _loading=true;
      notifyListeners();
      try{
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          var urls = Urls.login_api;
          print("url is location" + urls + "nameController.text.toString(" +
              passwordController.text.toString() + emailController.text.toString());
          var body = jsonEncode(<String, String>{
            'password': passwordController.text.toString(),
            'email': emailController.text.toString()
          });
          print("body" + body.toString());
          final response = await http.post(Uri.parse(urls),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: body);
          if (response.statusCode == 200) {
            LoginModel data = LoginModel.fromJson(jsonDecode(response.body));
            if (data != null) {
              print("data" + data.toString());
              var token=data.accessToken.toString();
              try {
                var url = Urls.details_api;
                print("res body" + url.toString());
                final response = await http.post(Uri.parse(url),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                      'Authorization': 'Bearer ' + data.accessToken.toString()
                    });
                if (response.statusCode == 200) {
                  _loading = false;
                  notifyListeners();
                  final item = json.decode(response.body);
                  DetailsModel data = DetailsModel.fromJson(item);
                  print("dshdhsdhhsd" + item.toString());
                  showDeailsUser(data, context,token);
                  print('Error Occurredgg' + data.toString());
                }

              } catch (e) {
                CommonUtile.snackbarRed("Something went wrong...", "", context);
              }
            }
          }
          else if (response.statusCode == 401) {
            var res = json.decode(response.body);
            var msg = res['error'];
            if(msg=="Unauthorized")
              {
                CommonUtile.snackbarRed("Email or Password not matched try again ...", "", context);
              }
            else {
              CommonUtile.snackbarRed(msg, "", context);
            }
            _loading = false;
            notifyListeners();
          }
          else {
            CommonUtile.snackbarRed("Something went wrong...", "", context);
            _loading = false;
            notifyListeners();
            throw Exception('Failed to load album');
          }
        }
      } on SocketException catch(_){
        _loading=false;
        notifyListeners();
        CommonUtile.snackbarRed("No Internet Connection...", "", context);
      }
    }
  }

  void showDeailsUser(DetailsModel detailsModel, BuildContext context,String token) async {
      SessionManager.setLoggedIn(true);
      SessionManager.setUserId(detailsModel.id.toString());
      SessionManager.setToken(token);
      SessionManager.setName(detailsModel.name.toString());
      SessionManager.setAddress(detailsModel.address.toString());
      SessionManager.setMobile(detailsModel.phone.toString());
      SessionManager.setImage(detailsModel.image.toString());
      SessionManager.setEmail(detailsModel.email.toString());
      SessionManager.setVerifyEmail(detailsModel.emailVerified.toString());


      // Retrieve user session
      bool? isLoggedIn = await SessionManager.isLoggedIn();
      String? userId = await SessionManager.getUserId();
      print("userid"+userId.toString());

      String? tokens = await SessionManager.getToken();
      print("token"+tokens.toString());
      
      if(isLoggedIn==true)
        {
          CommonUtile.snackbar("Login Successfully", "", context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Dashboard(), // Navigate to your main screen
            ),
          );
        }


  }
}