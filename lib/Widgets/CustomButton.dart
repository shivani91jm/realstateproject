import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Fonts/fontsclass.dart';
import 'package:realstateproject/MutipleProvidersss/LoginProvider.dart';

class CustomButton extends StatelessWidget {
  Color? colors;
  String? title;
  double? size;
  CustomButton({Key?key,required this.title,required this.colors,required this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
          padding:  EdgeInsets.fromLTRB(5,10.0,5.0,5),
          child:  Text(title!,
           textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorClass.whiteColors,
              fontSize: size,
              fontWeight: FontWeight.bold,
              fontFamily: FontFamilyClass.fontfamily
        ),
       ),
    ));










  }
}