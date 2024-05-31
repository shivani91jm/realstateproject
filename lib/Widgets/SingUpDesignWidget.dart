import 'package:flutter/material.dart';
import 'package:realstateproject/Activity/LoginPage.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Images/AppImage.dart';
class Singupdesignwidget extends StatelessWidget {
  String? flag;
   Singupdesignwidget({super.key,required this.flag});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        if(flag=="1")
          {
            Navigator.of(context).pop();
          }
      },
      child: Stack(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(AppImages.back_url,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child:   Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color:  GradientHelper.getColorFromHex(ColorClass.lightGrey_COLOR),
                borderRadius: BorderRadius.circular(70), // Adjust the radius to your preference
              ),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(Icons.arrow_back_ios_new,color:  Colors.black,size: 18,)
              ),
            ),)
        ],
      ),
    );
  }
}
