import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/MutipleProvidersss/RegistrationProvider.dart';
import 'package:realstateproject/Utils/ContentsText.dart';
import 'package:realstateproject/Utils/StyleClass.dart';
import 'package:realstateproject/Widgets/CustomButton2.dart';
import 'package:realstateproject/Widgets/SingUpDesignWidget.dart';
class Forgetpasswordpage extends StatefulWidget {
  const Forgetpasswordpage({super.key});

  @override
  State<Forgetpasswordpage> createState() => _ForgetpasswordpageState();
}

class _ForgetpasswordpageState extends State<Forgetpasswordpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Consumer<RegistrationProvider>(
              builder: (context, registrationProvider, child) {
                return Form(
                  key: registrationProvider.formKey,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Singupdesignwidget(flag: '1',),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,0,3),
                          child: Row(children: [
                            Text("Forget ",style: StyleClass.blackstyle,),
                            Text("Password ",style: StyleClass.redstyle,),

                          ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                          child: Text("Don't worry we got you covered .please select a gmail recovery method below",
                            style: StyleClass.labelcolor14,
                          ),
                        ),


                        //--------------email------------
                        Container(
                          margin: EdgeInsets.only(bottom: 10,right: 20,left: 20,top: 80),
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

                        //-------------------forget button --------------

                        Container(
                            height: 50,
                            margin: EdgeInsets.only(bottom: 10,right: 20,left: 20,top: 10),
                            decoration: BoxDecoration(
                              color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CustomeButton2(
                              onPressed: () async{

                              },
                              title: registrationProvider.loading? "": ContentText.forgetpassword,
                              colors: GradientHelper.getColorFromHex(ColorClass.RED_COLOR), size: 16, isLoading: registrationProvider.loading,
                            )
                        ),
                        SizedBox(
                          height: 50,
                        ),

                      ],
                    ),
                  ),
                );
              }
          )),

    );
  }
}
