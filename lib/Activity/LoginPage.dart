import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Activity/SignUpPage.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/Fonts/fontsclass.dart';
import 'package:realstateproject/Images/AppImage.dart';
import 'package:realstateproject/MutipleProvidersss/LoginProvider.dart';
import 'package:realstateproject/Utils/ContentsText.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
import 'package:realstateproject/Widgets/CustomButton.dart';
import 'package:realstateproject/Widgets/PasswordsWidgets.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<LoginProvider>(builder: (context,loginProvider,child){
          return Form(
              key: loginProvider.formKey,
              child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), // Adjust the radius to your preference
                    ),
                    child: Image.asset(AppImages.back_url, // Provide path to your image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,15,0,3),
                    child: Row(children: [
                      Text("Let's ",style: StyleClass.blackstyle,),
                      Text("Sign ",style: StyleClass.redstyle,),
                      Text("you ",style: StyleClass.blackstyle,),
                      Text("in",style: StyleClass.redstyle,),
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,0,0,0),
                    child: Text("Welcome Back,",
                      style: StyleClass.black17style,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //--------------email------------
                  Container(
                    margin: EdgeInsets.all(10),
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: ContentText.email,
                          hintStyle: StyleClass.textformstyle,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                          // Removes the default underline border
                        ),
                      ),
                    ),
                  ),
                  //------------password----
                  PasswordField(),
                  //--------------------forget password----------------
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,2.0,15.0,30),
                        child: Text(ContentText.forgetpassword,style: StyleClass.text17,),
                      )),
                  //-------------------login button --------------
                  Container(
                      height: 50,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                        borderRadius: BorderRadius.circular(10), // Adjust the radius to your preference
                      ),
                      child: CustomButton(onPressed: () {
                          loginProvider.login(context);
                      },
                        title: "Login",
                        colors: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),)),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          child: Divider(
                            height: 2,
                            color: ColorClass.greyColors,
                            thickness: 1,

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Or",
                            style: TextStyle(
                                color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                                fontWeight: FontWeight.bold,
                                fontFamily: FontFamilyClass.fontfamily,
                                fontSize: 18
                            ),),
                        ),
                        Expanded(
                          child: Container(
                            width: 150,
                            child: Divider(
                              height: 2,
                              color: ColorClass.greyColors,
                              thickness: 1,


                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration:  BoxDecoration(
                          color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR) ,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: CircleAvatar(
                              backgroundColor: ColorClass.whiteColors,
                              child: Image.asset(
                                  height: 20,
                                  width: 20,
                                  AppImages.google_url
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration:  BoxDecoration(
                          color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR) ,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () async{

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: CircleAvatar(
                              backgroundColor: ColorClass.whiteColors,
                              child: Image.asset(
                                  height: 20,
                                  width: 20,
                                  AppImages.facebook_url
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationPage(), // Navigate to your main screen
                        ),
                      );
                    },
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  const EdgeInsets.fromLTRB(8,8.0,3.0,8.0),
                            child: Text(ContentText.noaccount,style: TextStyle(
                                color: ColorClass.greyColors,
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,8.0,8.0,8.0),
                            child: Text(ContentText.register,style: TextStyle(
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
                  SizedBox(
                    height: 50,
                  )

                ],
              )
          ));
        },),
      ),
    );
  }
}

