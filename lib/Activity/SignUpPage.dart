import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Fonts/fontsclass.dart';
import 'package:realstateproject/Images/AppImage.dart';
import 'package:realstateproject/MutipleProvidersss/RegistrationProvider.dart';
import 'package:realstateproject/Route/RouteNames.dart';

import 'package:realstateproject/Utils/ContentsText.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
import 'package:realstateproject/Widgets/CustomButton.dart';
import 'package:realstateproject/Widgets/CustomButton2.dart';
import 'package:realstateproject/Widgets/PasswordsWidgets.dart';
import 'package:realstateproject/Widgets/SingUpDesignWidget.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<RegistrationProvider>(
        builder: (context, registrationProvider, child) {
        return Form(
          key: registrationProvider.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Singupdesignwidget(flag: '1',),
              Padding(
                padding: const EdgeInsets.fromLTRB(15,15,0,3),
                child: Row(children: [
                  Text("Create ",style: StyleClass.blackstyle,),
                  Text("Account ",style: StyleClass.redstyle,),

                ],),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15,0,0,0),
                child: Text("Signup to get stated",
                  style: StyleClass.black17style,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //--------------name
               Container(
                   margin: EdgeInsets.only(bottom: 10,right: 20,left: 20,top: 10),
                    decoration: BoxDecoration(
                      color: GradientHelper.getColorFromHex(ColorClass.lightEditText), // Light gray color
                      borderRadius: BorderRadius.circular(8.0), // Optional: adds rounded corners
                    ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 7),
                     child: TextFormField(
                      controller: registrationProvider.nameController,
                      keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: ContentText.fullname,
                          hintStyle: StyleClass.labelcolor14,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person,color: GradientHelper.getColorFromHex(
                            ColorClass.blue,), size: 20,),

                        ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
              ),)),
              //--------------email------------
              Container(
                margin: EdgeInsets.only(bottom: 10,right: 20,left: 20,top: 5),
                decoration: BoxDecoration(
                  color: GradientHelper.getColorFromHex(ColorClass.lightEditText), // Light gray color
                  borderRadius: BorderRadius.circular(8.0), // Optional: adds rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 7),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      else if(!value.contains("@"))
                      {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    controller: registrationProvider.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: ContentText.email,
                      hintStyle: StyleClass.labelcolor14,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email,color: GradientHelper.getColorFromHex(
                        ColorClass.blue,), size: 20,),
                      // Removes the default underline border
                    ),
                  ),
                ),
              ),
              //------------password----
              PasswordField(),
              //-------------------singup button --------------

              Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 10,right: 20,left: 20,top: 10),
                  decoration: BoxDecoration(
                    color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomeButton2(
                    onPressed: (){
                      registrationProvider.register(context);
                    },

                    title: registrationProvider.loading? "": "SignUp",
                    colors: GradientHelper.getColorFromHex(ColorClass.RED_COLOR), size: 16, isLoading: registrationProvider.loading,
                  )
              ),

              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.pushReplacementNamed(context, RouteNames.login_screen);
                },
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  const EdgeInsets.fromLTRB(8,8.0,3.0,8.0),
                        child: Text(ContentText.alreadyaccount,style: TextStyle(
                            color: ColorClass.greyColors,
                            fontFamily: FontFamilyClass.fontfamily,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,8.0,8.0,8.0),
                        child: Text('Log In',style: TextStyle(
                            color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                            fontFamily: FontFamilyClass.fontfamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
      )),
    );
  }
}
