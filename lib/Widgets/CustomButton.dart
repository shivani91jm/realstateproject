import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Fonts/fontsclass.dart';
import 'package:realstateproject/MutipleProvidersss/LoginProvider.dart';

class CustomButton extends StatelessWidget {

  Color? colors;
  String? title;
//  final  RxBool isLoading;
  CustomButton({Key?key,required this.title,required this.colors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          return  ElevatedButton(
              style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Adjust the radius to your preference
              ),
              backgroundColor: colors,
              animationDuration:Duration(milliseconds: 200)
              ),

          onPressed: () {
            loginProvider.login(context);
          },
          child: loginProvider.loading?
          Container(height: 30,width: 30,child: Center(child: CircularProgressIndicator(),),)
              : Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                            padding: const EdgeInsets.fromLTRB(5.0,3.0,5.0,3.0),
                            child:  Text(title!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                            color: ColorClass.whiteColors,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamilyClass.fontfamily
                        ),
                     ),
                    ),
          ));
        });









  }
}