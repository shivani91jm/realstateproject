import 'package:flutter/material.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Fonts/fontsclass.dart';
import 'package:realstateproject/Images/AppImage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(70), // Adjust the radius to your preference
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(AppImages.back_url, // Provide path to your image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Real Estate", style: TextStyle(
                  color: ColorClass.whiteColors,
                  fontFamily: FontFamilyClass.fontfamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 35
              ),),
            ),

            SizedBox(
              height: 200,
            ),


          ],
        ),
      ),
    );
  }

}
