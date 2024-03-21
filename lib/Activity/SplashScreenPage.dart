import 'package:flutter/material.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Fonts/fontsclass.dart';
import 'package:realstateproject/Images/AppImage.dart';
import 'package:realstateproject/Widgets/CustomButton.dart';
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Adjust the radius to your preference
            ),
            child: Image.asset(AppImages.m4_url, // Provide path to your image asset
              fit: BoxFit.cover,
            ),
          ),
          // Overlay Content
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.black.withOpacity(0.2), // Overlay color and opacity
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(70), // Adjust the radius to your preference
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(AppImages.ic1_url, // Provide path to your image asset
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
                    Container(
                      height: 50,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                          borderRadius: BorderRadius.circular(10), // Adjust the radius to your preference
                        ),
                        child: CustomButton(onPressed: () {  }, title: "Let's start", colors: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),)),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
