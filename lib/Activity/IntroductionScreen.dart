import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:realstateproject/Activity/DashBoardPage.dart';
import 'package:realstateproject/Activity/LoginPage.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Fonts/fontsclass.dart';
import 'package:realstateproject/Images/AppImage.dart';
class IntroducationScreen extends StatefulWidget {
  const IntroducationScreen({super.key});

  @override
  State<IntroducationScreen> createState() => _IntroducationScreenState();
}

class _IntroducationScreenState extends State<IntroducationScreen> {
  @override
  Widget build(BuildContext context) {
    return   OnBoardingSlider(
      finishButtonText: 'Register/Login',
      onFinish: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const LoginPages(),
          ),
        );
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
      ),
      skipTextButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Image.asset(AppImages.ic1_url,height: 20,width: 20, // Provide path to your image asset
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Real Estate", style: TextStyle(
                      color:GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                      fontFamily: FontFamilyClass.fontfamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,

                  ),),
                ),
              ],
            ),),
          Text(
            'Skip',
            style: TextStyle(
              fontSize: 18,
              color: GradientHelper.getColorFromHex(ColorClass.blue),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Image.asset(AppImages.ic1_url,height: 20,width: 20, // Provide path to your image asset
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Real Estate", style: TextStyle(
                    color:GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                    fontFamily: FontFamilyClass.fontfamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,

                  ),),
                ),
              ],
            ),),
          Text(
            'Home',
            style: TextStyle(
              fontSize: 18,
              color: GradientHelper.getColorFromHex(ColorClass.blue),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      trailingFunction: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const Dashboard(),
          ),
        );
      },
      controllerColor: GradientHelper.getColorFromHex(ColorClass.blue),
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Container(

          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
          
            child: Image.asset(AppImages.m1_url,fit: BoxFit.cover,
              height: 400,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(AppImages.m2_url,
            fit: BoxFit.cover,
            height: 400,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(AppImages.m3_url,fit: BoxFit.cover,
            height: 400,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'On your way...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'to find the perfect looking Onboarding for your app?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'You’ve reached your destination.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Sliding with animation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Start now!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Where everything is possible and customize your onboarding.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
