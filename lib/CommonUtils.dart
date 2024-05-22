import 'package:flutter/material.dart';

class CommonUtile{
  static snackbar(String msg, String page,BuildContext context){

    final snackBar = SnackBar(
      content:  Text(msg!),
    );
    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }
}