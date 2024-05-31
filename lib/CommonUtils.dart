import 'package:flutter/material.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Utils/StyleClass.dart';

class CommonUtile {
  static snackbarGreen(String msg, String page,BuildContext context){

    final snackBar = SnackBar(
      content:  Text(msg!,style: StyleClass.whitestyle,),
      backgroundColor: ColorClass.green,
    );
    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }
  static snackbarRed(String msg, String page,BuildContext context){

    final snackBar = SnackBar(
      content:  Text(msg!,style: StyleClass.whitestyle,),
      backgroundColor: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
    );
    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }
  static snackbar(String msg, String page,BuildContext context){

    final snackBar = SnackBar(
      content:  Text(msg!,style: StyleClass.whitestyle,),
      backgroundColor: GradientHelper.getColorFromHex(ColorClass.blue),
    );
    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }

}