import 'package:flutter/material.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Fonts/fontsclass.dart';
class CustomeButton2 extends StatelessWidget {
  Color? colors;
  String? title;
  double? size;
final GestureTapCallback? onPressed;
  final  bool isLoading;

  CustomeButton2(
      {Key?key, required this.title, required this.colors, required this.size,required this.onPressed,required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: colors,
      splashColor: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0,3.0,5.0,3.0),
          child: isLoading? Container(
            height: 13,
            width: 13,
            child: Center(
              child: CircularProgressIndicator(
                color: ColorClass.whiteColors,
              ),
            ),
          ) : Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorClass.whiteColors,
                  fontSize: size,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat"
              ),
            ),
          ),
        ),
      ),
      onPressed: isLoading? null : onPressed,
      shape: const StadiumBorder(),
    );
  }
}