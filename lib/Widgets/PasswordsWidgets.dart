import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Colors/ColorsClass.dart';
import 'package:realstateproject/Colors/GradientHelper.dart';
import 'package:realstateproject/MutipleProvidersss/RegistrationProvider.dart';
import 'package:realstateproject/Utils/ContentsText.dart';
import 'package:realstateproject/Utils/StyleClass.dart';

class PasswordField extends StatelessWidget {
  Provider? provider;
  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
      builder: (context, passwordVisibilityProvider, child) {
        return Container(
          margin: const EdgeInsets.fromLTRB(20,5,20,10),
          decoration: BoxDecoration(
            color: GradientHelper.getColorFromHex(ColorClass.lightEditText), // Light gray color
            borderRadius: BorderRadius.circular(8.0), // Optional: adds rounded corners
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 7),
            child: TextFormField(
              obscureText: !passwordVisibilityProvider.isPasswordVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                // Add password strength validation if needed
                return null;
              },
              controller: passwordVisibilityProvider.passwordController,
              decoration: InputDecoration(
                hintText: ContentText.password,
                hintStyle: StyleClass.labelcolor14,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.lock,color: GradientHelper.getColorFromHex(
                  ColorClass.blue,), size: 20,),
                suffixIcon: IconButton(
                  icon: Icon(passwordVisibilityProvider.isPasswordVisible ? Icons.visibility : Icons.visibility_off,color: GradientHelper.getColorFromHex(
                    ColorClass.blue,), size: 20,),
                  onPressed: () {
                    passwordVisibilityProvider.togglePasswordVisibility();
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
