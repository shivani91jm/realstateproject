import 'package:flutter/material.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Fonts/fontsclass.dart';

class StyleClass{
  static  TextStyle blackstyle = TextStyle(
    fontFamily: FontFamilyClass.fontfamily,
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: GradientHelper.getColorFromHex(ColorClass.BLACK_COLOR),
    fontStyle: FontStyle.normal,
    // Add other properties as needed
  );
  static  TextStyle black17style = TextStyle(
    fontFamily: FontFamilyClass.fontfamily,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: ColorClass.greyColors,
    fontStyle: FontStyle.normal,
    // Add other properties as needed
  );  static  TextStyle Red20style = TextStyle(
    fontFamily: FontFamilyClass.fontfamily,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
    fontStyle: FontStyle.normal,
    // Add other properties as needed
  );
  static  TextStyle Black20style = TextStyle(
    fontFamily: FontFamilyClass.fontfamily,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: GradientHelper.getColorFromHex(ColorClass.BLACK_COLOR),
    fontStyle: FontStyle.normal,
    // Add other properties as needed
  );
  static  TextStyle bluestyle = TextStyle(
    fontFamily: FontFamilyClass.fontfamily,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: GradientHelper.getColorFromHex(ColorClass.blue),
    fontStyle: FontStyle.normal,
    // Add other properties as needed
  );

  static  TextStyle redstyle = TextStyle(
    fontFamily: FontFamilyClass.fontfamily,
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
    fontStyle: FontStyle.normal,
    // Add other properties as needed
  );
  static  TextStyle textformstyle = TextStyle(
    fontFamily: FontFamilyClass.fontfamily,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: GradientHelper.getColorFromHex(ColorClass.label_COLOR),
    fontStyle: FontStyle.normal,

    // Add other properties as needed
  );
  static  TextStyle text17 = TextStyle(
    fontFamily: FontFamilyClass.fontfamily,
    fontWeight: FontWeight.w800,
    fontSize: 16,
    color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
    fontStyle: FontStyle.normal,
    // Add other properties as needed
  );
  static  TextStyle text14 = TextStyle(
    fontFamily: FontFamilyClass.fontfamily,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.underline,
    decorationColor: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
    decorationThickness: 2,

    // Add other properties as needed
  );

}