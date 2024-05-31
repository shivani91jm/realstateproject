import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:realstateproject/CommonUtils.dart';
import 'package:realstateproject/Models/Auth/RegistrationModel.dart';
import 'package:realstateproject/Urls/baseUrlsClass.dart';
import 'package:realstateproject/Utils/CommonUtilsClass.dart';

class RegistrationProvider extends ChangeNotifier {
   TextEditingController nameController=TextEditingController();
   TextEditingController emailController= TextEditingController();
   TextEditingController passwordController =TextEditingController();
   TextEditingController confirmpasswordController=TextEditingController();
   GlobalKey<FormState> formKey=   GlobalKey<FormState>();
  RegistrationProvider() {
   // nameController = TextEditingController();

  }
   bool _loading=false;
   bool get loading => _loading;
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
     notifyListeners();
  }
  Future<void> register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      _loading=true;
      notifyListeners();
      try{
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

          var urls=Urls.register_api;
          print("url is location"+urls+"nameController.text.toString("+nameController.text.toString()+passwordController.text.toString()+emailController.text.toString());
          var body=jsonEncode(<String, String>{
            'name': nameController.text.toString(),
            'password': passwordController.text.toString(),
            'email': emailController.text.toString()
          });
          print("body"+body.toString());
          final response = await http.post(Uri.parse(urls),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: body);
          print("res"+response.body.toString());
          if(response.statusCode == 200)
          {
            RegistrationModel data =  RegistrationModel.fromJson(jsonDecode(response.body));
            if(data!=null)
            {
              _loading=false;
              notifyListeners();
              emailController.text="";
              passwordController.text="";
              nameController.text="";
              CommonUtile.snackbarGreen(""+data.success.toString(), " ", context);

            }
          }
          else if(response.statusCode == 401)
          {
            _loading=false;
            notifyListeners();
            var res = json.decode(response.body);
            var msg = res['error'];
            CommonUtile.snackbar(msg,"",context);

          }

          else if (response.statusCode == 500)
          {
            _loading=false;
            notifyListeners();
            CommonUtile.snackbar("Server side Error","",context);

          }
          else {
            _loading=false;

            notifyListeners();
            var res = json.decode(response.body);
            var msg = res['error'];
            if(msg=="Email already exists") {
              CommonUtile.snackbarGreen(msg, "", context);
            }
            else
              {
                CommonUtile.snackbar("Something went wrong", "", context);
              }

          }
        }
      }on SocketException catch(_){
        _loading=false;
        notifyListeners();
        CommonUtile.snackbarRed("No Internet Connection .......","",context);
      }
    }
   }
@override
  void dispose() {
   nameController.dispose();
   emailController.dispose();
   passwordController.dispose();
    super.dispose();
  }

  }
