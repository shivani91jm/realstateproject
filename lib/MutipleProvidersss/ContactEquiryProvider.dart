import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:realstateproject/CommonUtils.dart';

import 'package:realstateproject/Urls/baseUrlsClass.dart';


class Contactequiryprovider extends ChangeNotifier {

  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController msgController;
  late TextEditingController subjectController;


  late GlobalKey<FormState> formKey;
  bool _loading=false;
  bool get loading => _loading;
  Contactequiryprovider() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    nameController = TextEditingController();
    msgController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  Future<void> sendEquiry(BuildContext context,String subject) async {
    if (formKey.currentState!.validate()) {

      if(subject.isNotEmpty) {
        _loading = true;
       // String selectedSubjects = subject.where((controller)=> controller.isNotEmpty).join(',');
        print("ffgfgfgh"+subject);
        var urls = Urls.contact_enquiry_api;
        var body = jsonEncode(<String, dynamic>{
          'name': nameController.text.toString(),
          'email': emailController.text.toString(),
          'subject': subject,
          'message': msgController.text.toString(),
          'phone': phoneController.text.toString()
        });
        print("body" + body.toString());
        final response = await http.post(Uri.parse(urls),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body
        );
        if (response.statusCode == 200) {
          _loading = false;
          notifyListeners();
          final item = json.decode(response.body);
          print("dshdhsdhhsd" + item.toString());
          if (item['message'] == "Message send successfully") {
            CommonUtile.snackbar("Message send successfully", " ", context);
            nameController.text="";
            phoneController.text="";
            msgController.text="";
            emailController.text="";
            Navigator.of(context).pop();
          }
        }
        else {
          print('Error Occurred');
          _loading = false;
          notifyListeners();
        }
      }
      else
        {
          CommonUtile.snackbar("Please select any one value", " ", context);
        }
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    msgController.dispose();
    super.dispose();
  }

}