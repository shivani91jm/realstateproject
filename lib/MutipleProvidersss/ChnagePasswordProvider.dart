import 'package:flutter/material.dart';
class ChangePasswordProvider  extends ChangeNotifier {

  late TextEditingController passwordController;
  late TextEditingController confirmPassController;

    late GlobalKey<FormState> formKey;
    bool _loading=false;
    bool get loading => _loading;

    ChangePasswordProvider() {
      passwordController = TextEditingController();
      confirmPassController = TextEditingController();
      formKey = GlobalKey<FormState>();
    }

}