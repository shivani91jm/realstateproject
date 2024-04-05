import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
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

    }
  }
}