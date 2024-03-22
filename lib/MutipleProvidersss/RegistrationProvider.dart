import 'package:flutter/material.dart';

class RegistrationProvider extends ChangeNotifier {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  RegistrationProvider() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
     notifyListeners();
  }


  Future<void> register(BuildContext context) async {
    if (formKey.currentState!.validate()) {

    }
   }


  }
