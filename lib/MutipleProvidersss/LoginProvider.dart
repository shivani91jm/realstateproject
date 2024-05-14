import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:realstateproject/Models/Auth/RegistrationModel.dart';
import 'package:realstateproject/Urls/baseUrlsClass.dart';

class LoginProvider extends ChangeNotifier {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
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
        RegistrationModel data =  RegistrationModel.fromJson(jsonDecode(response.body));
        if(data!=null)
        {
          // loading.value=false;
          // CommonUtilsClass.toastMessage(data.message.toString());
          //
          // //------------------------store data in local ---------------------
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // await prefs.setString('email', email);
          // await prefs.setString('user_id', data.userId.toString());
          // await prefs.setString('username', data.userNicename.toString());
          // await prefs.setString('mobile_number', data.mobileNumber.toString());
          // await prefs.setString('user_profile', data.profilePicture.toString());
          // await prefs.setString('user_firstName', data.first_name.toString());
          // await prefs.setString('user_lastName', data.last_name.toString());
          //
          // showDialog(context: context!, builder: (BuildContext context) {
          //   return  CustomDialogBox(title: AppConstentData.Login,
          //     descriptions: AppConstentData.loginsucess,
          //     img: Image.asset(ImageUrls.check_url), okBtn: AppConstentData.ok
          //     , cancelBtn: AppConstentData.cancel, pagename: RouteNames.dashboard_screen,);
          // }
          // );



        }
      }

      else if (response.statusCode == 500)
      {
        //loading.value=false;
        // CommonUtilsClass.toastMessage("Server side Error");
      }
      else {
        //   loading.value=false;
        throw Exception('Failed to load album');
      }
    }
  }
}