import 'package:flutter/material.dart';

import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Fonts/fontsclass.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  Color? colors;
  String? title;
//  final  RxBool isLoading;
  CustomButton({Key?key,required this.onPressed,required this.title,required this.colors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Adjust the radius to your preference
        ),
          backgroundColor: colors,
          animationDuration:Duration(milliseconds: 200)
      ),

      child: Container(

        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0,3.0,5.0,3.0),
          child:  Text(title!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorClass.whiteColors,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamilyClass.fontfamily
            ),
          ),
        ),
      ),
      onPressed: onPressed,

    );
  }
}