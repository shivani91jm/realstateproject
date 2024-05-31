import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/MutipleProvidersss/ChnagePasswordProvider.dart';
import 'package:realstateproject/Widgets/CustomButton.dart';
import 'package:realstateproject/Widgets/PasswordFieldLogin.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SingleChildScrollView(
            child: Consumer<ChangePasswordProvider>(builder: (context,changeProvider,child) {
              return Form(
                    key: changeProvider.formKey,
                    child: Container(
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //----password --
                    PasswordFieldLogin(),
                    //---------confirm passowrd------
                    PasswordFieldLogin(),
                    //-------------------login button --------------
                    Container(
                        height: 50,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: GradientHelper.getColorFromHex(ColorClass.RED_COLOR),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CustomButton(
                            title: changeProvider.loading? "": "Change Password",
                            colors: GradientHelper.getColorFromHex(ColorClass.RED_COLOR), size: 15,
                        )
                    ),

                  ]
                    ))
              );
            }
        )
    ));
  }
}
